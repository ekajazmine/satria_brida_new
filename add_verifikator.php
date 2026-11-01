<?php
require_once __DIR__ . '/config/config.php';
require_once __DIR__ . '/config/db.php';

try {
    $sql = file_get_contents(__DIR__ . '/database/update_verifikator.sql');
    
    
    $queries = array_filter(array_map('trim', explode(';', $sql)));
    
    foreach ($queries as $query) {
        if (!empty($query)) {
            $pdo->exec($query);
        }
    }
    
    echo "✓ User verifikator berhasil ditambahkan\n";
    
    
    $stmt = $pdo->query("SELECT id, name, email, role FROM users WHERE email = 'verifikator@satria.local'");
    $user = $stmt->fetch();
    
    if ($user) {
        echo "✓ Verifikasi berhasil: User dengan email " . $user['email'] . " telah ditambahkan dengan role: " . $user['role'] . "\n";
    }
} catch (Exception $e) {
    echo "✗ Error: " . $e->getMessage() . "\n";
    exit(1);
}
?>
