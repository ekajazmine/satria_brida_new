import React, { useState } from 'react';
import { useApp } from '../../context/AppContext';
import { SicakabReport } from '../../types';
import { X, Send, AlertCircle } from 'lucide-react';

interface SicakabTindakLanjutModalProps {
  report: SicakabReport | null;
  onClose: () => void;
}

export const SicakabTindakLanjutModal: React.FC<SicakabTindakLanjutModalProps> = ({
  report,
  onClose,
}) => {
  const { submitTindakLanjut } = useApp();

  const [rencana, setRencana] = useState(report?.tindak_lanjut_rencana || '');
  const [hasil, setHasil] = useState(report?.tindak_lanjut_hasil || '');

  if (!report) return null;

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!rencana.trim()) return;
    submitTindakLanjut(report.id, rencana, hasil);
    onClose();
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-900/60 backdrop-blur-xs">
      <div className="bg-white rounded-2xl max-w-lg w-full border border-slate-200 shadow-2xl overflow-hidden animate-in fade-in zoom-in-95 duration-150">
        <div className="h-1.5 w-full bg-blue-600" />
        <div className="p-6">
          <div className="flex items-center justify-between pb-3 border-b border-slate-100">
            <h3 className="text-base font-bold text-slate-900">
              Tindak Lanjut Evaluasi Kinerja (SICAKAB)
            </h3>
            <button onClick={onClose} className="p-1 text-slate-400 hover:text-slate-700">
              <X className="w-5 h-5" />
            </button>
          </div>

          <form onSubmit={handleSubmit} className="mt-4 space-y-3.5 text-xs">
            {/* Show notes from verifikator if available */}
            {report.evaluasi_rekomendasi && (
              <div className="p-3 bg-amber-50 rounded-lg border border-amber-200 text-slate-700 space-y-1">
                <span className="font-bold text-amber-800 flex items-center gap-1.5">
                  <AlertCircle className="w-4 h-4" />
                  Rekomendasi Verifikator:
                </span>
                <p className="text-[11px] leading-relaxed">{report.evaluasi_rekomendasi}</p>
              </div>
            )}

            <div>
              <label className="block font-semibold text-slate-700 mb-1">
                Rencana Tindak Lanjut / Perbaikan <span className="text-red-500">*</span>
              </label>
              <textarea
                value={rencana}
                onChange={(e) => setRencana(e.target.value)}
                placeholder="Langkah perbaikan dokumen / data yang akan dilakukan..."
                rows={3}
                required
                className="w-full p-2.5 bg-slate-50 border border-slate-200 rounded-lg focus:outline-hidden focus:ring-2 focus:ring-[#004b87]"
              />
            </div>

            <div>
              <label className="block font-semibold text-slate-700 mb-1">
                Hasil Realisasi Tindak Lanjut
              </label>
              <textarea
                value={hasil}
                onChange={(e) => setHasil(e.target.value)}
                placeholder="Hasil perbaikan yang sudah selesai (contoh: scan pengesahan telah dilampirkan)..."
                rows={2}
                className="w-full p-2.5 bg-slate-50 border border-slate-200 rounded-lg focus:outline-hidden focus:ring-2 focus:ring-[#004b87]"
              />
            </div>

            <div className="pt-3 border-t border-slate-100 flex justify-end gap-2">
              <button
                type="button"
                onClick={onClose}
                className="px-4 py-2 border border-slate-200 text-slate-600 rounded-lg font-semibold"
              >
                Batal
              </button>
              <button
                type="submit"
                className="px-4 py-2 bg-[#004b87] hover:bg-[#003865] text-white rounded-lg font-bold shadow-xs flex items-center gap-1.5"
              >
                <Send className="w-3.5 h-3.5" />
                Kirimkan Tindak Lanjut
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
};
