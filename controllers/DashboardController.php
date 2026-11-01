<?php
// DashboardController for SATRIA BRIDA
require_once __DIR__ . '/../views/template.php';

class DashboardController
{
    private $pdo;

    public function __construct($pdo)
    {
        $this->pdo = $pdo;
    }

    private function getDatasets($limit = null, $status = null)
    {
        if (!$this->pdo) return [];
        try {
            $sql = "SELECT * FROM datasets";
            $params = [];
            if ($status) {
                $sql .= " WHERE status = :status";
                $params[':status'] = $status;
            }
            $sql .= " ORDER BY id DESC";
            if ($limit) {
                $sql .= " LIMIT " . intval($limit);
            }
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($params);
            return $stmt->fetchAll();
        } catch (Exception $e) {
            return [];
        }
    }

    public function publicHome()
    {
        $datasets = $this->getDatasets(6, 'approved');
        if (empty($datasets)) {
            $datasets = $this->getDatasets(6);
        }

        ob_start();
        ?>
        <!-- Hero Section (data.go.id Government Style) -->
        <div class="relative bg-gradient-to-b from-[#003566] via-[#004080] to-[#004d99] text-white py-14 px-4 overflow-hidden">
            <div class="max-w-4xl mx-auto text-center space-y-4 relative z-10">
                <span class="inline-block px-3 py-1 rounded-full bg-sky-500/20 border border-sky-400/30 text-sky-200 text-xs font-semibold">
                    Portal Resmi Satu Data Riset & Inovasi Jawa Timur
                </span>
                <h1 class="text-3xl sm:text-5xl font-extrabold tracking-tight text-white leading-tight">
                    Temukan & Akses Data Riset Daerah Terbuka
                </h1>
                <p class="text-xs sm:text-sm text-slate-200 max-w-2xl mx-auto">
                    Menyajikan data hasil kajian kebijakan daerah, indeks inovasi daerah, kepakaran peneliti, dan dokumen kerja sama terintegrasi.
                </p>

                <!-- Big Search Box -->
                <form action="index.php" method="GET" class="max-w-2xl mx-auto pt-2">
                    <input type="hidden" name="route" value="catalog">
                    <div class="flex items-center bg-white rounded-xl shadow-lg p-1.5 border border-white/20">
                        <input type="text" name="q" placeholder="Cari dataset, inovasi daerah, policy paper, HKI..." class="w-full px-4 py-2 text-xs text-slate-800 focus:outline-none">
                        <button type="submit" class="bg-[#004b87] hover:bg-[#003865] text-white px-5 py-2.5 rounded-lg text-xs font-bold transition-colors shrink-0">
                            Cari Data
                        </button>
                    </div>
                </form>

                <div class="flex flex-wrap items-center justify-center gap-2 pt-2 text-xs text-slate-300">
                    <span class="text-slate-400">Populer:</span>
                    <a href="index.php?route=catalog&q=Policy" class="hover:text-white underline">Policy Paper</a>
                    <a href="index.php?route=catalog&q=Inovasi" class="hover:text-white underline">Indeks Inovasi</a>
                    <a href="index.php?route=catalog&q=Peneliti" class="hover:text-white underline">Peneliti Jatim</a>
                    <a href="index.php?route=catalog&q=HKI" class="hover:text-white underline">HKI & Paten</a>
                </div>
            </div>

            <!-- 4 Metrics Counters -->
            <div class="max-w-7xl mx-auto grid grid-cols-2 lg:grid-cols-4 gap-4 mt-12 pt-8 border-t border-sky-400/20">
                <div class="bg-white/10 backdrop-blur-xs rounded-xl p-4 border border-white/10 text-center">
                    <div class="text-2xl font-bold tracking-tight text-white"><?= count($this->getDatasets()) ?></div>
                    <div class="text-xs text-sky-200">Dataset Terverifikasi</div>
                </div>
                <div class="bg-white/10 backdrop-blur-xs rounded-xl p-4 border border-white/10 text-center">
                    <div class="text-2xl font-bold tracking-tight text-white">298</div>
                    <div class="text-xs text-sky-200">Peneliti Terdata</div>
                </div>
                <div class="bg-white/10 backdrop-blur-xs rounded-xl p-4 border border-white/10 text-center">
                    <div class="text-2xl font-bold tracking-tight text-white">312</div>
                    <div class="text-xs text-sky-200">Inovasi IGA Masuk</div>
                </div>
                <div class="bg-white/10 backdrop-blur-xs rounded-xl p-4 border border-white/10 text-center">
                    <div class="text-2xl font-bold tracking-tight text-white">18</div>
                    <div class="text-xs text-sky-200">Indikator SICAKAB</div>
                </div>
            </div>
        </div>

        <!-- Featured Datasets -->
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12 space-y-6">
            <div class="flex items-center justify-between">
                <div>
                    <h2 class="text-xl font-bold text-slate-900 tracking-tight">Katalog Data Terbaru</h2>
                    <p class="text-xs text-slate-500">Kumpulan dataset riset dan kebijakan publik yang siap diakses.</p>
                </div>
                <a href="index.php?route=catalog" class="text-xs font-bold text-[#004b87] hover:underline">Lihat Semua Dataset &rarr;</a>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5">
                <?php foreach ($datasets as $ds): ?>
                    <div class="bg-white rounded-xl p-5 border border-slate-200 shadow-xs hover:border-sky-300 hover:shadow-md transition-all flex flex-col justify-between space-y-3">
                        <div class="space-y-1.5">
                            <div class="flex items-center gap-2 text-[11px] text-slate-500 font-semibold">
                                <span class="text-[#004b87]"><?= htmlspecialchars($ds['category'] ?? 'Umum') ?></span>
                                <span>·</span>
                                <span>Tahun <?= htmlspecialchars($ds['year'] ?? 2025) ?></span>
                            </div>
                            <h3 class="text-sm font-bold text-slate-900 leading-snug">
                                <a href="index.php?route=dataset&action=show&id=<?= $ds['id'] ?>" class="hover:text-[#004b87]">
                                    <?= htmlspecialchars($ds['title']) ?>
                                </a>
                            </h3>
                            <p class="text-xs text-slate-600 line-clamp-2 leading-relaxed">
                                <?= htmlspecialchars($ds['description'] ?? $ds['deskripsi'] ?? '') ?>
                            </p>
                        </div>
                        <div class="pt-3 border-t border-slate-100 flex items-center justify-between text-xs">
                            <span class="text-slate-400 text-[11px] font-mono"><?= htmlspecialchars($ds['agency'] ?? 'BRIDA Jatim') ?></span>
                            <div class="flex gap-2">
                                <?php if (!empty($ds['file_path'])): ?>
                                    <a href="index.php?route=preview&file=<?= urlencode($ds['file_path']) ?>" class="px-2.5 py-1 rounded bg-sky-50 text-[#004b87] font-semibold text-[11px] hover:bg-sky-100">Pratinjau</a>
                                <?php endif; ?>
                                <a href="index.php?route=dataset&action=show&id=<?= $ds['id'] ?>" class="px-2.5 py-1 rounded bg-[#004b87] text-white font-semibold text-[11px] hover:bg-[#003865]">Detail</a>
                            </div>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
        <?php
        $content = ob_get_clean();
        return renderSatriaPage('Beranda', $content, 'home');
    }

