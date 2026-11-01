import React, { useState } from 'react';
import { useApp } from '../../context/AppContext';
import { Dataset } from '../../types';
import {
  ArrowLeft,
  Download,
  FileSpreadsheet,
  FileText,
  Calendar,
  Building,
  User,
  Share2,
  CheckCircle2,
  MessageSquare,
  Clock,
  Layers,
  Search,
  ExternalLink,
  Send,
  AlertCircle,
} from 'lucide-react';

interface DatasetDetailProps {
  datasetId: number;
  onBack: () => void;
}

export const DatasetDetail: React.FC<DatasetDetailProps> = ({ datasetId, onBack }) => {
  const { datasets, feedbacks, addFeedback, currentUser, openPreview, notify } = useApp();
  const dataset = datasets.find((d) => d.id === datasetId);

  const [activeTab, setActiveTab] = useState<'preview' | 'metadata' | 'pdf' | 'discussion'>('preview');
  const [tableSearch, setTableSearch] = useState('');
  const [feedbackInput, setFeedbackInput] = useState('');

  if (!dataset) {
    return (
      <div className="max-w-4xl mx-auto py-16 px-4 text-center">
        <h2 className="text-xl font-bold text-slate-800">Dataset tidak ditemukan</h2>
        <button
          onClick={onBack}
          className="mt-4 px-4 py-2 bg-[#004b87] text-white rounded-lg text-xs font-semibold"
        >
          Kembali ke Katalog
        </button>
      </div>
    );
  }

  const relatedFeedbacks = feedbacks.filter((f) => f.dataset_id === dataset.id);

  const handleDownload = (format: 'csv' | 'pdf') => {
    dataset.downloads_count += 1;
    notify(`Mengunduh berkas ${dataset.title} (${format.toUpperCase()})...`);
    
    const filename = `${dataset.title.replace(/\s+/g, '_')}.${format}`;
    const dummyContent = format === 'csv'
      ? (dataset.preview_data ? dataset.preview_data.columns.join(',') + '\n' + dataset.preview_data.rows.map(r => r.join(',')).join('\n') : 'No,Data\n1,Contoh')
      : `%PDF-1.4\n% SATRIA BRIDA DOKUMEN RESMI\n% Judul: ${dataset.title}\n% Instansi: ${dataset.agency}`;
    
    const blob = new Blob([dummyContent], { type: format === 'csv' ? 'text/csv' : 'application/pdf' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = filename;
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(url);
  };

  const handleCopyApiUrl = () => {
    const apiUrl = `https://satria.brida.jatimprov.go.id/api/datasets?id=${dataset.id}`;
    navigator.clipboard?.writeText(apiUrl);
    notify('Tautan endpoint API Satu Data berhasil disalin ke clipboard.');
  };

  const handleSendFeedback = (e: React.FormEvent) => {
    e.preventDefault();
    if (!feedbackInput.trim()) return;
    addFeedback(dataset.id, feedbackInput.trim());
    setFeedbackInput('');
  };

  // Filter preview table rows
  const filteredRows = dataset.preview_data
    ? dataset.preview_data.rows.filter((row) =>
        row.some((cell) => String(cell).toLowerCase().includes(tableSearch.toLowerCase()))
      )
    : [];

  return (
    <div className="bg-slate-50 min-h-screen py-8">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 space-y-6">
        {/* Back navigation */}
        <button
          onClick={onBack}
          className="inline-flex items-center gap-1.5 text-xs font-semibold text-[#004b87] hover:underline"
        >
          <ArrowLeft className="w-4 h-4" />
          Kembali ke Katalog Dataset
        </button>

        {/* Dataset Header Card */}
        <div className="bg-white rounded-xl p-6 border border-slate-200 shadow-xs space-y-4">
          <div className="flex flex-col md:flex-row md:items-start justify-between gap-4">
            <div className="space-y-2 flex-1">
              <div className="flex flex-wrap items-center gap-2 text-xs text-slate-500">
                <span className="font-semibold text-[#004b87]">{dataset.category}</span>
                <span>·</span>
                <span className="flex items-center gap-1">
                  <Building className="w-3.5 h-3.5 text-slate-400" />
                  {dataset.agency}
                </span>
                <span>·</span>
                <span className="flex items-center gap-1">
                  <Calendar className="w-3.5 h-3.5 text-slate-400" />
                  Tahun {dataset.year}
                </span>
                <span>·</span>
                <span>ID: #{dataset.id}</span>
              </div>

              <h1 className="text-2xl sm:text-3xl font-extrabold text-slate-900 tracking-tight leading-tight">
                {dataset.title}
              </h1>

              <p className="text-xs sm:text-sm text-slate-600 leading-relaxed max-w-4xl">
                {dataset.description}
              </p>
            </div>

            {/* Quick Actions & Status */}
            <div className="flex flex-col sm:items-end gap-3 shrink-0">
              <span className="inline-flex items-center gap-1 px-3 py-1 rounded-full text-xs font-medium bg-emerald-50 text-emerald-700 border border-emerald-200">
                <CheckCircle2 className="w-3.5 h-3.5" />
                Standar SDI Terverifikasi
              </span>

              <div className="flex flex-wrap items-center gap-2">
                <button
                  onClick={() => handleDownload('csv')}
                  className="px-3.5 py-2 bg-[#004b87] hover:bg-[#003865] text-white rounded-lg text-xs font-semibold shadow-xs flex items-center gap-1.5 transition-colors"
                >
                  <Download className="w-3.5 h-3.5" />
                  Unduh CSV
                </button>

                {dataset.pdf_path && (
                  <button
                    onClick={() => handleDownload('pdf')}
                    className="px-3.5 py-2 bg-slate-100 hover:bg-slate-200 text-slate-800 rounded-lg text-xs font-semibold border border-slate-200 flex items-center gap-1.5 transition-colors"
                  >
                    <Download className="w-3.5 h-3.5 text-rose-600" />
                    Unduh PDF
                  </button>
                )}

                <button
                  onClick={handleCopyApiUrl}
                  className="p-2 border border-slate-200 rounded-lg hover:bg-slate-50 text-slate-600 transition-colors"
                  title="Salin Tautan API Endpoint"
                >
                  <Share2 className="w-4 h-4" />
                </button>
              </div>
            </div>
          </div>

          {/* Quick Info Bar */}
          <div className="pt-4 border-t border-slate-100 grid grid-cols-2 sm:grid-cols-4 gap-4 text-xs">
            <div>
              <span className="text-slate-400 block text-[11px]">Penanggung Jawab / Peneliti:</span>
              <span className="font-semibold text-slate-800">{dataset.researcher || '-'}</span>
            </div>
            <div>
              <span className="text-slate-400 block text-[11px]">Frekuensi Pembaruan:</span>
              <span className="font-semibold text-slate-800">{dataset.frekuensi_update || 'Tahunan'}</span>
            </div>
            <div>
              <span className="text-slate-400 block text-[11px]">Terakhir Diperbarui:</span>
              <span className="font-semibold text-slate-800">{dataset.tanggal_update || '2026-01-15'}</span>
            </div>
            <div>
              <span className="text-slate-400 block text-[11px]">Statistik Akses:</span>
              <span className="font-semibold text-slate-800 tabular-nums">
                {dataset.views_count} Lihat · {dataset.downloads_count} Unduh
              </span>
            </div>
          </div>
        </div>

        {/* Tab Navigation */}
        <div className="border-b border-slate-200 flex items-center gap-2 overflow-x-auto">
          <button
            onClick={() => setActiveTab('preview')}
            className={`px-4 py-3 text-xs font-bold border-b-2 whitespace-nowrap transition-colors flex items-center gap-2 ${
              activeTab === 'preview'
                ? 'border-[#004b87] text-[#004b87]'
                : 'border-transparent text-slate-600 hover:text-slate-900'
            }`}
          >
            <FileSpreadsheet className="w-4 h-4 text-emerald-600" />
            Pratinjau Data Tabular
          </button>

          <button
            onClick={() => setActiveTab('metadata')}
            className={`px-4 py-3 text-xs font-bold border-b-2 whitespace-nowrap transition-colors flex items-center gap-2 ${
              activeTab === 'metadata'
                ? 'border-[#004b87] text-[#004b87]'
                : 'border-transparent text-slate-600 hover:text-slate-900'
            }`}
          >
            <Layers className="w-4 h-4 text-blue-600" />
            Standar Metadata SDI
          </button>

          {dataset.pdf_path && (
            <button
              onClick={() => setActiveTab('pdf')}
              className={`px-4 py-3 text-xs font-bold border-b-2 whitespace-nowrap transition-colors flex items-center gap-2 ${
                activeTab === 'pdf'
                  ? 'border-[#004b87] text-[#004b87]'
                  : 'border-transparent text-slate-600 hover:text-slate-900'
              }`}
            >
              <FileText className="w-4 h-4 text-rose-600" />
              Dokumen Pengesahan PDF
            </button>
          )}

          <button
            onClick={() => setActiveTab('discussion')}
            className={`px-4 py-3 text-xs font-bold border-b-2 whitespace-nowrap transition-colors flex items-center gap-2 ${
              activeTab === 'discussion'
                ? 'border-[#004b87] text-[#004b87]'
                : 'border-transparent text-slate-600 hover:text-slate-900'
            }`}
          >
            <MessageSquare className="w-4 h-4 text-amber-600" />
            Umpan Balik & Diskusi ({relatedFeedbacks.length})
          </button>
        </div>

        {/* Tab 1: Interactive Table Preview */}
        {activeTab === 'preview' && (
          <div className="bg-white rounded-xl border border-slate-200 shadow-xs overflow-hidden space-y-3 p-5">
            <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3 pb-3 border-b border-slate-100">
              <div>
                <h3 className="text-sm font-bold text-slate-900 flex items-center gap-2">
                  <FileSpreadsheet className="w-4 h-4 text-emerald-600" />
                  Pratinjau Lembar Kerja ({dataset.file_path})
                </h3>
                <p className="text-[11px] text-slate-500">
                  Data dapat dicari dan disortir langsung di dalam browser.
                </p>
              </div>

              <div className="flex items-center gap-2">
                <div className="relative">
                  <Search className="w-3.5 h-3.5 text-slate-400 absolute left-2.5 top-1/2 -translate-y-1/2" />
                  <input
                    type="text"
                    value={tableSearch}
                    onChange={(e) => setTableSearch(e.target.value)}
                    placeholder="Saring baris tabel..."
                    className="pl-8 pr-3 py-1.5 text-xs bg-slate-50 border border-slate-200 rounded-lg focus:outline-hidden focus:ring-1 focus:ring-[#004b87]"
                  />
                </div>
                <button
                  onClick={() => openPreview(dataset, 'csv')}
                  className="px-3 py-1.5 bg-slate-100 hover:bg-slate-200 text-slate-700 text-xs font-medium rounded-lg transition-colors flex items-center gap-1"
                >
                  <ExternalLink className="w-3.5 h-3.5" />
                  Layar Penuh
                </button>
              </div>
            </div>

            {dataset.preview_data ? (
              <div className="overflow-x-auto border border-slate-200 rounded-lg">
                <table className="w-full text-left text-xs border-collapse">
                  <thead className="bg-slate-100/80 text-slate-700 font-bold border-b border-slate-200">
                    <tr>
                      {dataset.preview_data.columns.map((col, idx) => (
                        <th key={idx} className="px-4 py-2.5 border-r border-slate-200 last:border-r-0">
                          {col}
                        </th>
                      ))}
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-slate-100 text-slate-700">
                    {filteredRows.length > 0 ? (
                      filteredRows.map((row, rIdx) => (
                        <tr key={rIdx} className="hover:bg-slate-50 transition-colors">
                          {row.map((cell, cIdx) => (
                            <td
                              key={cIdx}
                              className={`px-4 py-2.5 border-r border-slate-100 last:border-r-0 ${
                                typeof cell === 'number' ? 'tabular-nums text-right' : ''
                              }`}
                            >
                              {cell}
                            </td>
                          ))}
                        </tr>
                      ))
                    ) : (
                      <tr>
                        <td
                          colSpan={dataset.preview_data.columns.length}
                          className="px-4 py-6 text-center text-slate-400 italic"
                        >
                          Tidak ada baris yang sesuai pencarian "{tableSearch}"
                        </td>
                      </tr>
                    )}
                  </tbody>
                </table>
              </div>
            ) : (
              <div className="p-8 text-center text-slate-400 italic">
                Pratinjau lembar kerja belum tersedia. Silakan unduh berkas mentah.
              </div>
            )}
          </div>
        )}

        {/* Tab 2: Metadata Matrix */}
        {activeTab === 'metadata' && (
          <div className="bg-white rounded-xl border border-slate-200 shadow-xs p-6 space-y-6">
            <div className="border-b border-slate-100 pb-4">
              <h3 className="text-base font-bold text-slate-900">
                Spesifikasi Metadata Satu Data Indonesia (SDI)
              </h3>
              <p className="text-xs text-slate-500 mt-1">
                Metadata ini mengacu pada standar baku Peraturan Presiden No. 39 Tahun 2019 tentang Satu Data Indonesia.
              </p>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-x-8 gap-y-4 text-xs">
              <div className="border-b border-slate-100 pb-2">
                <span className="text-slate-400 block text-[11px]">Judul Resmi Dataset</span>
                <span className="font-semibold text-slate-800">{dataset.title}</span>
              </div>
              <div className="border-b border-slate-100 pb-2">
                <span className="text-slate-400 block text-[11px]">ID Dataset Nasional / Lokal</span>
                <span className="font-mono text-slate-800">BRIDA-JATIM-DS-{dataset.id.toString().padStart(4, '0')}</span>
              </div>
              <div className="border-b border-slate-100 pb-2">
                <span className="text-slate-400 block text-[11px]">Produsen Data</span>
                <span className="font-semibold text-slate-800">{dataset.agency}</span>
              </div>
              <div className="border-b border-slate-100 pb-2">
                <span className="text-slate-400 block text-[11px]">Bidang / Sektor</span>
                <span className="font-semibold text-slate-800">{dataset.category}</span>
              </div>
              <div className="border-b border-slate-100 pb-2">
                <span className="text-slate-400 block text-[11px]">Penanggung Jawab / Peneliti</span>
                <span className="font-semibold text-slate-800">{dataset.researcher || '-'}</span>
              </div>
              <div className="border-b border-slate-100 pb-2">
                <span className="text-slate-400 block text-[11px]">Cakupan Wilayah / Geospasial</span>
                <span className="font-semibold text-slate-800">{dataset.location || 'Provinsi Jawa Timur'}</span>
              </div>
              <div className="border-b border-slate-100 pb-2">
                <span className="text-slate-400 block text-[11px]">Frekuensi Pembaruan</span>
                <span className="font-semibold text-slate-800">{dataset.frekuensi_update || 'Tahunan'}</span>
              </div>
              <div className="border-b border-slate-100 pb-2">
                <span className="text-slate-400 block text-[11px]">Format Distribusi</span>
                <span className="font-semibold text-slate-800">CSV, PDF, JSON API (REST)</span>
              </div>
              <div className="border-b border-slate-100 pb-2">
                <span className="text-slate-400 block text-[11px]">Lisensi Akses</span>
                <span className="font-semibold text-emerald-700">Terbuka untuk Publik (Creative Commons Attribution 4.0)</span>
              </div>
              <div className="border-b border-slate-100 pb-2">
                <span className="text-slate-400 block text-[11px]">Pemeriksa / Verifikator</span>
                <span className="font-semibold text-slate-800">Tim Verifikator SDI BRIDA Jatim</span>
              </div>
            </div>

            <div className="bg-slate-50 rounded-lg p-4 text-xs text-slate-600 space-y-1">
              <span className="font-bold text-slate-800 block">Deskripsi Metodologi:</span>
              <p className="leading-relaxed">
                Data dikumpulkan melalui mekanisme pelaporan berjenjang dari instansi terkait, penelitian lapangan, dan
                verifikasi administratif berstandar SDI. Tidak memuat data rahasia pribadi maupun keamanan negara.
              </p>
            </div>
          </div>
        )}

        {/* Tab 3: PDF Document Reader Simulation */}
        {activeTab === 'pdf' && dataset.pdf_path && (
          <div className="bg-white rounded-xl border border-slate-200 shadow-xs p-6 space-y-4">
            <div className="flex items-center justify-between pb-3 border-b border-slate-100">
              <div className="flex items-center gap-2">
                <FileText className="w-5 h-5 text-rose-600" />
                <div>
                  <h3 className="text-sm font-bold text-slate-900">{dataset.pdf_path}</h3>
                  <p className="text-[11px] text-slate-500">Salinan Dokumen Pengesahan Resmi BRIDA</p>
                </div>
              </div>
              <button
                onClick={() => handleDownload('pdf')}
                className="px-3 py-1.5 bg-[#004b87] hover:bg-[#003865] text-white rounded-lg text-xs font-semibold flex items-center gap-1.5"
              >
                <Download className="w-3.5 h-3.5" />
                Unduh PDF
              </button>
            </div>

            {/* Embedded PDF Simulation Viewer */}
            <div className="bg-slate-100 rounded-lg border border-slate-200 p-8 min-h-[400px] flex flex-col items-center justify-center text-center">
              <FileText className="w-16 h-16 text-rose-500 mb-3" />
              <h4 className="text-base font-bold text-slate-800">
                {dataset.title}
              </h4>
              <p className="text-xs text-slate-500 max-w-md mt-1">
                Dokumen telah ditandatangani secara elektronik sesuai sertifikasi BSrE BSSN dan Peraturan Gubernur Jawa Timur.
              </p>
              <div className="mt-4 flex gap-3">
                <button
                  onClick={() => openPreview(dataset, 'pdf')}
                  className="px-4 py-2 bg-white text-slate-800 border border-slate-300 rounded-lg text-xs font-semibold hover:bg-slate-50 transition-colors"
                >
                  Buka Viewer Pratinjau
                </button>
                <button
                  onClick={() => handleDownload('pdf')}
                  className="px-4 py-2 bg-[#004b87] text-white rounded-lg text-xs font-semibold hover:bg-[#003865] transition-colors"
                >
                  Unduh Salinan Dokumen
                </button>
              </div>
            </div>
          </div>
        )}

        {/* Tab 4: Discussion & Feedback */}
        {activeTab === 'discussion' && (
          <div className="bg-white rounded-xl border border-slate-200 shadow-xs p-6 space-y-6">
            <div className="border-b border-slate-100 pb-3">
              <h3 className="text-sm font-bold text-slate-900 flex items-center gap-2">
                <MessageSquare className="w-4 h-4 text-[#004b87]" />
                Forum Masukan & Diskusi Data
              </h3>
              <p className="text-xs text-slate-500 mt-0.5">
                Ruang komunikasi terbuka antara pengguna data, tim verifikator, pimpinan, dan produsen data.
              </p>
            </div>

            {/* Input Form */}
            <form onSubmit={handleSendFeedback} className="space-y-3">
              <div className="flex items-center gap-2 text-xs text-slate-600">
                <User className="w-3.5 h-3.5 text-slate-400" />
                <span>
                  Mengirim sebagai:{' '}
                  <strong className="text-slate-900">
                    {currentUser?.name || 'Tamu Publik (Pengguna Terbuka)'}
                  </strong>
                </span>
              </div>
              <div className="relative">
                <textarea
                  value={feedbackInput}
                  onChange={(e) => setFeedbackInput(e.target.value)}
                  placeholder="Tuliskan pertanyaan, saran perbaikan metadata, atau kebutuhan data lanjutan..."
                  rows={3}
                  className="w-full p-3 text-xs bg-slate-50 border border-slate-200 rounded-lg focus:outline-hidden focus:ring-2 focus:ring-[#004b87] focus:bg-white transition-all"
                />
              </div>
              <div className="flex justify-end">
                <button
                  type="submit"
                  disabled={!feedbackInput.trim()}
                  className="px-4 py-2 bg-[#004b87] hover:bg-[#003865] disabled:bg-slate-300 text-white rounded-lg text-xs font-semibold flex items-center gap-1.5 transition-colors"
                >
                  <Send className="w-3.5 h-3.5" />
                  Kirim Umpan Balik
                </button>
              </div>
            </form>

            {/* Discussion Feed */}
            <div className="space-y-4 pt-4 border-t border-slate-100">
              <h4 className="text-xs font-bold text-slate-800 uppercase tracking-wider">
                Riwayat Diskusi & Tanggapan ({relatedFeedbacks.length})
              </h4>

              {relatedFeedbacks.length === 0 ? (
                <div className="p-6 text-center text-xs text-slate-400 bg-slate-50 rounded-lg italic">
                  Belum ada umpan balik untuk dataset ini. Jadilah yang pertama memberikan masukan!
                </div>
              ) : (
                relatedFeedbacks.map((item) => (
                  <div key={item.id} className="p-4 rounded-lg bg-slate-50 border border-slate-200 space-y-2">
                    <div className="flex items-center justify-between text-xs">
                      <div className="flex items-center gap-2">
                        <span className="font-bold text-slate-900">{item.user_name}</span>
                        <span className="text-[10px] font-medium px-2 py-0.5 rounded bg-sky-100 text-[#004b87]">
                          {item.user_role.toUpperCase()}
                        </span>
                      </div>
                      <span className="text-[11px] text-slate-400 flex items-center gap-1">
                        <Clock className="w-3 h-3" />
                        {item.created_at}
                      </span>
                    </div>

                    <p className="text-xs text-slate-700 leading-relaxed pl-1">{item.message}</p>

                    {item.reply && (
                      <div className="mt-3 ml-4 p-3 rounded-md bg-white border border-sky-200 text-xs space-y-1">
                        <div className="flex items-center justify-between">
                          <span className="font-semibold text-[#004b87]">
                            Tanggapan Produsen ({item.reply_by || 'Admin'})
                          </span>
                          <span className="text-[10px] text-slate-400">{item.reply_at}</span>
                        </div>
                        <p className="text-slate-600">{item.reply}</p>
                      </div>
                    )}
                  </div>
                ))
              )}
            </div>
          </div>
        )}
      </div>
    </div>
  );
};
