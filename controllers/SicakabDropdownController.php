<?php
// SicakabDropdownController for SATRIA BRIDA
require_once __DIR__ . '/../views/template.php';

class SicakabDropdownController
{
    private $pdo;

    public function __construct($pdo)
    {
        $this->pdo = $pdo;
    }

    public function manage() { header('Location: index.php?route=si-cakab'); exit; }
    public function store() { header('Location: index.php?route=si-cakab'); exit; }
    public function update() { header('Location: index.php?route=si-cakab'); exit; }
    public function delete() { header('Location: index.php?route=si-cakab'); exit; }
    public function manageSatuan() { header('Location: index.php?route=si-cakab'); exit; }
    public function storeSatuan() { header('Location: index.php?route=si-cakab'); exit; }
    public function updateSatuan() { header('Location: index.php?route=si-cakab'); exit; }
    public function toggleSatuan() { header('Location: index.php?route=si-cakab'); exit; }
    public function deleteSatuan() { header('Location: index.php?route=si-cakab'); exit; }
}
