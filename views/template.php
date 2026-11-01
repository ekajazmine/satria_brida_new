<?php
// Main Portal Satu Data Indonesia UI Template for SATRIA BRIDA (PHP/XAMPP View Engine)

function renderSatriaPage($title, $content, $activeNav = 'home')
{
    $user = $_SESSION['user'] ?? null;
    $role = $user['role'] ?? 'publik';
    $name = $user['name'] ?? 'Tamu Publik';
    $baseUrl = defined('APP_BASE') ? APP_BASE : '';
    
    ob_start();
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($title) ?> - SATRIA BRIDA (Satu Data Jawa Timur)</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&family=JetBrains+Mono:wght@400;500;600&display=swap" rel="stylesheet">
    <!-- Tailwind CSS CDN for XAMPP rendering -->
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
      tailwind.config = {
        theme: {
          extend: {
            colors: {
              govblue: {
                800: '#003566',
                900: '#00284d',
                primary: '#004b87',
                accent: '#0284c7'
              }
            },
            fontFamily: {
              sans: ['"Plus Jakarta Sans"', 'system-ui', 'sans-serif'],
              mono: ['"JetBrains Mono"', 'monospace'],
            }
          }
        }
      }
    </script>
    <style>
      body { font-family: 'Plus Jakarta Sans', system-ui, sans-serif; }
      ::-webkit-scrollbar { width: 6px; height: 6px; }
      ::-webkit-scrollbar-track { background: #f1f5f9; }
      ::-webkit-scrollbar-thumb { background: #cbd5e1; border-radius: 3px; }
    </style>
</head>
<body class="bg-slate-50 text-slate-800 antialiased min-h-screen flex flex-col">

    <!-- Red & White Ribbon -->
    <div class="h-1.5 w-full bg-gradient-to-r from-red-600 via-red-500 to-white"></div>

    <!-- Institutional Header Bar -->
    <div class="bg-slate-50 border-b border-slate-200 px-4 py-1.5 text-[11px] text-slate-600 hidden sm:block">
        <div class="max-w-7xl mx-auto flex items-center justify-between">
            <div class="flex items-center gap-2">
                <span class="font-bold text-slate-900 tracking-wide">PORTAL SATU DATA INDONESIA</span>
                <span>·</span>
                <span>Pemerintah Provinsi Jawa Timur</span>
                <span>·</span>
                <span>Badan Riset dan Inovasi Daerah (BRIDA)</span>
            </div>
            <div class="text-slate-500 font-medium">
                Standar Interoperabilitas Perpres No. 39/2019
            </div>
        </div>
    </div>

    <!-- Main Navigation Bar -->
    <header class="sticky top-0 z-40 bg-white border-b border-slate-200 shadow-xs">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex items-center justify-between h-18">
                <!-- Brand Wordmark -->
                <a href="index.php?route=home" class="flex items-center gap-3">
                    <div class="w-10 h-10 rounded-lg bg-gradient-to-br from-[#003566] to-[#00509d] flex items-center justify-center text-white shadow-xs">
                        <svg class="w-5 h-5 text-sky-300" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 7v10c0 2.21 3.582 4 8 4s8-1.79 8-4V7M4 7c0 2.21 3.582 4 8 4s8-1.79 8-4M4 7c0-2.21 3.582-4 8-4s8 1.79 8 4m0 5c0 2.21-3.582 4-8 4s-8-1.79-8-4"/></svg>
                    </div>
                    <div>
                        <div class="flex items-center gap-2">
                            <span class="text-xl font-extrabold text-[#003566] tracking-tight">SATRIA <span class="text-[#0284c7]">BRIDA</span></span>
                            <span class="text-[10px] font-semibold uppercase tracking-wider bg-sky-100 text-[#004b87] px-2 py-0.5 rounded">JATIM</span>
                        </div>
                        <p class="text-[11px] text-slate-500 font-medium leading-none mt-0.5">Satu Data Riset & Inovasi Daerah</p>
                    </div>
                </a>

                <!-- Nav Links -->
                <nav class="hidden lg:flex items-center gap-1 font-medium text-sm text-slate-600">
                    <a href="index.php?route=home" class="px-3 py-2 rounded-md transition-colors <?= $activeNav === 'home' ? 'text-[#004b87] font-semibold bg-sky-50' : 'hover:text-slate-900 hover:bg-slate-50' ?>">Beranda</a>
                    <a href="index.php?route=catalog" class="px-3 py-2 rounded-md transition-colors <?= $activeNav === 'catalog' ? 'text-[#004b87] font-semibold bg-sky-50' : 'hover:text-slate-900 hover:bg-slate-50' ?>">Katalog Data</a>
                    <a href="index.php?route=stats" class="px-3 py-2 rounded-md transition-colors <?= $activeNav === 'stats' ? 'text-[#004b87] font-semibold bg-sky-50' : 'hover:text-slate-900 hover:bg-slate-50' ?>">Statistik</a>
                    <a href="index.php?route=si-cakab" class="px-3 py-2 rounded-md transition-colors <?= $activeNav === 'sicakab' ? 'text-[#004b87] font-semibold bg-sky-50' : 'hover:text-slate-900 hover:bg-slate-50' ?>">SICAKAB</a>
                    <a href="index.php?route=about" class="px-3 py-2 rounded-md transition-colors <?= $activeNav === 'about' ? 'text-[#004b87] font-semibold bg-sky-50' : 'hover:text-slate-900 hover:bg-slate-50' ?>">Tentang</a>
                </nav>

                <!-- Auth Action -->
                <div class="flex items-center gap-3">
                    <?php if ($user): ?>
                        <a href="index.php?route=dashboard" class="px-4 py-2 rounded-lg bg-[#004b87] hover:bg-[#003865] text-white text-xs font-semibold shadow-xs flex items-center gap-2">
                            <span>Dashboard (<?= htmlspecialchars(strtoupper($role)) ?>)</span>
                        </a>
                        <a href="index.php?route=logout" class="px-3 py-2 rounded-lg border border-slate-200 text-slate-600 hover:text-red-600 hover:bg-red-50 text-xs font-medium">Keluar</a>
                    <?php else: ?>
                        <a href="index.php?route=login" class="px-4 py-2 rounded-lg border border-[#004b87] text-[#004b87] hover:bg-sky-50 text-xs font-bold transition-colors">
                            Masuk / Login
                        </a>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <main class="flex-1">
        <?= $content ?>
    </main>

    <!-- Government Footer -->
    <footer class="bg-[#00284d] text-slate-300 pt-12 pb-8 border-t border-slate-800 mt-auto">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="grid grid-cols-1 md:grid-cols-4 gap-8 pb-10 border-b border-slate-700/60 text-xs">
                <div>
                    <span class="text-base font-bold text-white tracking-tight">SATRIA <span class="text-sky-400">BRIDA</span></span>
                    <p className="text-slate-300 mt-2 leading-relaxed">Sistem Satu Data Riset dan Inovasi Daerah Badan Riset dan Inovasi Daerah Provinsi Jawa Timur.</p>
                </div>
                <div>
                    <h4 class="font-bold uppercase tracking-wider text-white mb-2">Produsen Data</h4>
                    <p class="text-slate-400">Sekretariat BRIDA, Bidang Invensi & Inovasi, Bidang Litbangjirap.</p>
                </div>
                <div>
                    <h4 class="font-bold uppercase tracking-wider text-white mb-2">Satu Data Indonesia</h4>
                    <p class="text-slate-400">Kepatuhan standar metadata dan interoperabilitas Perpres No. 39 Tahun 2019.</p>
                </div>
                <div>
                    <h4 class="font-bold uppercase tracking-wider text-white mb-2">Kontak Sekretariat</h4>
                    <p class="text-slate-400">Jl. Gayung Kebonsari No. 56, Gayungan, Kota Surabaya, Jawa Timur 60235</p>
                </div>
            </div>
            <div class="pt-6 flex flex-col sm:flex-row items-center justify-between text-[11px] text-slate-400 gap-3">
                <p>© 2026 Badan Riset dan Inovasi Daerah Provinsi Jawa Timur. Hak Cipta Dilindungi Undang-Undang.</p>
                <p>Standar Desain Portal Satu Data Indonesia (data.go.id)</p>
            </div>
        </div>
    </footer>
</body>
</html>
<?php
    return ob_get_clean();
}
