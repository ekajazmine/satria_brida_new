<?php
session_start();
require_once __DIR__ . '/middleware/auth.php';
require_once __DIR__ . '/config/config.php';
require_once __DIR__ . '/config/db.php';

spl_autoload_register(function ($class) {
    $paths = [
        __DIR__ . '/controllers/' . $class . '.php',
        __DIR__ . '/models/' . $class . '.php',
    ];
    foreach ($paths as $path) {
        if (file_exists($path)) {
            require_once $path;
            return;
        }
    }
});

$route = isset($_GET['route']) ? trim($_GET['route']) : 'home';
$method = $_SERVER['REQUEST_METHOD'];

function requireAuth($roles = [])
{
    if (!isset($_SESSION['user'])) {
        header('Location: index.php?route=login');
        exit;
    }
    if ($roles && !in_array($_SESSION['user']['role'], $roles)) {
        header('Location: index.php?route=dashboard');
        exit;
    }
}

// Direktori di luar uploads/datasets yang boleh diakses lewat route preview/download/download_word_pdf.
// Berisi template publik dan file Guide Book (baik file bawaan di assets/pdf maupun hasil upload
// admin di uploads/guidebook) yang memang tidak berisi data rahasia.
function publicDownloadWhitelistDirs()
{
    return [
        realpath(__DIR__ . '/assets/templates'),
        realpath(__DIR__ . '/assets/pdf'),
        realpath(UPLOAD_GUIDEBOOK_PATH),
    ];
}

// Guide Book sengaja didesain bisa dilihat publik dari halaman utama SEBELUM login
// (lihat views/public/home.php & views/admin/guidebook.php), baik itu file bawaan
// di assets/pdf maupun file hasil upload admin di uploads/guidebook. Fungsi ini
// dipakai untuk mengecualikan file Guide Book dari wajib-login di route preview/download.
function isPubliclyViewableFile($filePath)
{
    $publicDirs = array_filter([
        realpath(__DIR__ . '/assets/pdf'),
        realpath(UPLOAD_GUIDEBOOK_PATH),
    ]);
    foreach ($publicDirs as $dir) {
        if ($dir && strpos($filePath, $dir) === 0) {
            return true;
        }
    }
    return false;
}

// Menentukan path file fisik yang valid untuk diproses oleh route preview/download/download_word_pdf.
// Dulu route ini menerima kandidat "__DIR__ . '/' . $file" tanpa batasan direktori, sehingga file
// sensitif seperti .env atau config.php ikut bisa diakses. Sekarang kandidat di luar uploads/datasets
// dibatasi hanya ke folder whitelist di atas.
function resolveSecureDownloadPath($file)
{
    if ($file === '' || strpos($file, '..') !== false || strpos($file, '\\') !== false) {
        return null;
    }
    $uploadCandidate = realpath(UPLOAD_DATASETS_PATH . '/' . $file);
    if ($uploadCandidate && is_file($uploadCandidate) && strpos($uploadCandidate, realpath(UPLOAD_DATASETS_PATH)) === 0) {
        return $uploadCandidate;
    }
    $rootCandidate = realpath(__DIR__ . '/' . $file);
    if ($rootCandidate && is_file($rootCandidate)) {
        foreach (publicDownloadWhitelistDirs() as $dir) {
            if ($dir && strpos($rootCandidate, $dir) === 0) {
                return $rootCandidate;
            }
        }
    }
    return null;
}