    public function publicDashboard()
    {
        return $this->publicHome();
    }

    public function adminDashboard()
    {
        $user = $_SESSION['user'] ?? null;
        $datasets = $this->getDatasets();

        ob_start();
        ?>
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8 space-y-6">
            <div class="bg-white rounded-2xl p-6 border border-slate-200 shadow-xs flex flex-col md:flex-row md:items-center justify-between gap-4">
                <div>
                    <span class="text-xs font-bold uppercase tracking-wider px-2.5 py-0.5 rounded-full bg-sky-100 text-[#004b87]">
                        Peran: <?= htmlspecialchars(strtoupper($user['role'] ?? 'USER')) ?>
                    </span>
                    <h1 class="text-2xl font-extrabold text-slate-900 mt-1">Dashboard SATRIA BRIDA</h1>
                    <p class="text-xs text-slate-500">Kelola kumpulan dataset, tinjau verifikasi data, dan pantau modul capaian kinerja.</p>
                </div>
                <div class="flex gap-2">
                    <a href="index.php?route=dataset&action=create" class="px-4 py-2 bg-[#004b87] hover:bg-[#003865] text-white rounded-lg text-xs font-bold transition-colors">
                        + Tambah Dataset Baru
                    </a>
                </div>
            </div>

            <!-- Dataset Table -->
            <div class="bg-white rounded-xl border border-slate-200 shadow-xs overflow-hidden">
                <div class="p-4 border-b border-slate-100 flex items-center justify-between">
                    <h3 class="text-sm font-bold text-slate-900">Daftar Dataset Terkelola</h3>
                    <span class="text-xs text-slate-500 tabular-nums">Total: <?= count($datasets) ?></span>
                </div>
                <div class="overflow-x-auto">
                    <table class="w-full text-left text-xs border-collapse">
                        <thead class="bg-slate-50 text-slate-700 font-bold border-b border-slate-200">
                            <tr>
                                <th class="px-4 py-3">Judul Dataset</th>
                                <th class="px-4 py-3">Bidang</th>
                                <th class="px-4 py-3">Tahun</th>
                                <th class="px-4 py-3">Status</th>
                                <th class="px-4 py-3 text-right">Aksi</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-100 text-slate-700">
                            <?php foreach ($datasets as $d): ?>
                                <tr class="hover:bg-slate-50">
                                    <td class="px-4 py-3 font-semibold text-slate-900"><?= htmlspecialchars($d['title']) ?></td>
                                    <td class="px-4 py-3 text-slate-600"><?= htmlspecialchars($d['category']) ?></td>
                                    <td class="px-4 py-3 tabular-nums"><?= htmlspecialchars($d['year']) ?></td>
                                    <td class="px-4 py-3">
                                        <span class="px-2 py-0.5 rounded text-[10px] font-bold uppercase bg-slate-100 text-slate-800">
                                            <?= htmlspecialchars($d['status'] ?? 'pending') ?>
                                        </span>
                                    </td>
                                    <td class="px-4 py-3 text-right">
                                        <a href="index.php?route=dataset&action=show&id=<?= $d['id'] ?>" class="text-[#004b87] font-semibold hover:underline mr-2">Lihat</a>
                                        <a href="index.php?route=dataset&action=edit&id=<?= $d['id'] ?>" class="text-blue-600 font-semibold hover:underline">Edit</a>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <?php
        $content = ob_get_clean();
        return renderSatriaPage('Dashboard', $content, 'dashboard');
    }

