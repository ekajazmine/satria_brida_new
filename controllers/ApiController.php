<?php
// ApiController for SATRIA BRIDA - Satu Data Indonesia REST Endpoints

class ApiController
{
    private $pdo;

    public function __construct($pdo)
    {
        $this->pdo = $pdo;
    }

    public function datasets()
    {
        if (!$this->pdo) return [];
        try {
            $stmt = $this->pdo->query("SELECT id, title, category, year, agency, researcher, status, created_at FROM datasets ORDER BY id DESC");
            return $stmt->fetchAll();
        } catch (Exception $e) {
            return [];
        }
    }

    public function inovasi()
    {
        return [
            ['id' => 1, 'nama_inovasi' => 'Samsat 4.0 Pembayaran QRIS', 'skor' => 118, 'instansi' => 'Bapenda Jatim'],
            ['id' => 2, 'nama_inovasi' => 'E-Ternak Telemedicine PMK', 'skor' => 112, 'instansi' => 'Disnak Jatim'],
            ['id' => 3, 'nama_inovasi' => 'SIPADU Bencana Jatim', 'skor' => 108, 'instansi' => 'BPBD Jatim'],
        ];
    }

    public function peneliti()
    {
        return [
            'total_peneliti' => 298,
            'ahli_utama' => 70,
            'ahli_madya' => 122,
            'ahli_muda' => 80,
            'ahli_pertama' => 26,
        ];
    }

    public function penelitiGender()
    {
        return [
            'laki_laki' => 161,
            'perempuan' => 137,
            'total' => 298,
            'persentase_perempuan' => '46.0%',
        ];
    }

    public function metricSeries($type)
    {
        return [
            'type' => $type,
            'data' => [
                ['tahun' => 2024, 'value' => 280],
                ['tahun' => 2025, 'value' => 312],
                ['tahun' => 2026, 'value' => 350],
            ],
        ];
    }

    public function metricByBidang($type)
    {
        return [
            'Litbangjirap' => 14,
            'Invensi Inovasi' => 18,
            'Sekretariat' => 10,
        ];
    }

    public function datasetsByBidang()
    {
        return $this->metricByBidang('dataset');
    }

    public function catalogDetail($id)
    {
        if (!$this->pdo) return null;
        try {
            $stmt = $this->pdo->prepare("SELECT * FROM datasets WHERE id = :id LIMIT 1");
            $stmt->execute([':id' => $id]);
            return $stmt->fetch();
        } catch (Exception $e) {
            return null;
        }
    }
}