// Otorisasi akses ke file yang di-resolve resolveSecureDownloadPath().
// - Wajib login.
// - File dataset (di dalam uploads/datasets): dicek per-divisi lewat DatasetPermission::canAccessFile
//   (super_admin, pimpinan, verifikator = akses semua; produsen/produsen_data = data divisinya saja).
// - File di folder whitelist publik (template): cukup login (tidak berisi data rahasia).
function authorizeSecureDownload($pdo, $filePath, $allowGuestPreview = false)
{
    if (isPubliclyViewableFile($filePath)) return true;
    if (!isset($_SESSION['user'])) {
        // Katalog dataset publik (route=catalog): pengunjung yang belum login tetap
        // boleh MELIHAT (preview) file di browser, supaya pengalamannya setara dengan
        // pengguna yang sudah login. Ini HANYA berlaku untuk aksi preview
        // ($allowGuestPreview = true, dikirim dari route 'preview'); aksi unduh
        // (route 'download') tetap wajib login seperti sebelumnya.
        return $allowGuestPreview;
    }
    $datasetsDir = realpath(UPLOAD_DATASETS_PATH);
    if ($datasetsDir && strpos($filePath, $datasetsDir) === 0) {
        return DatasetPermission::canAccessFile($pdo, $_SESSION['user'], basename($filePath));
    }
    // Di luar folder dataset, berarti sudah lolos whitelist folder publik pada resolveSecureDownloadPath().
    return true;
}

