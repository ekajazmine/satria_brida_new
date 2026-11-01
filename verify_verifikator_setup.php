<?php
require_once __DIR__ . '/config/config.php';
require_once __DIR__ . '/config/db.php';

echo "=== Verifikasi Setup Role Verifikator ===\n\n";

try {
    
    echo "✓ Check 1: Struktur users table\n";
    $stmt = $pdo->query("SHOW COLUMNS FROM users");
    $columns = $stmt->fetchAll();
    foreach ($columns as $col) {
        if ($col['Field'] === 'role') {
            echo "  - Role column found: " . $col['Type'] . "\n";
            if (strpos($col['Type'], 'verifikator') !== false) {
                echo "  - ✓ 'verifikator' ada dalam ENUM\n";
            }
        }
    }
    
    
    echo "\n✓ Check 2: User verifikator\n";
    $stmt = $pdo->query("SELECT id, name, email, role FROM users WHERE email = 'verifikator@satria.local'");
    $verif = $stmt->fetch();
    if ($verif) {
        echo "  - ID: " . $verif['id'] . "\n";
        echo "  - Name: " . $verif['name'] . "\n";
        echo "  - Email: " . $verif['email'] . "\n";
        echo "  - Role: " . $verif['role'] . "\n";
        echo "  - ✓ User verifikator ditemukan!\n";
    } else {
        echo "  - ✗ User verifikator TIDAK ditemukan\n";
    }
    
    
    echo "\n✓ Check 3: Distribusi user berdasarkan role\n";
    $stmt = $pdo->query("SELECT role, COUNT(*) as count FROM users GROUP BY role");
    $roles = $stmt->fetchAll();
    foreach ($roles as $r) {
        echo "  - " . ucfirst($r['role']) . ": " . $r['count'] . " user(s)\n";
    }
    
    
    echo "\n✓ Check 4: Daftar semua user\n";
    $stmt = $pdo->query("SELECT id, name, email, role FROM users ORDER BY id");
    $all_users = $stmt->fetchAll();
    foreach ($all_users as $u) {
        echo "  - [" . $u['id'] . "] " . $u['name'] . " (" . $u['email'] . ") - " . $u['role'] . "\n";
    }
    
    echo "\n=== ✓ Setup Verifikasi Selesai ===\n";
    echo "\nDefault Password: 123456\n";
    echo "Untuk test login, gunakan:\n";
    echo "  Email: verifikator@satria.local\n";
    echo "  Password: 123456\n";
    
} catch (Exception $e) {
    echo "✗ Error: " . $e->getMessage() . "\n";
    exit(1);
}
?>