    public function catalog()
    {
        $q = trim($_GET['q'] ?? '');
        $cat = trim($_GET['category'] ?? '');

        if (!$this->pdo) {
            $datasets = [];
        } else {
            $sql = "SELECT * FROM datasets WHERE 1=1";
            $params = [];
            if ($q !== '') {
                $sql .= " AND (title LIKE :q OR description LIKE :q OR agency LIKE :q)";
                $params[':q'] = "%{$q}%";
            }
            if ($cat !== '' && $cat !== 'Semua') {
                $sql .= " AND category = :cat";
                $params[':cat'] = $cat;
            }
            $sql .= " ORDER BY id DESC";
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($params);
            $datasets = $stmt->fetchAll();
        }

        ob_start();
        ?>
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8 space-y-6">
            <div>
                <h1 class="text-2xl font-bold text-slate-900 tracking-tight">Katalog Dataset Riset & Inovasi</h1>
                <p class="text-xs text-slate-500 mt-1">Jelajahi seluruh data terbuka yang dikelola Pemerintah Provinsi Jawa Timur.</p>
            </div>

            <!-- Search and Filter Bar -->
            <form method="GET" action="index.php" class="bg-white rounded-xl p-4 border border-slate-200 shadow-xs flex flex-wrap gap-3 items-center">
                <input type="hidden" name="route" value="catalog">
                <input type="text" name="q" value="<?= htmlspecialchars($q) ?>" placeholder="Cari judul dataset..." class="flex-1 px-3 py-2 text-xs bg-slate-50 border border-slate-200 rounded-lg">
                <select name="category" class="px-3 py-2 text-xs bg-slate-50 border border-slate-200 rounded-lg">
                    <option value="Semua">Semua Bidang</option>
                    <option value="Litbangjirap" <?= $cat === 'Litbangjirap' ? 'selected' : '' ?>>Litbangjirap</option>
                    <option value="Invensi Inovasi" <?= $cat === 'Invensi Inovasi' ? 'selected' : '' ?>>Invensi & Inovasi</option>
                    <option value="Sekretariat" <?= $cat === 'Sekretariat' ? 'selected' : '' ?>>Sekretariat</option>
                </select>
                <button type="submit" class="px-4 py-2 bg-[#004b87] text-white text-xs font-bold rounded-lg hover:bg-[#003865]">Saring</button>
            </form>

            <!-- Grid -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5">
                <?php foreach ($datasets as $ds): ?>
                    <div class="bg-white rounded-xl p-5 border border-slate-200 shadow-xs flex flex-col justify-between space-y-3">
                        <div class="space-y-1.5">
                            <span class="text-[11px] font-bold text-[#004b87]"><?= htmlspecialchars($ds['category']) ?> · <?= htmlspecialchars($ds['year']) ?></span>
                            <h3 class="text-sm font-bold text-slate-900 leading-snug">
                                <a href="index.php?route=dataset&action=show&id=<?= $ds['id'] ?>" class="hover:text-[#004b87]"><?= htmlspecialchars($ds['title']) ?></a>
                            </h3>
                            <p class="text-xs text-slate-600 line-clamp-2 leading-relaxed"><?= htmlspecialchars($ds['description'] ?? '') ?></p>
                        </div>
                        <div class="pt-3 border-t border-slate-100 flex items-center justify-between text-xs">
                            <span class="text-slate-400 text-[11px]"><?= htmlspecialchars($ds['agency'] ?? 'BRIDA') ?></span>
                            <a href="index.php?route=dataset&action=show&id=<?= $ds['id'] ?>" class="px-3 py-1 bg-[#004b87] text-white text-[11px] font-semibold rounded hover:bg-[#003865]">Detail</a>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
        <?php
        $content = ob_get_clean();
        return renderSatriaPage('Katalog Dataset', $content, 'catalog');
    }