switch ($route) {
    case 'home':
        $controller = new DashboardController($pdo);
        echo $controller->publicHome();
        break;
    case 'dashboard':
        if (isset($_SESSION['user'])) {
            $controller = new DashboardController($pdo);
            echo $controller->adminDashboard();
        } else {
            $controller = new DashboardController($pdo);
            echo $controller->publicDashboard();
        }
        break;
    case 'login':
        $controller = new AuthController($pdo);
        if ($method === 'POST') {
            $controller->login();
        } else {
            echo $controller->loginForm();
        }
        break;
    case 'setup':
        $controller = new AuthController($pdo);
        if ($method === 'POST') {
            $controller->setup();
        } else {
            echo $controller->loginForm();
        }
        break;
    case 'logout':
        $controller = new AuthController($pdo);
        $controller->logout();
        break;
    case 'catalog':
        $controller = new DashboardController($pdo);
        echo $controller->catalog();
        break;
    case 'feedbacks':
        checkRoles(['super_admin', 'verifikator', 'produsen_data', 'produsen', 'pimpinan']);
        $controller = new DashboardController($pdo);
        if ($method === 'POST' && (($_GET['action'] ?? '') === 'read')) {
            $controller->markFeedbackRead();
        } elseif ($method === 'POST' && (($_GET['action'] ?? '') === 'reply')) {
            $controller->replyFeedback();
        } elseif ($method === 'POST' && (($_GET['action'] ?? '') === 'send_feedback')) {
            $controller->sendFeedback();
        } elseif ($method === 'POST' && (($_GET['action'] ?? '') === 'send_response')) {
            $controller->sendFeedbackResponse();
        } else {
            echo $controller->feedbacks();
        }
        break;
    case 'deadlines':
        checkAdmin();
        $controller = new DeadlineController($pdo);
        $action = isset($_GET['action']) ? $_GET['action'] : 'index';
        if ($method === 'POST') {
            if ($action === 'store') $controller->store();
            elseif ($action === 'update') $controller->update();
            elseif ($action === 'delete') $controller->destroy();
            else echo $controller->index();
        } else {
            echo $controller->index();
        }
        break;
    case 'catalog_export':
        $controller = new DashboardController($pdo);
        $type = isset($_GET['type']) ? strtolower(trim($_GET['type'])) : 'csv';
        if ($type === 'pdf') {
            $controller->exportCatalogPdf();
        } elseif ($type === 'doc') {
            $controller->exportCatalogDoc();
        } else {
            $controller->exportCatalogCsv();
        }
        break;
    case 'dataset_export':
        $controller = new DashboardController($pdo);
        $type = isset($_GET['type']) ? strtolower(trim($_GET['type'])) : 'pdf';
        if ($type === 'pdf') {
            $controller->exportDatasetPdf();
        } else {
            http_response_code(400);
            echo 'Bad Request';
        }
        break;
    case 'dataset_meta_export':
        $controller = new DashboardController($pdo);
        $type = isset($_GET['type']) ? strtolower(trim($_GET['type'])) : 'pdf';
        if ($type === 'pdf') {
            $controller->exportDatasetMetaPdf();
        } else {
            http_response_code(400);
            echo 'Bad Request';
        }
        break;
    case 'preview':
        $file = isset($_GET['file']) ? trim($_GET['file']) : '';
        $filePath = resolveSecureDownloadPath($file);
        if ($filePath === null) {
            http_response_code(404);
            echo 'File tidak ditemukan';
            break;
        }
        // Preview boleh diakses tanpa login (lihat authorizeSecureDownload()) -
        // khusus untuk katalog dataset publik. Aksi unduh (route 'download') di
        // bawah tetap wajib checkLogin().
        if (!authorizeSecureDownload($pdo, $filePath, true)) {
            http_response_code(403);
            echo 'Anda tidak memiliki akses untuk melihat data ini';
            break;
        }
        $ext = strtolower(pathinfo($filePath, PATHINFO_EXTENSION));
        $fname = basename($filePath);
        if ($ext === 'pdf') {
            header('Content-Type: application/pdf');
            header('Content-Disposition: inline');
            readfile($filePath);
            exit;
        } elseif ($ext === 'csv') {
            $fh = fopen($filePath, 'r');
            if ($fh === false) { echo 'Gagal membaca file'; exit; }
            $rows = [];
            while (($row = fgetcsv($fh)) !== false) { $rows[] = $row; }
            fclose($fh);
            $header = $rows ? array_shift($rows) : [];
            echo '<!DOCTYPE html><html><head><meta charset="UTF-8"><title>' . htmlspecialchars($fname) . '</title>';
            echo '<style>body{font-family:Arial,sans-serif;padding:20px}table{border-collapse:collapse;width:100%}th,td{border:1px solid #ccc;padding:6px 10px;text-align:left;font-size:13px}th{background:#f1f5f9;position:sticky;top:0}</style>';
            echo '</head><body><h3>' . htmlspecialchars($fname) . '</h3><table><thead><tr>';
            foreach ($header as $h) { echo '<th>' . htmlspecialchars($h) . '</th>'; }
            echo '</tr></thead><tbody>';
            foreach ($rows as $row) {
                echo '<tr>';
                foreach ($row as $cell) { echo '<td>' . htmlspecialchars($cell) . '</td>'; }
                echo '</tr>';
            }
            echo '</tbody></table></body></html>';
            exit;
        } elseif (in_array($ext, ['xls', 'xlsx'])) {
            $html = '<!DOCTYPE html><html><head><meta charset="UTF-8"><title>' . htmlspecialchars($fname) . '</title>';
            $html .= '<style>body{font-family:Arial,sans-serif;padding:20px}table{border-collapse:collapse;width:100%}th,td{border:1px solid #ccc;padding:6px 10px;text-align:left;font-size:13px}th{background:#f1f5f9;position:sticky;top:0}</style>';
            $html .= '</head><body><h3>' . htmlspecialchars($fname) . '</h3>';
            $vendor = __DIR__ . '/vendor/autoload.php';
            if (file_exists($vendor)) {
                require_once $vendor;
                if (class_exists(\PhpOffice\PhpSpreadsheet\IOFactory::class)) {
                    try {
                        $spreadsheet = \PhpOffice\PhpSpreadsheet\IOFactory::load($filePath);
                        foreach ($spreadsheet->getAllSheets() as $sheet) {
                            $html .= '<h4>' . htmlspecialchars($sheet->getTitle()) . '</h4><table><thead><tr>';
                            $highestRow = $sheet->getHighestRow();
                            $highestCol = $sheet->getHighestColumn();
                            $colRange = \PhpOffice\PhpSpreadsheet\Cell\Coordinate::columnIndexFromString($highestCol);
                            $firstRow = true;
                            for ($row = 1; $row <= $highestRow; $row++) {
                                echo '';
                                if ($firstRow) { $html .= '</tr></thead><tbody>'; $firstRow = false; }
                                $html .= '<tr>';
                                for ($col = 1; $col <= $colRange; $col++) {
                                    $cell = $sheet->getCellByColumnAndRow($col, $row);
                                    $val = $cell->getValue();
                                    $html .= '<td>' . htmlspecialchars((string)$val) . '</td>';
                                }
                                $html .= '</tr>';
                            }
                            $html .= '</tbody></table>';
                        }
                    } catch (\Throwable $e) {
                        $html .= '<p class="text-danger">Gagal membaca Excel: ' . htmlspecialchars($e->getMessage()) . '</p>';
                    }
                } else {
                    $html .= '<p class="text-danger">PhpSpreadsheet belum terpasang.</p>';
                }
            } else {
                $html .= '<p class="text-danger">Library belum terpasang.</p>';
            }
            $html .= '</body></html>';
            header('Content-Type: text/html; charset=utf-8');
            echo $html;
            exit;
        } elseif (in_array($ext, ['doc', 'docx'])) {
            $vendor = __DIR__ . '/vendor/autoload.php';
            if (file_exists($vendor)) { require_once $vendor; }
            if ($ext === 'docx' && class_exists(\PhpOffice\PhpWord\IOFactory::class) && class_exists(\Dompdf\Dompdf::class)) {
                try {
                    $phpWord = \PhpOffice\PhpWord\IOFactory::load($filePath);
                    $writer = \PhpOffice\PhpWord\IOFactory::createWriter($phpWord, 'HTML');
                    ob_start();
                    $writer->save('php://output');
                    $htmlContent = ob_get_clean();
                    $htmlContent = '<h3 style="font-family:Arial;margin:0 0 12px 0">' . htmlspecialchars($fname) . '</h3>' . $htmlContent;
                    $dompdf = new \Dompdf\Dompdf();
                    $dompdf->loadHtml($htmlContent, 'UTF-8');
                    $dompdf->setPaper('A4', 'portrait');
                    $dompdf->render();
                    header('Content-Type: application/pdf');
                    header('Content-Disposition: inline');
                    echo $dompdf->output();
                    exit;
                } catch (\Throwable $e) {
                    header('Content-Type: application/msword');
                    header('Content-Disposition: inline');
                    header('Content-Length: ' . filesize($filePath));
                    readfile($filePath);
                    exit;
                }
            } else {
                header('Content-Type: application/msword');
                header('Content-Disposition: inline');
                header('Content-Length: ' . filesize($filePath));
                readfile($filePath);
                exit;
            }
        } else {
            header('Content-Type: application/octet-stream');
            header('Content-Disposition: inline');
            header('Content-Length: ' . filesize($filePath));
            readfile($filePath);
            exit;
        }
        break;
    case 'download':
        checkLogin();
        $file = isset($_GET['file']) ? trim($_GET['file']) : '';
        $filePath = resolveSecureDownloadPath($file);
        if ($filePath === null) {
            http_response_code(404);
            echo 'File tidak ditemukan';
            break;
        }
        if (!authorizeSecureDownload($pdo, $filePath)) {
            http_response_code(403);
            echo 'Anda tidak memiliki akses untuk mengunduh data ini';
            break;
        }
        $ext = strtolower(pathinfo($filePath, PATHINFO_EXTENSION));
        $mimeMap = [
            'csv'  => 'text/csv',
            'pdf'  => 'application/pdf',
            'xls'  => 'application/vnd.ms-excel',
            'xlsx' => 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
            'doc'  => 'application/msword',
            'docx' => 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
            'zip'  => 'application/zip',
        ];
        $mime = $mimeMap[$ext] ?? 'application/octet-stream';
        header('Content-Type: ' . $mime);
        header('Content-Disposition: attachment; filename="' . basename($filePath) . '"');
        header('Content-Length: ' . filesize($filePath));
        header('Cache-Control: no-cache');
        readfile($filePath);
        exit;
    case 'download_word_pdf':
        checkLogin();
        $file = isset($_GET['file']) ? trim($_GET['file']) : '';
        $filePath = resolveSecureDownloadPath($file);
        if ($filePath === null) {
            http_response_code(404);
            echo 'File tidak ditemukan';
            break;
        }
        if (!authorizeSecureDownload($pdo, $filePath)) {
            http_response_code(403);
            echo 'Anda tidak memiliki akses untuk mengunduh data ini';
            break;
        }
        $vendor = __DIR__ . '/vendor/autoload.php';
        if (file_exists($vendor)) { require_once $vendor; }
        $extDl = strtolower(pathinfo($filePath, PATHINFO_EXTENSION));
        if ($extDl === 'docx' && class_exists(\PhpOffice\PhpWord\IOFactory::class) && class_exists(\Dompdf\Dompdf::class)) {
            try {
                $phpWord = \PhpOffice\PhpWord\IOFactory::load($filePath);
                $writer = \PhpOffice\PhpWord\IOFactory::createWriter($phpWord, 'HTML');
                ob_start();
                $writer->save('php://output');
                $htmlContent = ob_get_clean();
                $fname = pathinfo($filePath, PATHINFO_FILENAME);
                $htmlContent = '<h3 style="font-family:Arial;margin:0 0 12px 0">' . htmlspecialchars($fname) . '</h3>' . $htmlContent;
                $dompdf = new \Dompdf\Dompdf();
                $dompdf->loadHtml($htmlContent, 'UTF-8');
                $dompdf->setPaper('A4', 'portrait');
                $dompdf->render();
                header('Content-Type: application/pdf');
                header('Content-Disposition: attachment; filename="' . $fname . '.pdf"');
                echo $dompdf->output();
                exit;
            } catch (\Throwable $e) {
                header('Content-Type: application/msword');
                header('Content-Disposition: attachment; filename="' . basename($filePath) . '"');
                header('Content-Length: ' . filesize($filePath));
                readfile($filePath);
                exit;
            }
        } else {
            header('Content-Type: application/msword');
            header('Content-Disposition: attachment; filename="' . basename($filePath) . '"');
            header('Content-Length: ' . filesize($filePath));
            readfile($filePath);
            exit;
        }
        break;
    case 'stats':
        $controller = new DashboardController($pdo);
        echo $controller->stats();
        break;
    case 'about':
        $controller = new DashboardController($pdo);
        echo $controller->about();
        break;
    case 'contact':
        $controller = new DashboardController($pdo);
        if ($method === 'POST') {
            $controller->contactSubmit();
        } else {
            echo $controller->contact();
        }
        break;
    case 'dataset':
        $action = isset($_GET['action']) ? $_GET['action'] : 'index';
        if ($action !== 'show' && $action !== 'feedback' && $action !== 'submit_revision') {
            checkRoles(['super_admin', 'produsen_data']);
        }
        if ($method === 'POST' && $action === 'feedback') {
            if (!isset($_SESSION['user']) || !in_array(strtolower(trim($_SESSION['user']['role'])), ['pimpinan', 'super_admin'])) {
                header('Location: index.php?route=login');
                exit;
            }
        }
        $controller = new DatasetController($pdo);
        if ($method === 'POST') {
            if ($action === 'store') $controller->store();
            elseif ($action === 'update') $controller->update();
            elseif ($action === 'delete') $controller->destroy();
            elseif ($action === 'delete_theme') $controller->destroyTheme();
            elseif ($action === 'delete_file') $controller->deleteFile();
            elseif ($action === 'delete_doc') $controller->deleteDoc();
            elseif ($action === 'delete_pdf') $controller->deletePdf();
            elseif ($action === 'feedback') $controller->submitFeedback();
            elseif ($action === 'submit_revision') $controller->submitRevision();
            else echo $controller->index();
        } else {
            if ($action === 'create') echo $controller->create();
            elseif ($action === 'edit') echo $controller->edit();
            elseif ($action === 'show') echo $controller->show();
            elseif ($action === 'years') echo $controller->years();
            else echo $controller->index();
        }
        break;
    case 'users':
        
        checkAdmin();
        $controller = new UserController($pdo);
        if ($method === 'POST') {
            $action = isset($_GET['action']) ? $_GET['action'] : 'index';
            if ($action === 'store') $controller->store();
            elseif ($action === 'update') $controller->update();
            elseif ($action === 'delete') $controller->destroy();
            elseif ($action === 'reset') $controller->resetPassword();
            else echo $controller->index();
        } else {
            $action = isset($_GET['action']) ? $_GET['action'] : 'index';
            if ($action === 'create') echo $controller->create();
            elseif ($action === 'edit') echo $controller->edit();
            else echo $controller->index();
        }
        break;
    case 'guidebook':
        checkAdmin();
        $controller = new GuideBookController($pdo);
        if ($method === 'POST') {
            $controller->upload();
        } else {
            echo $controller->form();
        }
        break;
    case 'tanda-tangan':
        checkAdmin();
        $controller = new SignatureController($pdo);
        if ($method === 'POST') {
            $controller->save();
        } else {
            echo $controller->form();
        }
        break;
    case 'logs':
        checkAdmin();
        $controller = new LogController($pdo);
        echo $controller->index();
        break;
    case 'pesan-masuk':
        checkAdmin();
        $controller = new LogController($pdo);
        echo $controller->inbox();
        break;
    case 'approvals':
        checkRoles(['super_admin', 'verifikator']);
        $controller = new DatasetController($pdo);
        if ($method === 'POST') {
            $action = isset($_GET['action']) ? $_GET['action'] : '';
            if ($action === 'approve') $controller->approve();
            elseif ($action === 'revise') $controller->revise();
            else echo $controller->approvals();
        } else {
            echo $controller->approvals();
        }
        break;
    case 'revisions':
        checkRoles(['produsen_data', 'produsen']);
        $controller = new DashboardController($pdo);
        echo $controller->producerRevisions();
        break;
    case 'metadata':
        checkRoles(['super_admin', 'produsen_data']);
        $action = isset($_GET['action']) ? $_GET['action'] : 'templates';
        if ($action === 'import') {
            $controller = new MetadataController($pdo);
            if ($method === 'POST') {
                echo $controller->importProcess();
            } else {
                echo $controller->importForm();
            }
        } else {
            $controller = new DatasetController($pdo);
            echo $controller->metadataTemplates();
        }
        break;
    case 'integration':
        checkRoles(['super_admin', 'produsen_data']);
        $controller = new IntegrationController($pdo);
        echo $controller->index();
        break;
    case 'dashboard_metrics':
        checkRoles(['super_admin']);
        $controller = new DashboardController($pdo);
        if ($method === 'POST') {
            $controller->saveMetricSettings();
        } else {
            echo $controller->metricSettings();
        }
        break;
    case 'verifikator':
        checkVerifikator();
        $controller = new DashboardController($pdo);
        echo $controller->adminDashboard();
        break;
    case 'si-cakab':
        checkLogin();
        $controller = new SiCakabController($pdo);
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $action = $_GET['action'] ?? '';
            if ($action === 'submit' || $action === 'update') {
                echo $controller->store();
            } elseif ($action === 'submit_tl') {
                echo $controller->submitTindakLanjut();
            } elseif ($action === 'submit_tl_hasil') {
                echo $controller->submitHasilTindakLanjut();
            } elseif ($action === 'delete') {
                echo $controller->delete();
            } else {
                echo $controller->dashboard();
            }
        } else {
            $action = $_GET['action'] ?? '';
            if ($action === 'create' || $action === 'edit') {
                echo $controller->form();
            } elseif ($action === 'detail') {
                echo $controller->detail();
            } elseif ($action === 'export_pdf') {
                $controller->exportPdf();
            } elseif ($action === 'export_all_pdf') {
                $controller->exportYearlyPdf();
            } else {
                echo $controller->dashboard();
            }
        }
        break;
    case 'si-cakab-target':
        checkLogin();
        $controller = new SiCakabController($pdo);
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $action = $_GET['action'] ?? '';
            if ($action === 'store') {
                echo $controller->storeTarget();
            } elseif ($action === 'update') {
                echo $controller->updateTarget();
            } elseif ($action === 'delete') {
                echo $controller->deleteTarget();
            } else {
                echo $controller->setTargetForm();
            }
        } else {
            echo $controller->setTargetForm();
        }
        break;
    case 'si-cakab-evaluasi':
        checkLogin();
        $controller = new SiCakabController($pdo);
        echo $controller->adminList();
        break;
    case 'si-cakab-evaluasi-detail':
        checkLogin();
        $controller = new SiCakabController($pdo);
        if ($_SERVER['REQUEST_METHOD'] === 'POST' && (($_GET['action'] ?? '') === 'submit_evaluasi')) {
            echo $controller->adminSubmitEvaluasi();
        } else {
            echo $controller->adminDetail();
        }
        break;
    case 'si-cakab-dropdown':
        checkSicakabManage();
        $controller = new SicakabDropdownController($pdo);
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $action = $_GET['action'] ?? '';
            if ($action === 'store') {
                echo $controller->store();
            } elseif ($action === 'update') {
                echo $controller->update();
            } elseif ($action === 'delete') {
                echo $controller->delete();
            } else {
                echo $controller->manage();
            }
        } else {
            echo $controller->manage();
        }
        break;
    case 'si-cakab-satuan':
        checkSicakabManage();
        $controller = new SicakabDropdownController($pdo);
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $action = $_GET['action'] ?? '';
            if ($action === 'store') {
                echo $controller->storeSatuan();
            } elseif ($action === 'update') {
                echo $controller->updateSatuan();
            } elseif ($action === 'toggle') {
                echo $controller->toggleSatuan();
            } elseif ($action === 'delete') {
                echo $controller->deleteSatuan();
            } else {
                echo $controller->manageSatuan();
            }
        } else {
            echo $controller->manageSatuan();
        }
        break;
    default:
        if (strpos($route, 'api/') === 0) {
            $controller = new ApiController($pdo);
            header('Content-Type: application/json');
            if ($route === 'api/datasets') {
                echo json_encode($controller->datasets());
            } elseif ($route === 'api/inovasi') {
                echo json_encode($controller->inovasi());
            } elseif ($route === 'api/peneliti') {
                echo json_encode($controller->peneliti());
            } elseif ($route === 'api/peneliti_gender') {
                echo json_encode($controller->penelitiGender());
            } elseif ($route === 'api/metric_series') {
                echo json_encode($controller->metricSeries($_GET['type'] ?? ''));
            } elseif ($route === 'api/metric_by_bidang') {
                echo json_encode($controller->metricByBidang($_GET['type'] ?? ''));
            } elseif ($route === 'api/datasets_by_bidang') {
                echo json_encode($controller->datasetsByBidang());
            } elseif ($route === 'api/catalog_detail') {
                $id = intval($_GET['id'] ?? 0);
                echo json_encode($id > 0 ? $controller->catalogDetail($id) : null);
            } else {
                http_response_code(404);
                echo json_encode(['error' => 'Not Found']);
            }
        } else {
            http_response_code(404);
            echo 'Not Found';
        }
        break;
}