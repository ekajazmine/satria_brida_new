import React, { useState } from 'react';
import { useApp } from '../../context/AppContext';
import { Dataset } from '../../types';
import { X, Upload, FileText, CheckCircle2 } from 'lucide-react';

interface DatasetFormModalProps {
  isOpen: boolean;
  onClose: () => void;
  datasetToEdit?: Dataset | null;
}

export const DatasetFormModal: React.FC<DatasetFormModalProps> = ({
  isOpen,
  onClose,
  datasetToEdit,
}) => {
  const { addDataset, updateDataset, currentUser } = useApp();

  const [title, setTitle] = useState(datasetToEdit?.title || '');
  const [category, setCategory] = useState(datasetToEdit?.category || 'Litbangjirap');
  const [description, setDescription] = useState(datasetToEdit?.description || '');
  const [year, setYear] = useState<number>(datasetToEdit?.year || 2026);
  const [agency, setAgency] = useState(datasetToEdit?.agency || 'BRIDA Jawa Timur');
  const [researcher, setResearcher] = useState(datasetToEdit?.researcher || '');
  const [location, setLocation] = useState(datasetToEdit?.location || 'Jawa Timur');
  const [frekuensiUpdate, setFrekuensiUpdate] = useState(datasetToEdit?.frekuensi_update || 'Tahunan');
  const [fileName, setFileName] = useState(datasetToEdit?.file_path || 'dataset_baru_2026.csv');

  if (!isOpen) return null;

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!title.trim()) return;

    if (datasetToEdit) {
      updateDataset(datasetToEdit.id, {
        title,
        category,
        description,
        year,
        agency,
        researcher,
        location,
        frekuensi_update: frekuensiUpdate,
      });
    } else {
      addDataset({
        title,
        category,
        description,
        year,
        agency,
        researcher,
        location,
        file_path: fileName,
        metadata_path: `${fileName.replace('.csv', '')}_METADATA.doc`,
        pdf_path: `${fileName.replace('.csv', '')}_PENGESAHAN.pdf`,
        user_id: currentUser?.id || 1,
        target_divisi: currentUser?.divisi || 'litbang',
        status: 'waiting_for_verification', // New datasets always go to verifikator!
        jenis_data: 'Dataset Statistik',
        tahun_data: year,
        instansi: agency,
        frekuensi_update: frekuensiUpdate,
        tanggal_update: new Date().toISOString().substring(0, 10),
      });
    }
    onClose();
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-900/60 backdrop-blur-xs overflow-y-auto">
      <div className="bg-white rounded-2xl max-w-2xl w-full border border-slate-200 shadow-2xl overflow-hidden my-8 animate-in fade-in zoom-in-95 duration-150">
        <div className="h-1.5 w-full bg-linear-to-r from-red-600 via-red-500 to-white" />

        <div className="p-6">
          <div className="flex items-center justify-between pb-4 border-b border-slate-100">
            <div>
              <h3 className="text-base font-bold text-slate-900">
                {datasetToEdit ? 'Edit Dataset Riset' : 'Pengajuan Dataset Baru (Standar SDI)'}
              </h3>
              <p className="text-xs text-slate-500">
                Lengkapi metadata wajib sesuai Perpres No. 39/2019 tentang Satu Data Indonesia.
              </p>
            </div>
            <button
              onClick={onClose}
              className="p-1 rounded-lg text-slate-400 hover:text-slate-700 hover:bg-slate-100"
            >
              <X className="w-5 h-5" />
            </button>
          </div>

          <form onSubmit={handleSubmit} className="mt-4 space-y-4">
            <div>
              <label className="block text-xs font-semibold text-slate-700 mb-1">
                Judul Lengkap Dataset <span className="text-red-500">*</span>
              </label>
              <input
                type="text"
                value={title}
                onChange={(e) => setTitle(e.target.value)}
                placeholder="Contoh: Jumlah Peneliti Berdasarkan Jenjang Jabatan Tahun 2026"
                required
                className="w-full px-3 py-2 text-xs bg-slate-50 border border-slate-200 rounded-lg focus:outline-hidden focus:ring-2 focus:ring-[#004b87] focus:bg-white"
              />
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
              <div>
                <label className="block text-xs font-semibold text-slate-700 mb-1">
                  Bidang Organisasi / Kategori <span className="text-red-500">*</span>
                </label>
                <select
                  value={category}
                  onChange={(e) => setCategory(e.target.value)}
                  className="w-full px-3 py-2 text-xs bg-slate-50 border border-slate-200 rounded-lg focus:outline-hidden focus:ring-2 focus:ring-[#004b87]"
                >
                  <option value="Litbangjirap">Litbangjirap (Riset & Kebijakan)</option>
                  <option value="Invensi Inovasi">Invensi Inovasi (IGA, HKI, Diseminasi)</option>
                  <option value="Sekretariat">Sekretariat (SDM, Anggaran, PKS)</option>
                </select>
              </div>

              <div>
                <label className="block text-xs font-semibold text-slate-700 mb-1">
                  Tahun Anggaran / Data <span className="text-red-500">*</span>
                </label>
                <input
                  type="number"
                  value={year}
                  onChange={(e) => setYear(parseInt(e.target.value) || 2026)}
                  min={2020}
                  max={2030}
                  required
                  className="w-full px-3 py-2 text-xs bg-slate-50 border border-slate-200 rounded-lg focus:outline-hidden focus:ring-2 focus:ring-[#004b87]"
                />
              </div>
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
              <div>
                <label className="block text-xs font-semibold text-slate-700 mb-1">
                  Produsen Data / Instansi <span className="text-red-500">*</span>
                </label>
                <input
                  type="text"
                  value={agency}
                  onChange={(e) => setAgency(e.target.value)}
                  placeholder="BRIDA Jawa Timur"
                  required
                  className="w-full px-3 py-2 text-xs bg-slate-50 border border-slate-200 rounded-lg focus:outline-hidden focus:ring-2 focus:ring-[#004b87]"
                />
              </div>

              <div>
                <label className="block text-xs font-semibold text-slate-700 mb-1">
                  Peneliti / Penanggung Jawab
                </label>
                <input
                  type="text"
                  value={researcher}
                  onChange={(e) => setResearcher(e.target.value)}
                  placeholder="Nama Peneliti Utama / Sub Bagian"
                  className="w-full px-3 py-2 text-xs bg-slate-50 border border-slate-200 rounded-lg focus:outline-hidden focus:ring-2 focus:ring-[#004b87]"
                />
              </div>
            </div>

            <div>
              <label className="block text-xs font-semibold text-slate-700 mb-1">
                Deskripsi Naratif Dataset <span className="text-red-500">*</span>
              </label>
              <textarea
                value={description}
                onChange={(e) => setDescription(e.target.value)}
                placeholder="Jelaskan cakupan data, metodologi, dan tujuan penyusunan dataset..."
                rows={3}
                required
                className="w-full p-3 text-xs bg-slate-50 border border-slate-200 rounded-lg focus:outline-hidden focus:ring-2 focus:ring-[#004b87]"
              />
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
              <div>
                <label className="block text-xs font-semibold text-slate-700 mb-1">
                  Frekuensi Pembaruan
                </label>
                <select
                  value={frekuensiUpdate}
                  onChange={(e) => setFrekuensiUpdate(e.target.value)}
                  className="w-full px-3 py-2 text-xs bg-slate-50 border border-slate-200 rounded-lg focus:outline-hidden focus:ring-2 focus:ring-[#004b87]"
                >
                  <option value="Tahunan">Tahunan</option>
                  <option value="Semesteran">Semesteran</option>
                  <option value="Triwulanan">Triwulanan</option>
                  <option value="Bulanan">Bulanan</option>
                </select>
              </div>

              <div>
                <label className="block text-xs font-semibold text-slate-700 mb-1">
                  Nama Berkas CSV / Tabular
                </label>
                <input
                  type="text"
                  value={fileName}
                  onChange={(e) => setFileName(e.target.value)}
                  className="w-full px-3 py-2 text-xs bg-slate-50 border border-slate-200 rounded-lg focus:outline-hidden focus:ring-2 focus:ring-[#004b87] font-mono"
                />
              </div>
            </div>

            <div className="pt-3 border-t border-slate-100 flex items-center justify-end gap-2">
              <button
                type="button"
                onClick={onClose}
                className="px-4 py-2 border border-slate-200 text-slate-600 rounded-lg text-xs font-medium hover:bg-slate-50"
              >
                Batal
              </button>
              <button
                type="submit"
                className="px-5 py-2 bg-[#004b87] hover:bg-[#003865] text-white rounded-lg text-xs font-bold transition-colors shadow-xs"
              >
                {datasetToEdit ? 'Simpan Perubahan' : 'Ajukan ke Verifikator'}
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
};
