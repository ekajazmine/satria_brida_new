import React, { useState } from 'react';
import { useApp } from '../../context/AppContext';
import { SicakabReport } from '../../types';
import { X, CheckCircle2, AlertCircle } from 'lucide-react';

interface SicakabEvaluasiModalProps {
  report: SicakabReport | null;
  onClose: () => void;
}

export const SicakabEvaluasiModal: React.FC<SicakabEvaluasiModalProps> = ({ report, onClose }) => {
  const { evaluateSicakabReport } = useApp();

  const [hasil, setHasil] = useState(report?.evaluasi_hasil || '');
  const [rekomendasi, setRekomendasi] = useState(report?.evaluasi_rekomendasi || '');
  const [status, setStatus] = useState<'diverifikasi' | 'perlu_perbaikan'>(
    report?.status === 'perlu_perbaikan' ? 'perlu_perbaikan' : 'diverifikasi'
  );

  if (!report) return null;

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    evaluateSicakabReport(report.id, hasil, rekomendasi, status);
    onClose();
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-900/60 backdrop-blur-xs">
      <div className="bg-white rounded-2xl max-w-lg w-full border border-slate-200 shadow-2xl overflow-hidden animate-in fade-in zoom-in-95 duration-150">
        <div className={`h-1.5 w-full ${status === 'diverifikasi' ? 'bg-emerald-600' : 'bg-rose-600'}`} />
        <div className="p-6">
          <div className="flex items-center justify-between pb-3 border-b border-slate-100">
            <h3 className="text-base font-bold text-slate-900">
              Evaluasi Laporan Kinerja SICAKAB
            </h3>
            <button onClick={onClose} className="p-1 text-slate-400 hover:text-slate-700">
              <X className="w-5 h-5" />
            </button>
          </div>

          <form onSubmit={handleSubmit} className="mt-4 space-y-3.5 text-xs">
            <div className="p-3 bg-slate-50 rounded-lg space-y-1 border border-slate-200">
              <span className="text-[10px] text-slate-400 uppercase font-bold block">{report.bagian}</span>
              <h4 className="font-bold text-slate-900">{report.indikator_kinerja}</h4>
              <p className="text-slate-500 text-[11px]">
                Target: {report.target} {report.satuan_target} · Realisasi Total: {report.tw1 + report.tw2 + report.tw3 + report.tw4}
              </p>
            </div>

            <div>
              <label className="block font-semibold text-slate-700 mb-1">Keputusan Status Verifikasi</label>
              <div className="grid grid-cols-2 gap-2">
                <button
                  type="button"
                  onClick={() => setStatus('diverifikasi')}
                  className={`p-2.5 rounded-lg border font-semibold flex items-center justify-center gap-1.5 ${
                    status === 'diverifikasi'
                      ? 'border-emerald-600 bg-emerald-50 text-emerald-800'
                      : 'border-slate-200 text-slate-600 hover:bg-slate-50'
                  }`}
                >
                  <CheckCircle2 className="w-4 h-4 text-emerald-600" />
                  Diverifikasi (Sesuai)
                </button>

                <button
                  type="button"
                  onClick={() => setStatus('perlu_perbaikan')}
                  className={`p-2.5 rounded-lg border font-semibold flex items-center justify-center gap-1.5 ${
                    status === 'perlu_perbaikan'
                      ? 'border-rose-600 bg-rose-50 text-rose-800'
                      : 'border-slate-200 text-slate-600 hover:bg-slate-50'
                  }`}
                >
                  <AlertCircle className="w-4 h-4 text-rose-600" />
                  Perlu Perbaikan
                </button>
              </div>
            </div>

            <div>
              <label className="block font-semibold text-slate-700 mb-1">
                Hasil Pemeriksaan / Evaluasi <span className="text-red-500">*</span>
              </label>
              <textarea
                value={hasil}
                onChange={(e) => setHasil(e.target.value)}
                placeholder="Catatan hasil verifikasi angka capaian dan dokumen pendukung..."
                rows={3}
                required
                className="w-full p-2.5 bg-slate-50 border border-slate-200 rounded-lg focus:outline-hidden focus:ring-2 focus:ring-[#004b87]"
              />
            </div>

            <div>
              <label className="block font-semibold text-slate-700 mb-1">
                Rekomendasi Tindak Lanjut untuk Produsen
              </label>
              <textarea
                value={rekomendasi}
                onChange={(e) => setRekomendasi(e.target.value)}
                placeholder="Langkah perbaikan yang perlu diambil oleh unit pengampu..."
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
                className="px-4 py-2 bg-[#004b87] hover:bg-[#003865] text-white rounded-lg font-bold shadow-xs"
              >
                Simpan Hasil Evaluasi
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
};
