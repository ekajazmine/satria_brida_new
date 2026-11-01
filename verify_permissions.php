<?php
require_once __DIR__ . '/config/config.php';
require_once __DIR__ . '/config/db.php';
require_once __DIR__ . '/middleware/auth.php';

echo "=== Verifikasi Permission System ===\n\n";


$stmt = $pdo->query("SELECT id, name, email, role FROM users ORDER BY id");
$users = $stmt->fetchAll();

echo "📋 PERMISSION RULES:\n";
echo "─────────────────────────────────────────────────────────────\n\n";

$permissions = [
    'super_admin' => [
        'Menu Access' => 'Dashboard, Dataset, Approvals, Feedback, Catalog, Metadata, Users, Stats, Integration, Logs',
        'User Management' => '✓ CREATE, ✓ READ, ✓ UPDATE, ✓ DELETE',
        'Dataset Management' => '✓ Full Control',
        'Verifikasi Dataset' => '✓ Can Approve/Revise',
        'View Logs' => '✓ Yes',
    ],
    'verifikator' => [
        'Menu Access' => 'Dashboard, Catalog, Verifikasi Dataset, Stats, Integration',
        'User Management' => '✗ NO ACCESS',
        'Dataset Management' => '✗ NO ACCESS',
        'Verifikasi Dataset' => '✓ Can Approve/Revise',
        'View Logs' => '✗ NO',
    ],
    'produsen' => [
        'Menu Access' => 'Dashboard, Catalog, Dataset, Metadata',
        'User Management' => '✗ NO ACCESS',
        'Dataset Management' => '✓ Own Datasets Only',
        'Verifikasi Dataset' => '✗ NO',
        'View Logs' => '✗ NO',
    ],
    'produsen_data' => [
        'Menu Access' => 'Dashboard, Catalog, Dataset, Metadata',
        'User Management' => '✗ NO ACCESS',
        'Dataset Management' => '✓ Own Datasets Only',
        'Verifikasi Dataset' => '✗ NO',
        'View Logs' => '✗ NO',
    ],
    'pimpinan' => [
        'Menu Access' => 'Dashboard, Catalog, Users (View Only)',
        'User Management' => '✓ READ ONLY (No Edit/Delete)',
        'Dataset Management' => '✗ NO ACCESS',
        'Verifikasi Dataset' => '✗ NO',
        'View Logs' => '✗ NO',
    ],
    'publik' => [
        'Menu Access' => 'Catalog Only',
        'User Management' => '✗ NO ACCESS',
        'Dataset Management' => '✗ NO ACCESS',
        'Verifikasi Dataset' => '✗ NO',
        'View Logs' => '✗ NO',
    ],
];

foreach ($permissions as $role => $perms) {
    echo "👤 " . strtoupper($role) . ":\n";
    foreach ($perms as $feature => $access) {
        echo "   • $feature: $access\n";
    }
    echo "\n";
}

echo "─────────────────────────────────────────────────────────────\n";
echo "\n📊 CURRENT USERS & THEIR ACCESS:\n\n";

foreach ($users as $u) {
    $role = strtolower($u['role']);
    echo "[$u[id]] " . str_pad($u['name'], 25) . " | " . str_pad($u['email'], 30) . " | " . strtoupper($role) . "\n";
    echo "    Routes: " . implode(', ', getAllowedRoutesByRole($role)) . "\n";
    echo "    User Mgmt: " . ($role === 'super_admin' ? "Edit" : (in_array($role, ['pimpinan']) ? "View Only" : "NO")) . "\n\n";
}

echo "─────────────────────────────────────────────────────────────\n";
echo "\n✅ Permission System Verification Complete!\n";
?>
