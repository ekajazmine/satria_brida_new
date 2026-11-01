<?php
// UserController for SATRIA BRIDA
require_once __DIR__ . '/../views/template.php';

class UserController
{
    private $pdo;

    public function __construct($pdo)
    {
        $this->pdo = $pdo;
    }

    public function index()
    {
        $users = [];
        if ($this->pdo) {
            $stmt = $this->pdo->query("SELECT id, name, email, role, divisi, created_at FROM users ORDER BY id ASC");
            $users = $stmt->fetchAll();
        }

        ob_start();
        ?>
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8 space-y-6">
            <h1 class="text-2xl font-bold text-slate-900 tracking-tight">Manajemen Pengguna & Hak Akses</h1>
            <div class="bg-white rounded-xl border border-slate-200 shadow-xs overflow-hidden">
                <table class="w-full text-left text-xs border-collapse">
                    <thead class="bg-slate-50 text-slate-700 font-bold border-b border-slate-200">
                        <tr>
                            <th class="px-4 py-3">ID</th>
                            <th class="px-4 py-3">Nama</th>
                            <th class="px-4 py-3">Email</th>
                            <th class="px-4 py-3">Peran (Role)</th>
                            <th class="px-4 py-3">Divisi</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-slate-100 text-slate-700">
                        <?php foreach ($users as $u): ?>
                            <tr class="hover:bg-slate-50">
                                <td class="px-4 py-3 tabular-nums"><?= $u['id'] ?></td>
                                <td class="px-4 py-3 font-semibold text-slate-900"><?= htmlspecialchars($u['name']) ?></td>
                                <td class="px-4 py-3 font-mono text-[11px]"><?= htmlspecialchars($u['email']) ?></td>
                                <td class="px-4 py-3"><span class="px-2 py-0.5 rounded text-[10px] font-bold uppercase bg-sky-100 text-[#004b87]"><?= htmlspecialchars($u['role']) ?></span></td>
                                <td class="px-4 py-3 capitalize"><?= htmlspecialchars($u['divisi'] ?? '-') ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
        <?php
        $content = ob_get_clean();
        return renderSatriaPage('Manajemen Pengguna', $content, 'users');
    }

    public function create() { header('Location: index.php?route=users'); exit; }
    public function store() { header('Location: index.php?route=users'); exit; }
    public function edit() { header('Location: index.php?route=users'); exit; }
    public function update() { header('Location: index.php?route=users'); exit; }
    public function destroy() { header('Location: index.php?route=users'); exit; }
    public function resetPassword() { header('Location: index.php?route=users'); exit; }
}
