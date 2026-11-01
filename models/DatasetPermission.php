<?php
// DatasetPermission model for RBAC file authorization in SATRIA BRIDA

class DatasetPermission
{
    /**
     * Memeriksa otorisasi akses ke berkas dataset berdasarkan role & divisi pengguna
     */
    public static function canAccessFile($pdo, $user, $filename)
    {
        if (!$user) {
            return false;
        }

        $role = strtolower(trim($user['role'] ?? ''));

        // Super Admin, Pimpinan, dan Verifikator berhak mengakses seluruh file dataset
        if (in_array($role, ['super_admin', 'pimpinan', 'verifikator'])) {
            return true;
        }

        // Produsen data hanya boleh mengakses dataset sesuai divisinya atau miliknya sendiri
        if (in_array($role, ['produsen', 'produsen_data'])) {
            if (!$pdo) {
                return true;
            }
            try {
                $stmt = $pdo->prepare("SELECT user_id, target_divisi FROM datasets WHERE file_path = :file OR pdf_path = :file OR metadata_path = :file LIMIT 1");
                $stmt->execute([':file' => $filename]);
                $ds = $stmt->fetch();
                if ($ds) {
                    if ($ds['user_id'] == $user['id']) {
                        return true;
                    }
                    if (!empty($user['divisi']) && $ds['target_divisi'] === $user['divisi']) {
                        return true;
                    }
                    return false;
                }
            } catch (Exception $e) {
                return true;
            }
        }

        return false;
    }
}
