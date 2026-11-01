<?php
define('APP_NAME', 'SATRIA BRIDA');
define('APP_BASE', rtrim(dirname($_SERVER['SCRIPT_NAME']), '/'));
define('UPLOAD_PATH', __DIR__ . '/../uploads');
define('UPLOAD_DATASETS_PATH', __DIR__ . '/../uploads/datasets');
define('MAX_UPLOAD_SIZE', 10 * 1024 * 1024);

// Nilai default = setup XAMPP lama. Kalau dijalankan lewat Docker
// (docker-compose.yml), env var DB_HOST/DB_NAME/DB_USER/DB_PASS di-set oleh
// compose sehingga baris getenv() di bawah ini yang dipakai, bukan default.
define('DB_HOST', getenv('DB_HOST') ?: 'localhost');
define('DB_NAME', getenv('DB_NAME') ?: 'satria_brida');
define('DB_USER', getenv('DB_USER') ?: 'root');
define('DB_PASS', getenv('DB_PASS') ?: '');

if (!is_dir(UPLOAD_PATH)) mkdir(UPLOAD_PATH, 0777, true);
if (!is_dir(UPLOAD_DATASETS_PATH)) mkdir(UPLOAD_DATASETS_PATH, 0777, true);

define('UPLOAD_SICAKAB_PATH', __DIR__ . '/../uploads/sicakab');
if (!is_dir(UPLOAD_SICAKAB_PATH)) mkdir(UPLOAD_SICAKAB_PATH, 0777, true);

define('UPLOAD_GUIDEBOOK_PATH', __DIR__ . '/../uploads/guidebook');
if (!is_dir(UPLOAD_GUIDEBOOK_PATH)) mkdir(UPLOAD_GUIDEBOOK_PATH, 0777, true);




function dc_val($value)
{
    return $value === null ? '-' : intval($value);
}

// Kunci rahasia untuk enkripsi password (reversible), dipakai agar admin bisa
// melihat kembali password user apa adanya. GANTI nilai ini di lingkungan produksi
// dan pindahkan ke environment variable / file di luar folder aplikasi.
define('APP_PASSWORD_SECRET', 'SATRIA-BRIDA-GANTI-KUNCI-RAHASIA-INI-2026');

function encryptPassword($plainPassword)
{
    $key = hash('sha256', APP_PASSWORD_SECRET, true);
    $iv = random_bytes(16);
    $cipher = openssl_encrypt((string)$plainPassword, 'AES-256-CBC', $key, OPENSSL_RAW_DATA, $iv);
    return base64_encode($iv . $cipher);
}

function decryptPassword($encryptedPassword)
{
    $key = hash('sha256', APP_PASSWORD_SECRET, true);
    $data = base64_decode((string)$encryptedPassword, true);
    if ($data === false || strlen($data) <= 16) {
        return null;
    }
    $iv = substr($data, 0, 16);
    $cipher = substr($data, 16);
    $plain = openssl_decrypt($cipher, 'AES-256-CBC', $key, OPENSSL_RAW_DATA, $iv);
    return $plain === false ? null : $plain;
}

// Deteksi apakah nilai password di DB masih format hash lama (bcrypt/password_hash),
// untuk menjaga akun lama tetap bisa login sebelum passwordnya di-reset oleh admin.
function isLegacyPasswordHash($value)
{
    return is_string($value) && preg_match('/^\$2[axy]\$/', $value) === 1;
}
