<?php
// MetadataController & IntegrationController for SATRIA BRIDA
require_once __DIR__ . '/../views/template.php';

class MetadataController
{
    private $pdo;
    public function __construct($pdo) { $this->pdo = $pdo; }
    public function importForm() { header('Location: index.php?route=catalog'); exit; }
    public function importProcess() { header('Location: index.php?route=catalog'); exit; }
}
