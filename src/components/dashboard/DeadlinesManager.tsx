import React, { useState } from 'react';
import { useApp } from '../../context/AppContext';
import { Clock, Plus, Trash2, Calendar, AlertTriangle, CheckCircle } from 'lucide-react';

export const DeadlinesManager: React.FC = () => {
  const { deadlines, addDeadline, deleteDeadline } = useApp();

  const [title, setTitle] = useState('');
  const [deadlineDate, setDeadlineDate] = useState('2026-10-31');
  const [targetDivisi, setTargetDivisi] = useState('Semua Divisi');
  const [description, setDescription] = useState('');
  const [showAdd, setShowAdd] = useState(false);

  const handleAdd = (e: React.FormEvent) => {
    e.preventDefault();
    if (!title.trim()) return;
    addDeadline({
      title,
      deadline_date: deadlineDate,
      target_divisi: targetDivisi,
      description,
    });
    setTitle('');
    setDescription('');
    setShowAdd(false);
  };

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h2 className="text-xl font-bold text-slate-900 tracking-tight flex items-center gap-2">
            <Clock className="w-5 h-5 text-[#004b87]" />
            Pengaturan Tenggat Waktu Pelaporan Data
          </h2>
          <p className="text-xs text-slate-500 mt-0.5">
            Jadwal batas akhir pengunggahan dokumen SICAKAB dan pembaruan dataset tahunan bagi produsen data.
          </p>
        </div>

        <button
          onClick={() => setShowAdd(!showAdd)}
          className="px-4 py-2 bg-[#004b87] hover:bg-[#003865] text-white rounded-lg text-xs font-semibold shadow-xs flex items-center gap-1.5 transition-colors self-start sm:self-auto"
        >
          <Plus className="w-4 h-4" />
          {showAdd ? 'Tutup Formulir' : 'Tetapkan Tenggat Baru'}
        </button>
      </div>

      {showAdd && (
        <form onSubmit={handleAdd} className="bg-white rounded-xl p-5 border border-slate-200 shadow-xs space-y-4 text-xs">
          <h3 className="font-bold text-slate-900 text-sm">Formulir Tenggat Waktu Baru</h3>
          <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
            <div className="sm:col-span-2">
              <label className="block font-semibold text-slate-700 mb-1">Nama / Kegiatan Tenggat</label>
              <input
                type="text"
                value={title}
                onChange={(e) => setTitle(e.target.value)}
                placeholder="Contoh: Pengunggahan Laporan SICAKAB Triwulan IV"
                required
                className="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg"
              />
            </div>

            <div>
              <label className="block font-semibold text-slate-700 mb-1">Batas Tanggal</label>
              <input
                type="date"
                value={deadlineDate}
                onChange={(e) => setDeadlineDate(e.target.value)}
                required
                className="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg"
              />
            </div>
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <div>
              <label className="block font-semibold text-slate-700 mb-1">Divisi Sasaran</label>
              <select
                value={targetDivisi}
                onChange={(e) => setTargetDivisi(e.target.value)}
                className="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg"
              >
                <option value="Semua Divisi">Semua Divisi</option>
                <option value="Sekretariat">Sekretariat BRIDA</option>
                <option value="Invensi Inovasi">Bidang Invensi & Inovasi</option>
                <option value="Litbangjirap">Bidang Litbangjirap</option>
              </select>
            </div>

            <div>
              <label className="block font-semibold text-slate-700 mb-1">Keterangan / Instruksi</label>
              <input
                type="text"
                value={description}
                onChange={(e) => setDescription(e.target.value)}
                placeholder="Dokumen yang wajib dilampirkan..."
                className="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg"
              />
            </div>
          </div>

          <div className="flex justify-end gap-2 pt-2">
            <button
              type="submit"
              className="px-4 py-2 bg-[#004b87] text-white rounded-lg font-bold hover:bg-[#003865]"
            >
              Simpan Tenggat Waktu
            </button>
          </div>
        </form>
      )}

      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        {deadlines.map((dl) => (
          <div
            key={dl.id}
            className="bg-white rounded-xl p-5 border border-slate-200 shadow-xs flex flex-col justify-between space-y-3"
          >
            <div className="space-y-2">
              <div className="flex items-center justify-between">
                <span className="text-[10px] font-bold uppercase tracking-wider px-2 py-0.5 rounded bg-sky-100 text-[#004b87]">
                  {dl.target_divisi}
                </span>
                <span
                  className={`text-[10px] font-bold px-2 py-0.5 rounded ${
                    dl.status === 'aktif' ? 'bg-amber-100 text-amber-800' : 'bg-slate-100 text-slate-600'
                  }`}
                >
                  {dl.status.toUpperCase()}
                </span>
              </div>

              <h3 className="text-sm font-bold text-slate-900 leading-snug">{dl.title}</h3>
              <p className="text-xs text-slate-600 line-clamp-2">{dl.description}</p>
            </div>

            <div className="pt-3 border-t border-slate-100 flex items-center justify-between text-xs">
              <div className="flex items-center gap-1.5 text-slate-500 font-medium">
                <Calendar className="w-3.5 h-3.5 text-slate-400" />
                <span className="tabular-nums">{dl.deadline_date}</span>
              </div>

              <button
                onClick={() => deleteDeadline(dl.id)}
                className="text-slate-400 hover:text-red-600 p-1 rounded"
                title="Hapus Tenggat"
              >
                <Trash2 className="w-4 h-4" />
              </button>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};