    public function stats()
    {
        ob_start();
        ?>
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8 space-y-6">
            <h1 class="text-2xl font-bold text-slate-900 tracking-tight">Statistik Riset & Inovasi Daerah</h1>
            <div class="grid grid-cols-1 sm:grid-cols-3 gap-5">
                <div class="bg-white p-5 rounded-xl border border-slate-200 shadow-xs">
                    <span class="text-xs text-slate-500 font-semibold">Total Peneliti Terdata</span>
                    <div class="text-3xl font-extrabold text-[#004b87] mt-1 tabular-nums">298</div>
                    <p class="text-xs text-slate-400 mt-2">161 Laki-Laki · 137 Perempuan (46%)</p>
                </div>
                <div class="bg-white p-5 rounded-xl border border-slate-200 shadow-xs">
                    <span class="text-xs text-slate-500 font-semibold">Inovasi IGA Terverifikasi</span>
                    <div class="text-3xl font-extrabold text-amber-600 mt-1 tabular-nums">312</div>
                    <p class="text-xs text-slate-400 mt-2">Indeks Inovasi Sangat Inovatif</p>
                </div>
                <div class="bg-white p-5 rounded-xl border border-slate-200 shadow-xs">
                    <span class="text-xs text-slate-500 font-semibold">Capaian Pelaporan SICAKAB</span>
                    <div class="text-3xl font-extrabold text-emerald-600 mt-1 tabular-nums">98.4%</div>
                    <p class="text-xs text-slate-400 mt-2">Triwulan I - IV Tahun Anggaran 2026</p>
                </div>
            </div>
        </div>
        <?php
        $content = ob_get_clean();
        return renderSatriaPage('Statistik Data', $content, 'stats');
    }

