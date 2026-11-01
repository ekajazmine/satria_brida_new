import React from 'react';
import { Database, ShieldCheck, FileCheck, Layers, MapPin, Mail, Phone, ChevronRight } from 'lucide-react';

export const AboutSection: React.FC = () => {
  return (
    <div className="bg-slate-50 min-h-screen py-10">
      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8 space-y-8">
        {/* Breadcrumb & Header */}
        <div>
          <div className="flex items-center gap-2 text-xs text-slate-500 mb-2">
            <span>Beranda</span>
            <ChevronRight className="w-3.5 h-3.5 text-slate-400" />
            <span className="text-[#004b87] font-semibold">Tentang SATRIA BRIDA</span>
          </div>
          <h2 className="text-2xl font-bold text-slate-900 tracking-tight">
            Tentang Portal SATRIA BRIDA
          </h2>
          <p className="text-xs text-slate-600 mt-1">
            Sistem Satu Data Riset dan Inovasi Daerah Badan Riset dan Inovasi Daerah Provinsi Jawa Timur.
          </p>
        </div>

        {/* Vision & Mission Card */}
        <div className="bg-white rounded-xl p-6 border border-slate-200 shadow-xs space-y-4">
          <div className="flex items-center gap-3 pb-3 border-b border-slate-100">
            <div className="w-10 h-10 rounded-lg bg-sky-100 text-[#004b87] flex items-center justify-center">
              <Database className="w-5 h-5" />
            </div>
            <div>
              <h3 className="text-base font-bold text-slate-900">Latar Belakang & Tujuan</h3>
              <p className="text-xs text-slate-500">Mewujudkan Ekosistem Riset Terbuka & Berkelanjutan</p>
            </div>
          </div>

          <p className="text-xs sm:text-sm text-slate-700 leading-relaxed">
            <strong>SATRIA BRIDA</strong> (Satu Data Riset dan Inovasi Daerah) adalah portal resmi pemerintah Provinsi Jawa Timur
            yang mengintegrasikan seluruh data hasil riset, naskah kebijakan (policy paper/brief), perolehan hak kekayaan intelektual (HKI),
            pengukuran Indeks Inovasi Daerah (IID), data kepakaran peneliti, serta pelaporan capaian kinerja organisasi (SICAKAB).
          </p>

          <p className="text-xs sm:text-sm text-slate-700 leading-relaxed">
            Portal ini dibangun dengan mengacu langsung pada arsitektur dan prinsip <strong>Portal Satu Data Indonesia (data.go.id)</strong>,
            menjamin data yang dipublikasikan memenuhi standar mutu data, memiliki metadata terstandarisasi, interoperabel, dan menggunakan
            kode referensi yang sah.
          </p>
        </div>

        {/* 4 Pillars of SDI */}
        <div className="bg-white rounded-xl p-6 border border-slate-200 shadow-xs space-y-4">
          <h3 className="text-sm font-bold text-slate-900 uppercase tracking-wider">
            Kepatuhan Terhadap Prinsip Satu Data Indonesia
          </h3>

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <div className="p-4 rounded-lg bg-slate-50 border border-slate-200 space-y-2">
              <div className="flex items-center gap-2 text-xs font-bold text-[#004b87]">
                <ShieldCheck className="w-4 h-4" />
                1. Standar Data Baku
              </div>
              <p className="text-xs text-slate-600 leading-relaxed">
                Setiap dataset memiliki konsep, definisi, cakupan, dan klasifikasi yang seragam sesuai regulasi BPS dan Satu Data Indonesia.
              </p>
            </div>

            <div className="p-4 rounded-lg bg-slate-50 border border-slate-200 space-y-2">
              <div className="flex items-center gap-2 text-xs font-bold text-[#004b87]">
                <FileCheck className="w-4 h-4" />
                2. Satu Metadata Terstruktur
              </div>
              <p className="text-xs text-slate-600 leading-relaxed">
                Informasi terstruktur mengenai produsen data, tahun pembaruan, metodologi pengumpulan, dan lisensi terbuka.
              </p>
            </div>

            <div className="p-4 rounded-lg bg-slate-50 border border-slate-200 space-y-2">
              <div className="flex items-center gap-2 text-xs font-bold text-[#004b87]">
                <Layers className="w-4 h-4" />
                3. Interoperabilitas Data (API)
              </div>
              <p className="text-xs text-slate-600 leading-relaxed">
                Data disajikan dalam format terbuka (CSV, JSON, REST API) sehingga dapat diakses dan diolah lintas sistem informasi pemerintahan.
              </p>
            </div>

            <div className="p-4 rounded-lg bg-slate-50 border border-slate-200 space-y-2">
              <div className="flex items-center gap-2 text-xs font-bold text-[#004b87]">
                <Database className="w-4 h-4" />
                4. Kode Referensi & Data Induk
              </div>
              <p className="text-xs text-slate-600 leading-relaxed">
                Penggunaan kode wilayah Kemendagri, kode unit kerja Pemprov Jatim, dan NIP/NIDN peneliti yang terintegrasi.
              </p>
            </div>
          </div>
        </div>

        {/* Legal Basis */}
        <div className="bg-white rounded-xl p-6 border border-slate-200 shadow-xs space-y-3">
          <h3 className="text-sm font-bold text-slate-900">Landasan Hukum & Kebijakan</h3>
          <ul className="text-xs text-slate-700 space-y-2 list-disc list-inside leading-relaxed">
            <li><strong>Peraturan Presiden No. 39 Tahun 2019</strong> tentang Satu Data Indonesia.</li>
            <li><strong>Undang-Undang No. 11 Tahun 2019</strong> tentang Sistem Nasional Ilmu Pengetahuan dan Teknologi.</li>
            <li><strong>Peraturan Daerah Provinsi Jawa Timur</strong> tentang Pembentukan Badan Riset dan Inovasi Daerah (BRIDA).</li>
            <li><strong>Peraturan Gubernur Jawa Timur</strong> tentang Tata Kelola Satu Data Jawa Timur.</li>
          </ul>
        </div>
      </div>
    </div>
  );
};
