export type UserRole = 'super_admin' | 'verifikator' | 'produsen' | 'produsen_data' | 'pimpinan' | 'publik';

export interface User {
  id: number;
  name: string;
  email: string;
  role: UserRole;
  divisi?: 'sekretariat' | 'inovasi' | 'litbang' | null;
  created_at: string;
}

export type DatasetStatus = 'published' | 'approved' | 'waiting_for_verification' | 'waiting_for_revision' | 'pending';

export interface Dataset {
  id: number;
  title: string;
  category: string; // 'Litbangjirap' | 'Invensi Inovasi' | 'Sekretariat'
  description: string;
  year: number;
  agency: string;
  researcher: string;
  location: string;
  file_path: string;
  metadata_path?: string;
  pdf_path?: string;
  user_id: number;
  target_divisi?: 'sekretariat' | 'inovasi' | 'litbang' | null;
  created_at: string;
  updated_at?: string;
  status: DatasetStatus;
  jenis_data: string;
  tahun_data: number;
  instansi: string;
  frekuensi_update: string;
  tanggal_update?: string;
  metric_type?: string;
  metric_value?: number;
  views_count: number;
  downloads_count: number;
  // Sample data rows for interactive CSV preview
  preview_data?: {
    columns: string[];
    rows: (string | number)[][];
  };
}

export interface SicakabReport {
  id: number;
  user_id: number;
  target_id?: number;
  bagian: string;
  sub_bagian: string;
  program_kegiatan: string;
  indikator_kinerja: string;
  tahun: number;
  target: number | string;
  satuan_target: string;
  tw1: number;
  tw2: number;
  tw3: number;
  tw4: number;
  capaian: number;
  keterangan: string;
  faktor_pendukung?: string;
  peluang_hambatan?: string;
  link_dokumen?: string;
  file_dokumen?: string;
  status: 'menunggu_evaluasi' | 'diverifikasi' | 'perlu_perbaikan' | 'draft';
  evaluasi_hasil?: string;
  evaluasi_rekomendasi?: string;
  evaluasi_by?: string;
  evaluasi_at?: string;
  tindak_lanjut_rencana?: string;
  tindak_lanjut_hasil?: string;
}

export interface SicakabTarget {
  id: number;
  bagian: string;
  sub_bagian: string;
  program_kegiatan: string;
  indikator_kinerja: string;
  tahun: number;
  target_dokumen: number;
  satuan_target: string;
}

export interface DocumentDeadline {
  id: number;
  title: string;
  deadline_date: string;
  target_divisi: string;
  description: string;
  status: 'aktif' | 'selesai' | 'terlewat';
}

export interface FeedbackItem {
  id: number;
  dataset_id: number;
  dataset_title: string;
  user_id: number;
  user_name: string;
  user_role: string;
  message: string;
  created_at: string;
  is_read?: boolean;
  reply?: string;
  reply_by?: string;
  reply_at?: string;
}

export interface ActivityLog {
  id: number;
  user_name: string;
  action: string;
  target: string;
  timestamp: string;
  ip_address: string;
}

export interface DatasetRevision {
  id: number;
  dataset_id: number;
  dataset_title: string;
  user_id: number;
  user_name: string;
  notes: string;
  status: 'menunggu_perbaikan' | 'telah_diperbaiki';
  created_at: string;
}
