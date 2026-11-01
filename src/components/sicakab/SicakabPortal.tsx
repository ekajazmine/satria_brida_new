import React, { useState } from 'react';
import { useApp } from '../../context/AppContext';
import { SicakabReport } from '../../types';
import { SicakabReportModal } from './SicakabReportModal';
import { SicakabEvaluasiModal } from './SicakabEvaluasiModal';
import { SicakabTindakLanjutModal } from './SicakabTindakLanjutModal';
import {
  FileCheck2,
  Plus,
  Download,
  Filter,
  CheckCircle2,
  AlertCircle,
  Clock,
  ExternalLink,
  ChevronRight,
  TrendingUp,
  FileText,
  Building,
  Target,
} from 'lucide-react';

export const SicakabPortal: React.FC = () => {
  const { sicakabReports, currentUser, deleteSicakabReport, notify } = useApp();

  const [filterBagian, setFilterBagian] = useState<string>('Semua');
  const [reportModalOpen, setReportModalOpen] = useState(false);
  const [reportToEdit, setReportToEdit] = useState<SicakabReport | null>(null);

  const [evaluasiModalOpen, setEvaluasiModalOpen] = useState(false);
  const [reportToEvaluate, setReportToEvaluate] = useState<SicakabReport | null>(null);

  const [tlModalOpen, setTlModalOpen] = useState(false);
  const [reportToTl, setReportToTl] = useState<SicakabReport | null>(null);

  const [expandedId, setExpandedId] = useState<number | null>(null);

  const canEdit =
    currentUser?.role === 'super_admin' || currentUser?.role === 'produsen_data' || currentUser?.role === 'produsen';
  const canEvaluate =
    currentUser?.role === 'super_admin' || currentUser?.role === 'verifikator';

  const filteredReports = sicakabReports.filter((r) => {
    if (filterBagian !== 'Semua' && !r.bagian.toLowerCase().includes(filterBagian.toLowerCase())) {
      return false;
    }
    return true;
  });

  const avgCapaian =
    sicakabReports.length > 0
      ? (sicakabReports.reduce((acc, r) => acc + r.capaian, 0) / sicakabReports.length).toFixed(1)
      : 0;

  const handleExportPdf = () => {
    notify('Mengunduh Berita Acara Rekapitulasi Capaian Kinerja SICAKAB (PDF)...');
  };

  return (
    <div className="bg-slate-50 min-h-screen py-10">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 space-y-6">
        {/* Breadcrumb & Section Header */}
        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
          <div>
            <div className="flex items-center gap-2 text-xs text-slate-500 mb-2">
              <span>Beranda</span>
              <ChevronRight className="w-3.5 h-3.5 text-slate-400" />
              <span className="text-[#004b87] font-semibold">Modul SICAKAB</span>
            </div>
            <h2 className="text-2xl font-bold text-slate-900 tracking-tight flex items-center gap-2.5">
              <FileCheck2 className="w-7 h-7 text-emerald-600" />
              Sistem Informasi Capaian Kinerja (SICAKAB)
            </h2>
            <p className="text-xs text-slate-600 mt-1">
              Instrumen monitoring capaian kinerja, target fisik & anggaran, serta evaluasi tindak lanjut berjenjang.
            </p>
          </div>

          <div className="flex flex-wrap items-center gap-2">
            <button
              onClick={handleExportPdf}
              className="px-3.5 py-2 border border-slate-200 bg-white hover:bg-slate-50 text-slate-700 rounded-lg text-xs font-semibold flex items-center gap-1.5 shadow-xs transition-colors"
            >
              <Download className="w-4 h-4 text-slate-500" />
              Ekspor Rekap PDF
            </button>

            {canEdit && (
              <button
                onClick={() => {
                  setReportToEdit(null);
                  setReportModalOpen(true);
                }}
                className="px-4 py-2 bg-emerald-600 hover:bg-emerald-700 text-white rounded-lg text-xs font-semibold shadow-xs flex items-center gap-1.5 transition-colors"
              >
                <Plus className="w-4 h-4" />
                Tambah Laporan Kinerja
              </button>
            )}
          </div>
        </div>

        {/* 4 Summary Cards */}
        <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
          <div className="bg-white rounded-xl p-4 border border-slate-200 shadow-xs">
            <span className="text-[11px] font-semibold text-slate-500 block">Total Indikator Terpantau</span>
            <div className="text-2xl font-extrabold text-slate-900 mt-1 tabular-nums">
              {sicakabReports.length} <span className="text-xs font-normal text-slate-400">Indikator</span>
            </div>
          </div>

          <div className="bg-white rounded-xl p-4 border border-slate-200 shadow-xs">
            <span className="text-[11px] font-semibold text-slate-500 block">Rata-Rata Capaian Organisasi</span>
            <div className="text-2xl font-extrabold text-emerald-600 mt-1 tabular-nums">
              {avgCapaian}%
            </div>
          </div>

          <div className="bg-white rounded-xl p-4 border border-slate-200 shadow-xs">
            <span className="text-[11px] font-semibold text-slate-500 block">Laporan Diverifikasi</span>
            <div className="text-2xl font-extrabold text-[#004b87] mt-1 tabular-nums">
              {sicakabReports.filter((r) => r.status === 'diverifikasi').length}
            </div>
          </div>

          <div className="bg-white rounded-xl p-4 border border-slate-200 shadow-xs">
            <span className="text-[11px] font-semibold text-slate-500 block">Menunggu Tindak Lanjut</span>
            <div className="text-2xl font-extrabold text-amber-600 mt-1 tabular-nums">
              {sicakabReports.filter((r) => r.status !== 'diverifikasi').length}
            </div>
          </div>
        </div>

        {/* Filter Bar */}
        <div className="bg-white rounded-xl p-4 border border-slate-200 shadow-xs flex flex-wrap items-center justify-between gap-3">
          <div className="flex items-center gap-2 text-xs font-bold text-slate-700">
            <Filter className="w-4 h-4 text-[#004b87]" />
            <span>Saring Unit Kerja:</span>
          </div>

          <div className="flex flex-wrap gap-1.5">
            {[
              { id: 'Semua', label: 'Semua Unit Kerja' },
              { id: 'Sekretariat', label: 'Sekretariat BRIDA' },
              { id: 'Litbang', label: 'Bidang Litbangjirap' },
              { id: 'Inovasi', label: 'Bidang Invensi & Inovasi' },
            ].map((f) => (
              <button
                key={f.id}
                onClick={() => setFilterBagian(f.id)}
                className={`px-3 py-1.5 rounded-lg text-xs font-semibold transition-colors ${
                  filterBagian === f.id
                    ? 'bg-[#004b87] text-white shadow-xs'
                    : 'bg-slate-100 text-slate-600 hover:bg-slate-200'
                }`}
              >
                {f.label}
              </button>
            ))}
          </div>
        </div>

        {/* SICAKAB Reports List */}
        <div className="space-y-4">
          {filteredReports.map((report) => {
            const isExpanded = expandedId === report.id;
            return (
              <div
                key={report.id}
                className="bg-white rounded-xl border border-slate-200 shadow-xs overflow-hidden transition-all hover:border-slate-300"
              >
                <div className="p-5 space-y-3">
                  <div className="flex flex-col sm:flex-row sm:items-start justify-between gap-3">
                    <div className="space-y-1 flex-1">
                      <div className="flex flex-wrap items-center gap-2 text-xs text-slate-500">
                        <span className="font-bold text-[#004b87]">{report.bagian}</span>
                        <span>·</span>
                        <span>{report.sub_bagian}</span>
                        <span>·</span>
                        <span className="tabular-nums">Tahun Anggaran {report.tahun}</span>
                      </div>

                      <h3 className="text-base font-bold text-slate-900 leading-snug">
                        {report.indikator_kinerja}
                      </h3>

                      <p className="text-xs text-slate-600 line-clamp-1">
                        Program/Kegiatan: {report.program_kegiatan}
                      </p>
                    </div>

                    <div className="flex items-center gap-2 shrink-0 self-start">
                      <span
                        className={`inline-flex items-center gap-1 px-3 py-1 rounded-full text-xs font-bold ${
                          report.status === 'diverifikasi'
                            ? 'bg-emerald-50 text-emerald-700 border border-emerald-200'
                            : report.status === 'perlu_perbaikan'
                            ? 'bg-rose-50 text-rose-700 border border-rose-200'
                            : 'bg-amber-50 text-amber-700 border border-amber-200'
                        }`}
                      >
                        {report.status === 'diverifikasi' && <CheckCircle2 className="w-3.5 h-3.5" />}
                        {report.status === 'perlu_perbaikan' && <AlertCircle className="w-3.5 h-3.5" />}
                        {report.status === 'menunggu_evaluasi' && <Clock className="w-3.5 h-3.5" />}
                        {report.status.replace('_', ' ').toUpperCase()}
                      </span>
                    </div>
                  </div>

                  {/* Triwulan Strips */}
                  <div className="grid grid-cols-2 sm:grid-cols-5 gap-3 pt-2 text-xs">
                    <div className="bg-slate-50 p-2.5 rounded-lg border border-slate-200">
                      <span className="text-[10px] text-slate-500 block">Target Kinerja:</span>
                      <span className="font-extrabold text-slate-900 tabular-nums">
                        {report.target} {report.satuan_target}
                      </span>
                    </div>

                    <div className="bg-slate-50 p-2.5 rounded-lg border border-slate-200">
                      <span className="text-[10px] text-slate-500 block">TW I:</span>
                      <span className="font-bold text-slate-800 tabular-nums">{report.tw1}</span>
                    </div>

                    <div className="bg-slate-50 p-2.5 rounded-lg border border-slate-200">
                      <span className="text-[10px] text-slate-500 block">TW II:</span>
                      <span className="font-bold text-slate-800 tabular-nums">{report.tw2}</span>
                    </div>

                    <div className="bg-slate-50 p-2.5 rounded-lg border border-slate-200">
                      <span className="text-[10px] text-slate-500 block">TW III:</span>
                      <span className="font-bold text-slate-800 tabular-nums">{report.tw3}</span>
                    </div>

                    <div className="bg-slate-50 p-2.5 rounded-lg border border-slate-200">
                      <span className="text-[10px] text-slate-500 block">TW IV:</span>
                      <span className="font-bold text-slate-800 tabular-nums">{report.tw4}</span>
                    </div>
                  </div>

                  {/* Progress Bar */}
                  <div className="space-y-1 pt-1">
                    <div className="flex justify-between text-xs font-semibold text-slate-700">
                      <span>Akumulasi Capaian Kinerja:</span>
                      <span className="font-extrabold text-[#004b87] tabular-nums">
                        {report.capaian}%
                      </span>
                    </div>
                    <div className="h-2 w-full bg-slate-100 rounded-full overflow-hidden">
                      <div
                        className={`h-full rounded-full ${
                          report.capaian >= 100
                            ? 'bg-emerald-600'
                            : report.capaian >= 70
                            ? 'bg-[#004b87]'
                            : 'bg-amber-500'
                        }`}
                        style={{ width: `${Math.min(100, report.capaian)}%` }}
                      />
                    </div>
                  </div>

                  {/* Action Buttons */}
                  <div className="pt-3 border-t border-slate-100 flex flex-wrap items-center justify-between gap-3 text-xs">
                    <button
                      onClick={() => setExpandedId(isExpanded ? null : report.id)}
                      className="font-bold text-[#004b87] hover:underline flex items-center gap-1"
                    >
                      {isExpanded ? 'Tutup Rincian' : 'Lihat Narasi Capaian & Rekomendasi'}
                    </button>

                    <div className="flex items-center gap-2">
                      {canEvaluate && (
                        <button
                          onClick={() => {
                            setReportToEvaluate(report);
                            setEvaluasiModalOpen(true);
                          }}
                          className="px-3 py-1.5 bg-[#004b87] hover:bg-[#003865] text-white rounded-lg font-semibold transition-colors flex items-center gap-1"
                        >
                          Evaluasi Laporan
                        </button>
                      )}

                      {canEdit && (
                        <>
                          <button
                            onClick={() => {
                              setReportToTl(report);
                              setTlModalOpen(true);
                            }}
                            className="px-3 py-1.5 bg-blue-50 text-blue-700 hover:bg-blue-100 rounded-lg font-semibold transition-colors border border-blue-200"
                          >
                            Tindak Lanjut
                          </button>

                          <button
                            onClick={() => {
                              setReportToEdit(report);
                              setReportModalOpen(true);
                            }}
                            className="px-3 py-1.5 border border-slate-200 text-slate-700 hover:bg-slate-50 rounded-lg font-semibold transition-colors"
                          >
                            Edit
                          </button>
                        </>
                      )}
                    </div>
                  </div>
                </div>

                {/* Collapsible Details */}
                {isExpanded && (
                  <div className="bg-slate-50 p-5 border-t border-slate-200 space-y-4 text-xs">
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                      <div className="space-y-1">
                        <span className="font-bold text-slate-800 block">Narasi Capaian:</span>
                        <p className="text-slate-600 leading-relaxed bg-white p-3 rounded border border-slate-200">
                          {report.keterangan || 'Belum ada catatan naratif.'}
                        </p>
                      </div>

                      <div className="space-y-1">
                        <span className="font-bold text-slate-800 block">Faktor Pendukung & Hambatan:</span>
                        <div className="bg-white p-3 rounded border border-slate-200 space-y-1 text-slate-600">
                          <div>
                            <strong>Pendukung:</strong> {report.faktor_pendukung || '-'}
                          </div>
                          <div>
                            <strong>Kendala:</strong> {report.peluang_hambatan || '-'}
                          </div>
                        </div>
                      </div>
                    </div>

                    {/* Evaluasi Verifikator */}
                    {report.evaluasi_hasil && (
                      <div className="p-3 bg-amber-50 rounded-lg border border-amber-200 space-y-1">
                        <span className="font-bold text-amber-900 block">
                          Catatan Hasil Evaluasi (Oleh: {report.evaluasi_by || 'Verifikator'} -{' '}
                          {report.evaluasi_at}):
                        </span>
                        <p className="text-slate-700">{report.evaluasi_hasil}</p>
                        {report.evaluasi_rekomendasi && (
                          <p className="text-slate-700 pt-1 border-t border-amber-200">
                            <strong>Rekomendasi:</strong> {report.evaluasi_rekomendasi}
                          </p>
                        )}
                      </div>
                    )}

                    {/* Tindak Lanjut Produsen */}
                    {report.tindak_lanjut_rencana && (
                      <div className="p-3 bg-sky-50 rounded-lg border border-sky-200 space-y-1">
                        <span className="font-bold text-[#004b87] block">
                          Tindak Lanjut Unit Pengampu:
                        </span>
                        <p className="text-slate-700">
                          <strong>Rencana:</strong> {report.tindak_lanjut_rencana}
                        </p>
                        {report.tindak_lanjut_hasil && (
                          <p className="text-slate-700">
                            <strong>Hasil:</strong> {report.tindak_lanjut_hasil}
                          </p>
                        )}
                      </div>
                    )}

                    {report.link_dokumen && (
                      <div className="pt-2">
                        <a
                          href={report.link_dokumen}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="inline-flex items-center gap-1.5 text-xs font-semibold text-[#004b87] hover:underline"
                        >
                          <ExternalLink className="w-3.5 h-3.5" />
                          Buka Berkas Bukti Dukung ({report.link_dokumen})
                        </a>
                      </div>
                    )}
                  </div>
                )}
              </div>
            );
          })}
        </div>
      </div>

      {/* Modals */}
      <SicakabReportModal
        isOpen={reportModalOpen}
        onClose={() => setReportModalOpen(false)}
        reportToEdit={reportToEdit}
      />

      <SicakabEvaluasiModal
        report={reportToEvaluate}
        onClose={() => setReportToEvaluate(null)}
      />

      <SicakabTindakLanjutModal
        report={reportToTl}
        onClose={() => setReportToTl(null)}
      />
    </div>
  );
};
