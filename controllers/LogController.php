<?php
// LogController for SATRIA BRIDA
require_once __DIR__ . '/../views/template.php';

class LogController
{
    private $pdo;
    public function __construct($pdo) { $this->pdo = $pdo; }
    public function index() { header('Location: index.php?route=dashboard'); exit; }
    public function inbox() { header('Location: index.php?route=dashboard'); exit; }
}
