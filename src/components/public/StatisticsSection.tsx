import React, { useState } from 'react';
import { useApp } from '../../context/AppContext';
import {
  BarChart2,
  PieChart,
  TrendingUp,
  Award,
  Users,
  Lightbulb,
  Building2,
  FileCheck2,
  ChevronRight,
} from 'lucide-react';

export const StatisticsSection: React.FC = () => {
  const { datasets, sicakabReports } = useApp();
  const [activeMetric, setActiveMetric] = useState<'peneliti' | 'bidang' | 'inovasi' | 'anggaran' | 'sicakab'>('peneliti');

  const litbangCount = datasets.filter((d) => d.category === 'Litbangjirap').length;
  const inovasiCount = datasets.filter((d) => d.category === 'Invensi Inovasi').length;
  const sekretariatCount = datasets.filter((d) => d.category === 'Sekretariat').length;

  return (
    <div className="bg-slate-50 min-h-screen py-10">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 space-y-6">
        {/* Breadcrumb & Header */}
        <div>
          <div className="flex items-center gap-2 text-xs text-slate-500 mb-2">
            <span>Beranda</span>
            <ChevronRight className="w-3.5 h-3.5 text-slate-400" />
            <span className="text-[#004b87] font-semibold">Statistik & Analitik</span>
          </div>
          <h2 className="text-2xl font-bold text-slate-900 tracking-tight">
            Dashboard Statistik Riset & Inovasi Jawa Timur
          </h2>
          <p className="text-xs text-slate-600 mt-1">
            Visualisasi data agregat dan tren capaian riset berbasis Satu Data Indonesia.
          </p>
        </div>

        {/* Metric Selector Buttons */}
        <div className="flex flex-wrap items-center gap-2 p-1.5 bg-white border border-slate-200 rounded-xl shadow-xs">
          {[
            { id: 'peneliti', label: 'SDM Peneliti', icon: Users },
            { id: 'bidang', label: 'Distribusi Dataset', icon: BarChart2 },
            { id: 'inovasi', label: 'Indeks Inovasi (IID)', icon: Lightbulb },
            { id: 'anggaran', label: 'Alokasi Anggaran Riset', icon: Building2 },
            { id: 'sicakab', label: 'Progres SICAKAB', icon: FileCheck2 },
          ].map((m) => {
            const Icon = m.icon;
            return (
              <button
                key={m.id}
                onClick={() => setActiveMetric(m.id as any)}
                className={`px-4 py-2 rounded-lg text-xs font-semibold transition-all flex items-center gap-2 ${
                  activeMetric === m.id
                    ? 'bg-[#004b87] text-white shadow-xs'
                    : 'text-slate-600 hover:text-slate-900 hover:bg-slate-50'
                }`}
              >
                <Icon className="w-4 h-4" />
                {m.label}
              </button>
            );
          })}
        </div>

        {/* View 1: SDM Peneliti */}
        {activeMetric === 'peneliti' && (
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            {/* Gender Chart */}
            <div className="bg-white rounded-xl p-6 border border-slate-200 shadow-xs space-y-4">
              <div className="flex items-center justify-between pb-3 border-b border-slate-100">
                <h3 className="text-sm font-bold text-slate-900 flex items-center gap-2">
                  <Users className="w-4 h-4 text-[#004b87]" />
                  Proporsi Peneliti Berdasarkan Jenis Kelamin
                </h3>
                <span className="text-xs font-semibold text-slate-500 tabular-nums">Total: 298 Peneliti</span>
              </div>

              <div className="space-y-4 py-2">
                <div>
                  <div className="flex justify-between text-xs font-medium text-slate-700 mb-1.5">
                    <span>Laki-Laki (54.0%)</span>
                    <span className="font-bold tabular-nums">161 Orang</span>
                  </div>
                  <div className="h-4 w-full bg-slate-100 rounded-full overflow-hidden">
                    <div className="h-full bg-[#004b87] rounded-full" style={{ width: '54.0%' }} />
                  </div>
                </div>

                <div>
                  <div className="flex justify-between text-xs font-medium text-slate-700 mb-1.5">
                    <span>Perempuan (46.0%)</span>
                    <span className="font-bold tabular-nums">137 Orang</span>
                  </div>
                  <div className="h-4 w-full bg-slate-100 rounded-full overflow-hidden">
                    <div className="h-full bg-sky-500 rounded-full" style={{ width: '46.0%' }} />
                  </div>
                </div>
              </div>

              <div className="p-3 bg-sky-50 rounded-lg text-xs text-slate-600 leading-relaxed">
                Rasio kesetaraan gender peneliti di lingkungan Jawa Timur mendekati seimbang (46% keterwakilan perempuan),
                melampaui target indikator nasional 40%.
              </div>
            </div>

            {/* Jenjang Jabatan Fungsional */}
            <div className="bg-white rounded-xl p-6 border border-slate-200 shadow-xs space-y-4">
              <div className="flex items-center justify-between pb-3 border-b border-slate-100">
                <h3 className="text-sm font-bold text-slate-900 flex items-center gap-2">
                  <Award className="w-4 h-4 text-amber-600" />
                  Peneliti Berdasarkan Jenjang Jabatan
                </h3>
                <span className="text-xs text-slate-400">Tahun 2025/2026</span>
              </div>

              <div className="space-y-3 py-1">
                {[
                  { label: 'Peneliti Ahli Utama', count: 70, pct: 23.5, color: 'bg-emerald-600' },
                  { label: 'Peneliti Ahli Madya', count: 122, pct: 40.9, color: 'bg-[#004b87]' },
                  { label: 'Peneliti Ahli Muda', count: 80, pct: 26.8, color: 'bg-sky-500' },
                  { label: 'Peneliti Ahli Pertama', count: 26, pct: 8.8, color: 'bg-amber-500' },
                ].map((item, idx) => (
                  <div key={idx} className="space-y-1">
                    <div className="flex justify-between text-xs text-slate-700">
                      <span className="font-medium">{item.label}</span>
                      <span className="tabular-nums font-bold">
                        {item.count} org ({item.pct}%)
                      </span>
                    </div>
                    <div className="h-2.5 w-full bg-slate-100 rounded-full overflow-hidden">
                      <div
                        className={`h-full ${item.color} rounded-full`}
                        style={{ width: `${item.pct}%` }}
                      />
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </div>
        )}

        {/* View 2: Distribusi Dataset */}
        {activeMetric === 'bidang' && (
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            <div className="bg-white rounded-xl p-6 border border-slate-200 shadow-xs space-y-3">
              <div className="w-10 h-10 rounded-lg bg-blue-50 text-[#004b87] flex items-center justify-center">
                <BarChart2 className="w-5 h-5" />
              </div>
              <h3 className="text-sm font-bold text-slate-900">Bidang Litbangjirap</h3>
              <div className="text-3xl font-extrabold text-[#004b87] tabular-nums">
                {litbangCount} <span className="text-xs font-normal text-slate-500">Dataset</span>
              </div>
              <p className="text-xs text-slate-500 leading-relaxed">
                Policy Paper, Naskah Kebijakan, Repositori Kajian Strategis, dan Publikasi Ilmiah Nasional/Internasional.
              </p>
            </div>

            <div className="bg-white rounded-xl p-6 border border-slate-200 shadow-xs space-y-3">
              <div className="w-10 h-10 rounded-lg bg-amber-50 text-amber-600 flex items-center justify-center">
                <Lightbulb className="w-5 h-5" />
              </div>
              <h3 className="text-sm font-bold text-slate-900">Bidang Invensi & Inovasi</h3>
              <div className="text-3xl font-extrabold text-amber-600 tabular-nums">
                {inovasiCount} <span className="text-xs font-normal text-slate-500">Dataset</span>
              </div>
              <p className="text-xs text-slate-500 leading-relaxed">
                Indeks Inovasi Daerah, Inovasi IGA Kemendagri, Hak Kekayaan Intelektual (HKI/Paten), dan Diseminasi.
              </p>
            </div>

            <div className="bg-white rounded-xl p-6 border border-slate-200 shadow-xs space-y-3">
              <div className="w-10 h-10 rounded-lg bg-emerald-50 text-emerald-600 flex items-center justify-center">
                <Building2 className="w-5 h-5" />
              </div>
              <h3 className="text-sm font-bold text-slate-900">Sekretariat BRIDA</h3>
              <div className="text-3xl font-extrabold text-emerald-600 tabular-nums">
                {sekretariatCount} <span className="text-xs font-normal text-slate-500">Dataset</span>
              </div>
              <p className="text-xs text-slate-500 leading-relaxed">
                Statistik Peneliti, Analis Kebijakan, Perjanjian Kerjasama (PKS), serta Realisasi Anggaran Riset.
              </p>
            </div>
          </div>
        )}

        {/* View 3: Indeks Inovasi Daerah (IID) */}
        {activeMetric === 'inovasi' && (
          <div className="bg-white rounded-xl p-6 border border-slate-200 shadow-xs space-y-5">
            <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3 pb-3 border-b border-slate-100">
              <div>
                <h3 className="text-sm font-bold text-slate-900 flex items-center gap-2">
                  <Award className="w-4 h-4 text-amber-500" />
                  Top Indeks Inovasi Daerah (IID) Jawa Timur Tahun 2025
                </h3>
                <p className="text-xs text-slate-500">
                  Pengukuran kepatuhan dan kematangan inovasi daerah berdasarkan indikator IGA Kemendagri.
                </p>
              </div>
              <span className="text-xs font-bold text-emerald-700 bg-emerald-50 px-3 py-1 rounded-full border border-emerald-200">
                Jatim: Provinsi Terinovatif Nasional
              </span>
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
              {[
                { name: 'Pemerintah Provinsi Jawa Timur', score: 88.45, count: 312, rank: 1 },
                { name: 'Kota Surabaya', score: 87.12, count: 145, rank: 2 },
                { name: 'Kabupaten Banyuwangi', score: 86.90, count: 132, rank: 3 },
                { name: 'Kota Malang', score: 84.20, count: 98, rank: 4 },
                { name: 'Kabupaten Trenggalek', score: 81.75, count: 87, rank: 5 },
                { name: 'Kabupaten Sidoarjo', score: 80.30, count: 94, rank: 6 },
              ].map((item) => (
                <div key={item.rank} className="p-4 rounded-xl border border-slate-200 bg-slate-50/60 space-y-2">
                  <div className="flex items-center justify-between">
                    <span className="text-xs font-bold text-slate-400">#{item.rank}</span>
                    <span className="text-[11px] font-semibold text-emerald-700 bg-emerald-50 px-2 py-0.5 rounded">
                      Sangat Inovatif
                    </span>
                  </div>
                  <h4 className="text-sm font-bold text-slate-900">{item.name}</h4>
                  <div className="flex items-center justify-between text-xs pt-1 border-t border-slate-200/60">
                    <span className="text-slate-500">Skor IID:</span>
                    <span className="font-extrabold text-[#004b87] tabular-nums text-sm">
                      {item.score}
                    </span>
                  </div>
                  <div className="text-[11px] text-slate-500">
                    {item.count} Inovasi Terdaftar di Kemendagri
                  </div>
                </div>
              ))}
            </div>
          </div>
        )}

        {/* View 4: Alokasi Anggaran Riset */}
        {activeMetric === 'anggaran' && (
          <div className="bg-white rounded-xl p-6 border border-slate-200 shadow-xs space-y-5">
            <div className="pb-3 border-b border-slate-100">
              <h3 className="text-sm font-bold text-slate-900">
                Realisasi Anggaran Riset & Inovasi (Tahun Anggaran 2025)
              </h3>
              <p className="text-xs text-slate-500 mt-0.5">
                Alokasi fiskal APBD Jawa Timur untuk kegiatan penelitian dan ekosistem inovasi.
              </p>
            </div>

            <div className="space-y-4">
              {[
                { name: 'Riset Kebijakan Pembangunan Daerah', pagu: 'Rp 4,25 M', real: 'Rp 4,18 M', pct: 98.4 },
                { name: 'Pengembangan Ekosistem Inovasi & IGA', pagu: 'Rp 3,10 M', real: 'Rp 3,04 M', pct: 98.1 },
                { name: 'Fasilitasi HKI & Sentra Kekayaan Intelektual', pagu: 'Rp 850 Jt', real: 'Rp 835 Jt', pct: 98.2 },
                { name: 'Penunjang Urusan Pemerintahan Daerah', pagu: 'Rp 6,50 M', real: 'Rp 6,41 M', pct: 98.6 },
              ].map((prog, idx) => (
                <div key={idx} className="p-4 rounded-lg bg-slate-50 border border-slate-200 space-y-2">
                  <div className="flex flex-col sm:flex-row sm:items-center justify-between text-xs gap-1">
                    <span className="font-bold text-slate-800">{prog.name}</span>
                    <span className="font-semibold text-slate-600 tabular-nums">
                      Pagu: {prog.pagu} · Realisasi: {prog.real} ({prog.pct}%)
                    </span>
                  </div>
                  <div className="h-3 w-full bg-slate-200 rounded-full overflow-hidden">
                    <div className="h-full bg-emerald-600 rounded-full" style={{ width: `${prog.pct}%` }} />
                  </div>
                </div>
              ))}
            </div>
          </div>
        )}

        {/* View 5: Progres SICAKAB */}
        {activeMetric === 'sicakab' && (
          <div className="bg-white rounded-xl p-6 border border-slate-200 shadow-xs space-y-5">
            <div className="pb-3 border-b border-slate-100 flex items-center justify-between">
              <div>
                <h3 className="text-sm font-bold text-slate-900">
                  Monitoring Capaian Kinerja Triwulanan (SICAKAB 2026)
                </h3>
                <p className="text-xs text-slate-500">
                  Status pelaporan berkala dari tiap unit kerja di BRIDA Jawa Timur.
                </p>
              </div>
              <span className="text-xs font-bold text-[#004b87] bg-sky-50 px-3 py-1 rounded-full border border-sky-200">
                {sicakabReports.length} Laporan Kinerja
              </span>
            </div>

            <div className="space-y-4">
              {sicakabReports.map((report) => (
                <div key={report.id} className="p-4 rounded-lg border border-slate-200 bg-slate-50/50 space-y-3">
                  <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-2 text-xs">
                    <div>
                      <span className="text-[11px] font-semibold text-[#004b87]">{report.bagian}</span>
                      <h4 className="font-bold text-slate-900 text-sm mt-0.5">{report.indikator_kinerja}</h4>
                    </div>
                    <span
                      className={`px-2.5 py-1 rounded-full text-[11px] font-semibold self-start sm:self-auto ${
                        report.status === 'diverifikasi'
                          ? 'bg-emerald-50 text-emerald-700 border border-emerald-200'
                          : report.status === 'perlu_perbaikan'
                          ? 'bg-rose-50 text-rose-700 border border-rose-200'
                          : 'bg-amber-50 text-amber-700 border border-amber-200'
                      }`}
                    >
                      {report.status.replace('_', ' ').toUpperCase()}
                    </span>
                  </div>

                  {/* 4 Quarter Badges */}
                  <div className="grid grid-cols-4 gap-2 text-center text-xs pt-2 border-t border-slate-200">
                    <div className="bg-white p-2 rounded border border-slate-200">
                      <span className="text-[10px] text-slate-400 block">Triwulan I</span>
                      <span className="font-bold text-slate-800 tabular-nums">{report.tw1}</span>
                    </div>
                    <div className="bg-white p-2 rounded border border-slate-200">
                      <span className="text-[10px] text-slate-400 block">Triwulan II</span>
                      <span className="font-bold text-slate-800 tabular-nums">{report.tw2}</span>
                    </div>
                    <div className="bg-white p-2 rounded border border-slate-200">
                      <span className="text-[10px] text-slate-400 block">Triwulan III</span>
                      <span className="font-bold text-slate-800 tabular-nums">{report.tw3}</span>
                    </div>
                    <div className="bg-white p-2 rounded border border-slate-200">
                      <span className="text-[10px] text-slate-400 block">Triwulan IV</span>
                      <span className="font-bold text-slate-800 tabular-nums">{report.tw4}</span>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </div>
        )}
      </div>
    </div>
  );
};
