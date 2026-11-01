import React from 'react';
import { useApp } from '../../context/AppContext';
import { X, BookOpen, Download, FileText, CheckCircle2 } from 'lucide-react';

interface GuideBookModalProps {
  isOpen: boolean;
  onClose: () => void;
}

export const GuideBookModal: React.FC<GuideBookModalProps> = ({ isOpen, onClose }) => {
  const { notify } = useApp();

  if (!isOpen) return null;

  const handleDownload = (docName: string) => {
    notify(`Mengunduh dokumen panduan: ${docName}...`);
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-900/60 backdrop-blur-xs">
      <div className="bg-white rounded-2xl max-w-2xl w-full border border-slate-200 shadow-2xl overflow-hidden animate-in fade-in zoom-in-95 duration-150">
        <div className="h-1.5 w-full bg-linear-to-r from-red-600 via-sky-600 to-[#004b87]" />

        <div className="p-6 space-y-5">
          <div className="flex items-center justify-between pb-3 border-b border-slate-100">
            <div className="flex items-center gap-3">
              <div className="w-10 h-10 rounded-lg bg-sky-50 text-[#004b87] flex items-center justify-center">
                <BookOpen className="w-5 h-5" />
              </div>
              <div>
                <h3 className="text-base font-bold text-slate-900">
                  Buku Panduan & Dokumen SOP SATRIA BRIDA
                </h3>
                <p className="text-xs text-slate-500">
                  Pedoman tata kelola data, metadata standar SDI, dan petunjuk teknis SICAKAB.
                </p>
              </div>
            </div>
            <button onClick={onClose} className="p-1 text-slate-400 hover:text-slate-700">
              <X className="w-5 h-5" />
            </button>
          </div>

          <div className="space-y-3 text-xs">
            {[
              {
                title: 'SOP Pengelolaan & Verifikasi Dataset Riset (Standar SDI)',
                desc: 'Pedoman alur kerja pengajuan dataset dari produsen data, verifikasi standar data, hingga persetujuan verifikator.',
                file: 'SOP_PENGELOLAAN_DATASET_SDI_BRIDA_2026.pdf',
                size: '2.4 MB',
              },
              {
                title: 'Template Baku Metadata Satu Data Indonesia (.doc)',
                desc: 'Formulir isian standar definisi data, cakupan, dimensi, dan metodologi sesuai Perpres No. 39/2019.',
                file: 'TEMPLATE_METADATA_SDI_JATIM.doc',
                size: '850 KB',
              },
              {
                title: 'Petunjuk Teknis Pengisian Modul SICAKAB',
                desc: 'Panduan tata cara input target tahunan, realisasi triwulan, narasi capaian, serta bukti dukung kinerja.',
                file: 'JUKNIS_SICAKAB_BRIDA_JATIM_2026.pdf',
                size: '3.1 MB',
              },
              {
                title: 'Pedoman Pengukuran Indeks Inovasi Daerah (IID)',
                desc: 'Indikator kematangan inovasi daerah dan persyaratan evidence video/dokumen Innovative Government Award.',
                file: 'PEDOMAN_IID_IGA_2025_2026.pdf',
                size: '4.8 MB',
              },
            ].map((item, idx) => (
              <div
                key={idx}
                className="p-4 rounded-xl border border-slate-200 bg-slate-50/60 hover:bg-slate-50 transition-colors flex items-center justify-between gap-4"
              >
                <div className="space-y-1">
                  <div className="flex items-center gap-2">
                    <FileText className="w-4 h-4 text-[#004b87]" />
                    <h4 className="font-bold text-slate-900">{item.title}</h4>
                  </div>
                  <p className="text-slate-600 text-[11px] leading-relaxed">{item.desc}</p>
                  <span className="text-[10px] text-slate-400 font-mono">
                    {item.file} ({item.size})
                  </span>
                </div>

                <button
                  onClick={() => handleDownload(item.title)}
                  className="px-3.5 py-1.5 bg-white hover:bg-slate-100 text-[#004b87] border border-slate-200 rounded-lg font-bold shadow-xs flex items-center gap-1.5 shrink-0 transition-colors"
                >
                  <Download className="w-3.5 h-3.5" />
                  Unduh
                </button>
              </div>
            ))}
          </div>

          <div className="pt-3 border-t border-slate-100 flex justify-end">
            <button
              onClick={onClose}
              className="px-4 py-2 bg-slate-100 hover:bg-slate-200 text-slate-700 rounded-lg text-xs font-semibold"
            >
              Tutup
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};
