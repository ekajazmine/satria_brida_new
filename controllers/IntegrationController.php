<?php
// IntegrationController for SATRIA BRIDA
require_once __DIR__ . '/../views/template.php';

class IntegrationController
{
    private $pdo;
    public function __construct($pdo) { $this->pdo = $pdo; }
    public function index() { header('Location: index.php?route=catalog'); exit; }
}
