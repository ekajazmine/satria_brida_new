<?php
// GuideBookController for SATRIA BRIDA
require_once __DIR__ . '/../views/template.php';

class GuideBookController
{
    private $pdo;

    public function __construct($pdo)
    {
        $this->pdo = $pdo;
    }

    public function form()
    {
        ob_start();
        ?>
        <div class="max-w-4xl mx-auto px-4 py-8 space-y-6">
            <h1 class="text-2xl font-bold text-slate-900">Buku Panduan & SOP Satu Data</h1>
            <div class="bg-white p-6 rounded-2xl border border-slate-200 text-xs text-slate-600 space-y-3">
                <p>Silakan unduh dokumen panduan teknis pengelolaan dataset dan pengoperasian modul SICAKAB.</p>
                <a href="index.php?route=catalog" class="inline-block px-4 py-2 bg-[#004b87] text-white rounded font-bold">Katalog Data</a>
            </div>
        </div>
        <?php
        $content = ob_get_clean();
        return renderSatriaPage('Buku Panduan', $content, 'guidebook');
    }

    public function upload()
    {
        header('Location: index.php?route=guidebook');
        exit;
    }
}
