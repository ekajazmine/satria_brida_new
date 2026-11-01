<?php
// AuthController for SATRIA BRIDA
require_once __DIR__ . '/../views/template.php';

class AuthController
{
    private $pdo;

    public function __construct($pdo)
    {
        $this->pdo = $pdo;
    }

    public function loginForm()
    {
        ob_start();
        ?>
        <div class="py-12 px-4 flex items-center justify-center min-h-[70vh]">
            <div class="bg-white rounded-2xl max-w-md w-full border border-slate-200 shadow-xl overflow-hidden">
                <div class="h-1.5 w-full bg-gradient-to-r from-red-600 via-red-500 to-white"></div>
                <div class="p-6">
                    <div class="text-center pb-4 border-b border-slate-100">
                        <h2 class="text-xl font-bold text-slate-900">Masuk ke SATRIA BRIDA</h2>
                        <p class="text-xs text-slate-500 mt-1">Portal Satu Data Riset & Inovasi Daerah Jawa Timur</p>
                    </div>

                    <?php if (isset($_GET['error'])): ?>
                        <div class="my-4 p-3 bg-rose-50 border border-rose-200 text-rose-700 text-xs rounded-lg">
                            Email atau kata sandi tidak valid. Gunakan akun pengujian di bawah.
                        </div>
                    <?php endif; ?>

                    <form method="POST" action="index.php?route=login" class="mt-4 space-y-4 text-xs">
                        <div>
                            <label class="block font-semibold text-slate-700 mb-1">Email Pengguna / ASN</label>
                            <input type="email" name="email" required placeholder="admin@satria.local" class="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg">
                        </div>
                        <div>
                            <label class="block font-semibold text-slate-700 mb-1">Kata Sandi (Default: 123456)</label>
                            <input type="password" name="password" required value="123456" class="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg font-mono">
                        </div>
                        <button type="submit" class="w-full py-2.5 bg-[#004b87] hover:bg-[#003865] text-white rounded-lg font-bold shadow-xs transition-colors">
                            Masuk ke Akun
                        </button>
                    </form>

                    <div class="mt-6 pt-4 border-t border-slate-100 text-xs">
                        <span class="font-bold uppercase tracking-wider text-slate-400 text-[10px] block mb-2">Akun Pengujian Cepat:</span>
                        <div class="grid grid-cols-2 gap-2 text-[11px]">
                            <div class="p-2 bg-slate-50 rounded border border-slate-200">
                                <strong>Super Admin:</strong><br>admin@satria.local
                            </div>
                            <div class="p-2 bg-slate-50 rounded border border-slate-200">
                                <strong>Verifikator:</strong><br>verifikator@satria.local
                            </div>
                            <div class="p-2 bg-slate-50 rounded border border-slate-200">
                                <strong>Pimpinan:</strong><br>pimpinan@satria.local
                            </div>
                            <div class="p-2 bg-slate-50 rounded border border-slate-200">
                                <strong>Produsen:</strong><br>sekretariat@satria.local
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <?php
        $content = ob_get_clean();
        return renderSatriaPage('Masuk Akun', $content, 'login');
    }

    public function login()
    {
        $email = trim($_POST['email'] ?? '');
        $password = trim($_POST['password'] ?? '');

        if (!$this->pdo) {
            // Standalone fallback
            $_SESSION['user'] = [
                'id' => 1,
                'name' => 'Admin Utama',
                'email' => $email,
                'role' => 'super_admin',
                'divisi' => null,
            ];
            header('Location: index.php?route=dashboard');
            exit;
        }

        try {
            $stmt = $this->pdo->prepare("SELECT * FROM users WHERE email = :email LIMIT 1");
            $stmt->execute([':email' => $email]);
            $user = $stmt->fetch();

            if ($user) {
                // Verify password (AES decrypted or legacy hash or default test 123456)
                $valid = false;
                if ($password === '123456') {
                    $valid = true;
                } elseif (function_exists('decryptPassword') && decryptPassword($user['password']) === $password) {
                    $valid = true;
                } elseif (function_exists('isLegacyPasswordHash') && isLegacyPasswordHash($user['password']) && password_verify($password, $user['password'])) {
                    $valid = true;
                }

                if ($valid) {
                    $_SESSION['user'] = [
                        'id' => $user['id'],
                        'name' => $user['name'],
                        'email' => $user['email'],
                        'role' => $user['role'],
                        'divisi' => $user['divisi'] ?? null,
                    ];
                    header('Location: index.php?route=dashboard');
                    exit;
                }
            }
        } catch (Exception $e) {
            // fallback
        }

        header('Location: index.php?route=login&error=1');
        exit;
    }

    public function setup()
    {
        header('Location: index.php?route=login');
        exit;
    }

    public function logout()
    {
        unset($_SESSION['user']);
        session_destroy();
        header('Location: index.php?route=home');
        exit;
    }
}
