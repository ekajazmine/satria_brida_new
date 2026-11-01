<?php
// SignatureController & LogController & MetadataController & IntegrationController for SATRIA BRIDA
require_once __DIR__ . '/../views/template.php';

class SignatureController
{
    private $pdo;
    public function __construct($pdo) { $this->pdo = $pdo; }
    public function form() { header('Location: index.php?route=dashboard'); exit; }
    public function save() { header('Location: index.php?route=dashboard'); exit; }
}
