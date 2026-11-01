import React, { useState } from 'react';
import { useApp } from '../../context/AppContext';
import { Dataset } from '../../types';
import {
  CheckCircle2,
  AlertCircle,
  FileSpreadsheet,
  Clock,
  Search,
  Eye,
  Check,
  X,
  MessageSquare,
} from 'lucide-react';

export const VerifikatorWorkbench: React.FC = () => {
  const { datasets, verifyDataset, openPreview } = useApp();
  const [filterMode, setFilterMode] = useState<'pending' | 'all'>('pending');
  const [search, setSearch] = useState('');
  
  // Revision modal state
  const [revisingDataset, setRevisingDataset] = useState<Dataset | null>(null);
  const [revisionNotes, setRevisionNotes] = useState('');

  const displayedDatasets = datasets.filter((d) => {
    if (filterMode === 'pending' && d.status !== 'waiting_for_verification') {
      return false;
    }
    if (search.trim()) {
      const q = search.toLowerCase();
      return (
        d.title.toLowerCase().includes(q) ||
        d.agency.toLowerCase().includes(q) ||
        d.category.toLowerCase().includes(q)
      );
    }
    return true;
  });

  const handleApprove = (dataset: Dataset) => {
    verifyDataset(dataset.id, 'approved', 'Dataset telah diverifikasi dan disetujui sesuai standar Satu Data Indonesia.');
  };

  const handleOpenReviseModal = (dataset: Dataset) => {
    setRevisingDataset(dataset);
    setRevisionNotes('');
  };

  const handleConfirmRevision = (e: React.FormEvent) => {
    e.preventDefault();
    if (!revisingDataset || !revisionNotes.trim()) return;
    verifyDataset(revisingDataset.id, 'waiting_for_revision', revisionNotes.trim());
    setRevisingDataset(null);
  };

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h2 className="text-xl font-bold text-slate-900 tracking-tight">
            Workbench Verifikator Satu Data
          </h2>
          <p className="text-xs text-slate-500 mt-0.5">
            Periksa kesesuaian standar data, kelengkapan metadata, dan validasi lembar kerja sebelum dipublikasikan.
          </p>
        </div>

        {/* Tab Filters */}
        <div className="flex items-center gap-1.5 p-1 bg-slate-100 rounded-lg self-start sm:self-auto text-xs font-semibold">
          <button
            onClick={() => setFilterMode('pending')}
            className={`px-3 py-1.5 rounded-md transition-all flex items-center gap-1.5 ${
              filterMode === 'pending'
                ? 'bg-white text-[#004b87] shadow-xs'
                : 'text-slate-600 hover:text-slate-900'
            }`}
          >
            <Clock className="w-3.5 h-3.5 text-amber-500" />
            Menunggu Verifikasi (
            {datasets.filter((d) => d.status === 'waiting_for_verification').length})
          </button>
          <button
            onClick={() => setFilterMode('all')}
            className={`px-3 py-1.5 rounded-md transition-all ${
              filterMode === 'all'
                ? 'bg-white text-[#004b87] shadow-xs'
                : 'text-slate-600 hover:text-slate-900'
            }`}
          >
            Semua Dataset ({datasets.length})
          </button>
        </div>
      </div>

      {/* Search Input */}
      <div className="relative max-w-md">
        <Search className="w-4 h-4 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2" />
        <input
          type="text"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          placeholder="Cari dataset yang perlu diverifikasi..."
          className="w-full pl-9 pr-3 py-2 text-xs bg-white border border-slate-200 rounded-lg focus:outline-hidden focus:ring-2 focus:ring-[#004b87]"
        />
      </div>

      {/* Dataset Verification Cards */}
      <div className="space-y-4">
        {displayedDatasets.length === 0 ? (
          <div className="bg-white rounded-xl p-10 text-center border border-slate-200">
            <CheckCircle2 className="w-10 h-10 text-emerald-500 mx-auto mb-2" />
            <h3 className="text-sm font-bold text-slate-800">
              {filterMode === 'pending'
                ? 'Semua dataset telah selesai diverifikasi!'
                : 'Tidak ada dataset yang cocok dengan pencarian.'}
            </h3>
            <p className="text-xs text-slate-500 mt-1">
              Antrean verifikasi saat ini bersih. Anda dapat meninjau dataset lainnya di tab Semua Dataset.
            </p>
          </div>
        ) : (
          displayedDatasets.map((dataset) => (
            <div
              key={dataset.id}
              className="bg-white rounded-xl p-5 border border-slate-200 shadow-xs space-y-4"
            >
              <div className="flex flex-col sm:flex-row sm:items-start justify-between gap-3">
                <div className="space-y-1 flex-1">
                  <div className="flex flex-wrap items-center gap-2 text-xs text-slate-500">
                    <span className="font-semibold text-[#004b87]">{dataset.category}</span>
                    <span>·</span>
                    <span>{dataset.agency}</span>
                    <span>·</span>
                    <span>Tahun {dataset.year}</span>
                    <span>·</span>
                    <span className="font-mono text-slate-400">ID #{dataset.id}</span>
                  </div>

                  <h3 className="text-base font-bold text-slate-900">{dataset.title}</h3>
                  <p className="text-xs text-slate-600 line-clamp-2 leading-relaxed">
                    {dataset.description}
                  </p>
                </div>

                <div className="shrink-0">
                  {dataset.status === 'waiting_for_verification' && (
                    <span className="inline-flex items-center gap-1 px-3 py-1 rounded-full text-xs font-semibold bg-amber-50 text-amber-700 border border-amber-200">
                      <Clock className="w-3.5 h-3.5" />
                      Perlu Tindakan
                    </span>
                  )}
                  {dataset.status === 'approved' && (
                    <span className="inline-flex items-center gap-1 px-3 py-1 rounded-full text-xs font-semibold bg-emerald-50 text-emerald-700 border border-emerald-200">
                      <CheckCircle2 className="w-3.5 h-3.5" />
                      Disetujui
                    </span>
                  )}
                  {dataset.status === 'published' && (
                    <span className="inline-flex items-center gap-1 px-3 py-1 rounded-full text-xs font-semibold bg-blue-50 text-blue-700 border border-blue-200">
                      <CheckCircle2 className="w-3.5 h-3.5" />
                      Published
                    </span>
                  )}
                  {dataset.status === 'waiting_for_revision' && (
                    <span className="inline-flex items-center gap-1 px-3 py-1 rounded-full text-xs font-semibold bg-rose-50 text-rose-700 border border-rose-200">
                      <AlertCircle className="w-3.5 h-3.5" />
                      Menunggu Perbaikan Produsen
                    </span>
                  )}
                </div>
              </div>

              {/* Action Bar */}
              <div className="pt-3 border-t border-slate-100 flex flex-wrap items-center justify-between gap-3 text-xs">
                <button
                  onClick={() => openPreview(dataset, 'csv')}
                  className="px-3 py-1.5 rounded-lg border border-slate-200 hover:border-[#004b87] text-slate-700 hover:text-[#004b87] font-semibold transition-colors flex items-center gap-1.5"
                >
                  <FileSpreadsheet className="w-3.5 h-3.5 text-emerald-600" />
                  Periksa Pratinjau Tabel ({dataset.preview_data?.rows.length || 0} baris)
                </button>

                <div className="flex items-center gap-2">
                  <button
                    onClick={() => handleOpenReviseModal(dataset)}
                    className="px-3 py-1.5 rounded-lg border border-rose-200 bg-rose-50 hover:bg-rose-100 text-rose-700 font-semibold transition-colors flex items-center gap-1"
                  >
                    <MessageSquare className="w-3.5 h-3.5" />
                    Minta Revisi
                  </button>

                  <button
                    onClick={() => handleApprove(dataset)}
                    className="px-4 py-1.5 rounded-lg bg-emerald-600 hover:bg-emerald-700 text-white font-semibold transition-colors flex items-center gap-1 shadow-xs"
                  >
                    <Check className="w-3.5 h-3.5" />
                    Setujui & Publikasikan
                  </button>
                </div>
              </div>
            </div>
          ))
        )}
      </div>

      {/* Revision Modal */}
      {revisingDataset && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-900/60 backdrop-blur-xs">
          <div className="bg-white rounded-2xl max-w-lg w-full border border-slate-200 shadow-2xl overflow-hidden animate-in fade-in zoom-in-95 duration-150">
            <div className="h-1.5 w-full bg-rose-600" />
            <div className="p-6">
              <div className="flex items-center justify-between pb-3 border-b border-slate-100">
                <h3 className="text-base font-bold text-slate-900 flex items-center gap-2">
                  <AlertCircle className="w-4 h-4 text-rose-600" />
                  Kembalikan untuk Revisi
                </h3>
                <button
                  onClick={() => setRevisingDataset(null)}
                  className="p-1 rounded-lg text-slate-400 hover:text-slate-700"
                >
                  <X className="w-5 h-5" />
                </button>
              </div>

              <form onSubmit={handleConfirmRevision} className="mt-4 space-y-4">
                <div className="text-xs text-slate-600">
                  Dataset: <strong className="text-slate-900">{revisingDataset.title}</strong>
                </div>

                <div>
                  <label className="block text-xs font-semibold text-slate-700 mb-1">
                    Catatan Perbaikan dari Verifikator <span className="text-red-500">*</span>
                  </label>
                  <textarea
                    value={revisionNotes}
                    onChange={(e) => setRevisionNotes(e.target.value)}
                    placeholder="Jelaskan kolom atau metadata yang belum sesuai (contoh: format tanggal kolom 3 tidak standar, deskripsi belum mencantumkan metodologi)..."
                    rows={4}
                    required
                    className="w-full p-3 text-xs bg-slate-50 border border-slate-200 rounded-lg focus:outline-hidden focus:ring-2 focus:ring-rose-500"
                  />
                </div>

                <div className="flex justify-end gap-2 pt-2">
                  <button
                    type="button"
                    onClick={() => setRevisingDataset(null)}
                    className="px-4 py-2 border border-slate-200 text-slate-600 rounded-lg text-xs font-semibold"
                  >
                    Batal
                  </button>
                  <button
                    type="submit"
                    className="px-4 py-2 bg-rose-600 hover:bg-rose-700 text-white rounded-lg text-xs font-bold shadow-xs"
                  >
                    Kirim Catatan Revisi
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};
