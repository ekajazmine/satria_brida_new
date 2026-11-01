<?php
// DeadlineController for SATRIA BRIDA
require_once __DIR__ . '/../views/template.php';

class DeadlineController
{
    private $pdo;

    public function __construct($pdo)
    {
        $this->pdo = $pdo;
    }

    public function index()
    {
        header('Location: index.php?route=dashboard');
        exit;
    }

    public function store() { header('Location: index.php?route=dashboard'); exit; }
    public function update() { header('Location: index.php?route=dashboard'); exit; }
    public function destroy() { header('Location: index.php?route=dashboard'); exit; }
}