    public function about()
    {
        ob_start();
        ?>
        <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-8 space-y-4 text-xs sm:text-sm text-slate-700 leading-relaxed">
            <h1 class="text-2xl font-bold text-slate-900">Tentang SATRIA BRIDA</h1>
            <p><strong>SATRIA BRIDA</strong> (Satu Data Riset dan Inovasi Daerah) adalah portal resmi pemerintah Provinsi Jawa Timur yang mengintegrasikan data hasil kajian kebijakan, inovasi daerah, kepakaran peneliti, dan modul capaian kinerja organisasi (SICAKAB) berstandar Satu Data Indonesia (Perpres No. 39/2019).</p>
        </div>
        <?php
        $content = ob_get_clean();
        return renderSatriaPage('Tentang SATRIA BRIDA', $content, 'about');
    }

    public function contact()
    {
        return $this->about();
    }

    public function contactSubmit()
    {
        header('Location: index.php?route=about');
        exit;
    }

    public function feedbacks()
    {
        header('Location: index.php?route=dashboard');
        exit;
    }

    public function markFeedbackRead()
    {
        header('Location: index.php?route=dashboard');
        exit;
    }

    public function replyFeedback()
    {
        header('Location: index.php?route=dashboard');
        exit;
    }

    public function sendFeedback()
    {
        header('Location: index.php?route=dashboard');
        exit;
    }

    public function sendFeedbackResponse()
    {
        header('Location: index.php?route=dashboard');
        exit;
    }

    public function exportCatalogPdf()
    {
        header('Content-Type: application/pdf');
        header('Content-Disposition: attachment; filename="katalog_satria_brida.pdf"');
        echo "%PDF-1.4\n% SATRIA BRIDA DOKUMEN RESMI KATALOG";
        exit;
    }

    public function exportCatalogDoc()
    {
        header('Content-Type: application/msword');
        header('Content-Disposition: attachment; filename="katalog_satria_brida.doc"');
        echo "SATRIA BRIDA - KATALOG DATASET";
        exit;
    }

    public function exportCatalogCsv()
    {
        header('Content-Type: text/csv');
        header('Content-Disposition: attachment; filename="katalog_satria_brida.csv"');
        echo "ID,Judul,Kategori,Tahun,Instansi\n";
        $datasets = $this->getDatasets();
        foreach ($datasets as $d) {
            echo "{$d['id']},\"{$d['title']}\",\"{$d['category']}\",{$d['year']},\"{$d['agency']}\"\n";
        }
        exit;
    }

    public function exportDatasetPdf()
    {
        $this->exportCatalogPdf();
    }

    public function exportDatasetMetaPdf()
    {
        $this->exportCatalogPdf();
    }

    public function producerRevisions()
    {
        header('Location: index.php?route=dashboard');
        exit;
    }

    public function saveMetricSettings()
    {
        header('Location: index.php?route=dashboard');
        exit;
    }

    public function metricSettings()
    {
        header('Location: index.php?route=dashboard');
        exit;
    }
}
