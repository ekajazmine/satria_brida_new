<?php
// DatasetController for SATRIA BRIDA
require_once __DIR__ . '/../views/template.php';

class DatasetController
{
    private $pdo;

    public function __construct($pdo)
    {
        $this->pdo = $pdo;
    }

    public function index()
    {
        header('Location: index.php?route=catalog');
        exit;
    }

    public function show()
    {
        $id = intval($_GET['id'] ?? 0);
        $dataset = null;
        if ($this->pdo) {
            $stmt = $this->pdo->prepare("SELECT * FROM datasets WHERE id = :id LIMIT 1");
            $stmt->execute([':id' => $id]);
            $dataset = $stmt->fetch();
        }

        if (!$dataset) {
            header('Location: index.php?route=catalog');
            exit;
        }

        ob_start();
        ?>
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8 space-y-6">
            <a href="index.php?route=catalog" class="text-xs font-semibold text-[#004b87] hover:underline">&larr; Kembali ke Katalog Data</a>
            
            <div class="bg-white rounded-2xl p-6 border border-slate-200 shadow-xs space-y-4">
                <div class="flex items-center gap-2 text-xs text-slate-500">
                    <span class="font-bold text-[#004b87]"><?= htmlspecialchars($dataset['category']) ?></span>
                    <span>·</span>
                    <span><?= htmlspecialchars($dataset['agency'] ?? 'BRIDA Jatim') ?></span>
                    <span>·</span>
                    <span>Tahun <?= htmlspecialchars($dataset['year']) ?></span>
                </div>
                <h1 class="text-2xl sm:text-3xl font-extrabold text-slate-900 leading-tight">
                    <?= htmlspecialchars($dataset['title']) ?>
                </h1>
                <p class="text-xs sm:text-sm text-slate-600 leading-relaxed max-w-4xl">
                    <?= htmlspecialchars($dataset['description'] ?? $dataset['deskripsi'] ?? '') ?>
                </p>

                <div class="pt-4 border-t border-slate-100 flex gap-2">
                    <?php if (!empty($dataset['file_path'])): ?>
                        <a href="index.php?route=preview&file=<?= urlencode($dataset['file_path']) ?>" class="px-4 py-2 bg-emerald-600 hover:bg-emerald-700 text-white rounded-lg text-xs font-bold transition-colors">
                            Pratinjau Lembar Kerja (CSV)
                        </a>
                        <a href="index.php?route=download&file=<?= urlencode($dataset['file_path']) ?>" class="px-4 py-2 bg-slate-100 hover:bg-slate-200 text-slate-800 rounded-lg text-xs font-bold transition-colors">
                            Unduh File
                        </a>
                    <?php endif; ?>
                </div>
            </div>

            <!-- Metadata Box -->
            <div class="bg-white rounded-2xl p-6 border border-slate-200 shadow-xs space-y-4">
                <h3 class="text-base font-bold text-slate-900 border-b border-slate-100 pb-3">Standar Metadata SDI</h3>
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 text-xs">
                    <div>
                        <span class="text-slate-400 block text-[11px]">Peneliti / Penanggung Jawab:</span>
                        <span class="font-semibold text-slate-800"><?= htmlspecialchars($dataset['researcher'] ?? '-') ?></span>
                    </div>
                    <div>
                        <span class="text-slate-400 block text-[11px]">Frekuensi Pembaruan:</span>
                        <span class="font-semibold text-slate-800"><?= htmlspecialchars($dataset['frekuensi_update'] ?? 'Tahunan') ?></span>
                    </div>
                    <div>
                        <span class="text-slate-400 block text-[11px]">Status Kepatuhan:</span>
                        <span class="font-semibold text-emerald-700">Terverifikasi Standar SDI</span>
                    </div>
                    <div>
                        <span class="text-slate-400 block text-[11px]">Lisensi:</span>
                        <span class="font-semibold text-slate-800">Terbuka untuk Publik (Creative Commons)</span>
                    </div>
                </div>
            </div>
        </div>
        <?php
        $content = ob_get_clean();
        return renderSatriaPage(htmlspecialchars($dataset['title']), $content, 'catalog');
    }

