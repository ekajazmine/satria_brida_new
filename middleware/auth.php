<?php
// Middleware Authentication and Role Access Control for SATRIA BRIDA

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

/**
 * Wajibkan login untuk mengakses halaman
 */
function checkLogin()
{
    if (!isset($_SESSION['user'])) {
        header('Location: index.php?route=login');
        exit;
    }
}

/**
 * Khusus role super_admin
 */
function checkAdmin()
{
    checkLogin();
    if ($_SESSION['user']['role'] !== 'super_admin') {
        header('Location: index.php?route=dashboard');
        exit;
    }
}

/**
 * Role verifikator atau super_admin
 */
function checkVerifikator()
{
    checkLogin();
    if (!in_array($_SESSION['user']['role'], ['super_admin', 'verifikator'])) {
        header('Location: index.php?route=dashboard');
        exit;
    }
}

/**
 * Pengecekan daftar role yang diizinkan
 */
function checkRoles($roles = [])
{
    checkLogin();
    if (!empty($roles) && !in_array($_SESSION['user']['role'], $roles)) {
        header('Location: index.php?route=dashboard');
        exit;
    }
}

/**
 * Pengecekan akses kelola SICAKAB (Dropdown & Satuan)
 */
function checkSicakabManage()
{
    checkLogin();
    if (!in_array($_SESSION['user']['role'], ['super_admin', 'verifikator'])) {
        header('Location: index.php?route=dashboard');
        exit;
    }
}

/**
 * Mendapatkan daftar route yang diizinkan per role (digunakan oleh verify_permissions.php & sistem routing)
 */
function getAllowedRoutesByRole($role)
{
    $role = strtolower(trim($role));
    $map = [
        'super_admin' => [
            'home', 'dashboard', 'catalog', 'dataset', 'approvals', 'feedbacks',
            'metadata', 'users', 'stats', 'integration', 'logs', 'deadlines',
            'si-cakab', 'si-cakab-target', 'si-cakab-evaluasi', 'si-cakab-dropdown',
            'si-cakab-satuan', 'guidebook', 'tanda-tangan', 'pesan-masuk', 'dashboard_metrics'
        ],
        'verifikator' => [
            'home', 'dashboard', 'catalog', 'approvals', 'verifikator', 'stats',
            'integration', 'feedbacks', 'si-cakab', 'si-cakab-evaluasi', 'si-cakab-evaluasi-detail'
        ],
        'produsen' => [
            'home', 'dashboard', 'catalog', 'dataset', 'metadata', 'revisions',
            'feedbacks', 'si-cakab', 'stats'
        ],
        'produsen_data' => [
            'home', 'dashboard', 'catalog', 'dataset', 'metadata', 'revisions',
            'feedbacks', 'si-cakab', 'stats'
        ],
        'pimpinan' => [
            'home', 'dashboard', 'catalog', 'users', 'feedbacks', 'stats',
            'si-cakab', 'si-cakab-evaluasi'
        ],
        'publik' => [
            'home', 'catalog', 'stats', 'about', 'contact', 'login', 'preview'
        ],
    ];

    return $map[$role] ?? ['home', 'catalog', 'login'];
}
