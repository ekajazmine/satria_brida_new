<?php
// SiCakabController for SATRIA BRIDA
require_once __DIR__ . '/../views/template.php';

class SiCakabController
{
    private $pdo;

    public function __construct($pdo)
    {
        $this->pdo = $pdo;
    }

    private function getReports()
    {
        if (!$this->pdo) return [];
        try {
            $stmt = $this->pdo->query("SELECT * FROM sicakab_reports ORDER BY id DESC");
            return $stmt->fetchAll();
        } catch (Exception $e) {
            return [];
        }
    }

    public function dashboard()
    {
        $reports = $this->getReports();
        ob_start();
        ?>
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8 space-y-6">
            <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
                <div>
                    <h1 class="text-2xl font-bold text-slate-900 tracking-tight flex items-center gap-2">
                        <svg class="w-6 h-6 text-emerald-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
                        Modul SICAKAB (Sistem Informasi Capaian Kinerja)
                    </h1>
                    <p class="text-xs text-slate-500 mt-0.5">Pemantauan target indikator kinerja dan evaluasi triwulan I s/d IV.</p>
                </div>
                <a href="index.php?route=si-cakab&action=create" class="px-4 py-2 bg-emerald-600 hover:bg-emerald-700 text-white rounded-lg text-xs font-bold transition-colors">
                    + Tambah Laporan Kinerja
                </a>
            </div>

            <!-- Reports List -->
            <div class="space-y-4">
                <?php if (empty($reports)): ?>
                    <div class="p-8 bg-white rounded-xl border border-slate-200 text-center text-xs text-slate-400">
                        Belum ada data laporan SICAKAB yang tercatat.
                    </div>
                <?php else: ?>
                    <?php foreach ($reports as $r): ?>
                        <div class="bg-white p-5 rounded-xl border border-slate-200 shadow-xs space-y-3">
                            <div class="flex items-start justify-between gap-2">
                                <div>
                                    <span class="text-[11px] font-bold text-[#004b87]"><?= htmlspecialchars($r['bagian'] ?? 'Sekretariat') ?></span>
                                    <h3 class="text-sm font-bold text-slate-900 mt-0.5"><?= htmlspecialchars($r['indikator_kinerja'] ?? '') ?></h3>
                                    <p class="text-xs text-slate-500">Program: <?= htmlspecialchars($r['program_kegiatan'] ?? '') ?></p>
                                </div>
                                <span class="px-2.5 py-1 rounded-full text-[10px] font-bold uppercase bg-emerald-50 text-emerald-700 border border-emerald-200">
                                    <?= htmlspecialchars($r['status'] ?? 'diverifikasi') ?>
                                </span>
                            </div>
                            <div class="grid grid-cols-4 gap-2 text-center text-xs pt-2 border-t border-slate-100">
                                <div class="bg-slate-50 p-2 rounded">
                                    <span class="text-[10px] text-slate-400 block">TW I</span>
                                    <span class="font-bold text-slate-800"><?= $r['tw1'] ?></span>
                                </div>
                                <div class="bg-slate-50 p-2 rounded">
                                    <span class="text-[10px] text-slate-400 block">TW II</span>
                                    <span class="font-bold text-slate-800"><?= $r['tw2'] ?></span>
                                </div>
                                <div class="bg-slate-50 p-2 rounded">
                                    <span class="text-[10px] text-slate-400 block">TW III</span>
                                    <span class="font-bold text-slate-800"><?= $r['tw3'] ?></span>
                                </div>
                                <div class="bg-slate-50 p-2 rounded">
                                    <span class="text-[10px] text-slate-400 block">TW IV</span>
                                    <span class="font-bold text-slate-800"><?= $r['tw4'] ?></span>
                                </div>
                            </div>
                        </div>
                    <?php endforeach; ?>
                <?php endif; ?>
            </div>
        </div>
        <?php
        $content = ob_get_clean();
        return renderSatriaPage('Modul SICAKAB', $content, 'sicakab');
    }

    public function form()
    {
        ob_start();
        ?>
        <div class="max-w-2xl mx-auto px-4 py-8 space-y-4">
            <h1 class="text-2xl font-bold text-slate-900">Input Capaian Kinerja SICAKAB</h1>
            <form action="index.php?route=si-cakab&action=submit" method="POST" class="bg-white p-6 rounded-2xl border border-slate-200 space-y-4 text-xs">
                <div>
                    <label class="block font-semibold mb-1">Indikator Kinerja</label>
                    <input type="text" name="indikator_kinerja" required class="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg">
                </div>
                <div class="grid grid-cols-2 gap-4">
                    <div>
                        <label class="block font-semibold mb-1">Target</label>
                        <input type="number" name="target" value="10" required class="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg">
                    </div>
                    <div>
                        <label class="block font-semibold mb-1">Satuan</label>
                        <input type="text" name="satuan_target" value="dokumen" class="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg">
                    </div>
                </div>
                <button type="submit" class="px-5 py-2.5 bg-emerald-600 text-white rounded-lg font-bold">Kirim Laporan</button>
            </form>
        </div>
        <?php
        $content = ob_get_clean();
        return renderSatriaPage('Form SICAKAB', $content, 'sicakab');
    }

    public function store()
    {
        header('Location: index.php?route=si-cakab');
        exit;
    }

    public function detail() { header('Location: index.php?route=si-cakab'); exit; }
    public function submitTindakLanjut() { header('Location: index.php?route=si-cakab'); exit; }
    public function submitHasilTindakLanjut() { header('Location: index.php?route=si-cakab'); exit; }
    public function delete() { header('Location: index.php?route=si-cakab'); exit; }
    public function exportPdf() { header('Location: index.php?route=si-cakab'); exit; }
    public function exportYearlyPdf() { header('Location: index.php?route=si-cakab'); exit; }
    public function setTargetForm() { header('Location: index.php?route=si-cakab'); exit; }
    public function storeTarget() { header('Location: index.php?route=si-cakab'); exit; }
    public function updateTarget() { header('Location: index.php?route=si-cakab'); exit; }
    public function deleteTarget() { header('Location: index.php?route=si-cakab'); exit; }
    public function adminList() { header('Location: index.php?route=si-cakab'); exit; }
    public function adminDetail() { header('Location: index.php?route=si-cakab'); exit; }
    public function adminSubmitEvaluasi() { header('Location: index.php?route=si-cakab'); exit; }
}