    public function create()
    {
        ob_start();
        ?>
        <div class="max-w-2xl mx-auto px-4 py-8 space-y-6">
            <h1 class="text-2xl font-bold text-slate-900">Tambah Dataset Baru</h1>
            <form action="index.php?route=dataset&action=store" method="POST" class="bg-white p-6 rounded-2xl border border-slate-200 shadow-xs space-y-4 text-xs">
                <div>
                    <label class="block font-semibold text-slate-700 mb-1">Judul Dataset</label>
                    <input type="text" name="title" required class="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg">
                </div>
                <div class="grid grid-cols-2 gap-4">
                    <div>
                        <label class="block font-semibold text-slate-700 mb-1">Bidang / Kategori</label>
                        <select name="category" class="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg">
                            <option value="Litbangjirap">Litbangjirap</option>
                            <option value="Invensi Inovasi">Invensi & Inovasi</option>
                            <option value="Sekretariat">Sekretariat</option>
                        </select>
                    </div>
                    <div>
                        <label class="block font-semibold text-slate-700 mb-1">Tahun Anggaran</label>
                        <input type="number" name="year" value="2026" required class="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg">
                    </div>
                </div>
                <div>
                    <label class="block font-semibold text-slate-700 mb-1">Deskripsi Dataset</label>
                    <textarea name="description" rows="3" required class="w-full p-2.5 bg-slate-50 border border-slate-200 rounded-lg"></textarea>
                </div>
                <button type="submit" class="px-5 py-2.5 bg-[#004b87] text-white rounded-lg font-bold hover:bg-[#003865]">
                    Simpan & Ajukan Dataset
                </button>
            </form>
        </div>
        <?php
        $content = ob_get_clean();
        return renderSatriaPage('Tambah Dataset', $content, 'dataset');
    }

    public function store()
    {
        if ($this->pdo) {
            $stmt = $this->pdo->prepare("INSERT INTO datasets (title, category, year, description, agency, status, created_at) VALUES (:title, :cat, :yr, :desc, 'BRIDA Jawa Timur', 'waiting_for_verification', CURRENT_TIMESTAMP)");
            $stmt->execute([
                ':title' => $_POST['title'] ?? '',
                ':cat' => $_POST['category'] ?? 'Litbangjirap',
                ':yr' => intval($_POST['year'] ?? 2026),
                ':desc' => $_POST['description'] ?? '',
            ]);
        }
        header('Location: index.php?route=dashboard');
        exit;
    }

    public function edit()
    {
        header('Location: index.php?route=dashboard');
        exit;
    }

    public function update()
    {
        header('Location: index.php?route=dashboard');
        exit;
    }

    public function destroy()
    {
        $id = intval($_GET['id'] ?? 0);
        if ($this->pdo && $id > 0) {
            $stmt = $this->pdo->prepare("DELETE FROM datasets WHERE id = :id");
            $stmt->execute([':id' => $id]);
        }
        header('Location: index.php?route=dashboard');
        exit;
    }

    public function destroyTheme() { $this->destroy(); }
    public function deleteFile() { header('Location: index.php?route=dashboard'); exit; }
    public function deleteDoc() { header('Location: index.php?route=dashboard'); exit; }
    public function deletePdf() { header('Location: index.php?route=dashboard'); exit; }
    public function submitFeedback() { header('Location: index.php?route=dashboard'); exit; }
    public function submitRevision() { header('Location: index.php?route=dashboard'); exit; }
    public function years() { echo json_encode([2026, 2025, 2024]); }

    public function approvals()
    {
        header('Location: index.php?route=dashboard');
        exit;
    }

    public function approve()
    {
        $id = intval($_GET['id'] ?? 0);
        if ($this->pdo && $id > 0) {
            $stmt = $this->pdo->prepare("UPDATE datasets SET status = 'approved' WHERE id = :id");
            $stmt->execute([':id' => $id]);
        }
        header('Location: index.php?route=dashboard');
        exit;
    }

    public function revise()
    {
        $id = intval($_GET['id'] ?? 0);
        if ($this->pdo && $id > 0) {
            $stmt = $this->pdo->prepare("UPDATE datasets SET status = 'waiting_for_revision' WHERE id = :id");
            $stmt->execute([':id' => $id]);
        }
        header('Location: index.php?route=dashboard');
        exit;
    }

    public function metadataTemplates()
    {
        header('Location: index.php?route=catalog');
        exit;
    }
}
