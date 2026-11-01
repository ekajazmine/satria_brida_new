import React, { useState } from 'react';
import { useApp } from '../../context/AppContext';
import { SicakabReport } from '../../types';
import { X, FileText, CheckCircle2 } from 'lucide-react';

interface SicakabReportModalProps {
  isOpen: boolean;
  onClose: () => void;
  reportToEdit?: SicakabReport | null;
}

export const SicakabReportModal: React.FC<SicakabReportModalProps> = ({
  isOpen,
  onClose,
  reportToEdit,
}) => {
  const { addSicakabReport, updateSicakabReport, currentUser } = useApp();

  const [bagian, setBagian] = useState(reportToEdit?.bagian || 'Sekretariat');
  const [subBagian, setSubBagian] = useState(
    reportToEdit?.sub_bagian || 'Sub Bagian Penyusunan Program dan Anggaran'
  );
  const [programKegiatan, setProgramKegiatan] = useState(
    reportToEdit?.program_kegiatan || 'Perencanaan, Penganggaran, dan Evaluasi Kinerja Perangkat Daerah'
  );
  const [indikatorKinerja, setIndikatorKinerja] = useState(
    reportToEdit?.indikator_kinerja || ''
  );
  const [tahun, setTahun] = useState<number>(reportToEdit?.tahun || 2026);
  const [target, setTarget] = useState<string | number>(reportToEdit?.target || 10);
  const [satuanTarget, setSatuanTarget] = useState(reportToEdit?.satuan_target || 'dokumen');

  const [tw1, setTw1] = useState<number>(reportToEdit?.tw1 || 0);
  const [tw2, setTw2] = useState<number>(reportToEdit?.tw2 || 0);
  const [tw3, setTw3] = useState<number>(reportToEdit?.tw3 || 0);
  const [tw4, setTw4] = useState<number>(reportToEdit?.tw4 || 0);

  const [keterangan, setKeterangan] = useState(reportToEdit?.keterangan || '');
  const [faktorPendukung, setFaktorPendukung] = useState(reportToEdit?.faktor_pendukung || '');
  const [peluangHambatan, setPeluangHambatan] = useState(reportToEdit?.peluang_hambatan || '');
  const [linkDokumen, setLinkDokumen] = useState(reportToEdit?.link_dokumen || '');

  if (!isOpen) return null;

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (!indikatorKinerja.trim()) return;

    const totalCapaian = Number(target) > 0 ? ((tw1 + tw2 + tw3 + tw4) / Number(target)) * 100 : 0;

    if (reportToEdit) {
      updateSicakabReport(reportToEdit.id, {
        bagian,
        sub_bagian: subBagian,
        program_kegiatan: programKegiatan,
        indikator_kinerja: indikatorKinerja,
        tahun,
        target,
        satuan_target: satuanTarget,
        tw1,
        tw2,
        tw3,
        tw4,
        capaian: parseFloat(totalCapaian.toFixed(1)),
        keterangan,
        faktor_pendukung: faktorPendukung,
        peluang_hambatan: peluangHambatan,
        link_dokumen: linkDokumen,
      });
    } else {
      addSicakabReport({
        user_id: currentUser?.id || 1,
        bagian,
        sub_bagian: subBagian,
        program_kegiatan: programKegiatan,
        indikator_kinerja: indikatorKinerja,
        tahun,
        target,
        satuan_target: satuanTarget,
        tw1,
        tw2,
        tw3,
        tw4,
        capaian: parseFloat(totalCapaian.toFixed(1)),
        keterangan,
        faktor_pendukung: faktorPendukung,
        peluang_hambatan: peluangHambatan,
        link_dokumen: linkDokumen,
        status: 'menunggu_evaluasi',
      });
    }
    onClose();
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-900/60 backdrop-blur-xs overflow-y-auto">
      <div className="bg-white rounded-2xl max-w-2xl w-full border border-slate-200 shadow-2xl overflow-hidden my-8 animate-in fade-in zoom-in-95 duration-150">
        <div className="h-1.5 w-full bg-emerald-600" />
        <div className="p-6">
          <div className="flex items-center justify-between pb-3 border-b border-slate-100">
            <div>
              <h3 className="text-base font-bold text-slate-900">
                {reportToEdit ? 'Ubah Laporan Kinerja SICAKAB' : 'Tambah Laporan Capaian Kinerja (SICAKAB)'}
              </h3>
              <p className="text-xs text-slate-500">
                Sistem Informasi Capaian Kinerja Kabupaten/Badan Riset & Inovasi Daerah
              </p>
            </div>
            <button onClick={onClose} className="p-1 text-slate-400 hover:text-slate-700">
              <X className="w-5 h-5" />
            </button>
          </div>

          <form onSubmit={handleSubmit} className="mt-4 space-y-4 text-xs">
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
              <div>
                <label className="block font-semibold text-slate-700 mb-1">Bagian / Bidang</label>
                <select
                  value={bagian}
                  onChange={(e) => setBagian(e.target.value)}
                  className="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg"
                >
                  <option value="Sekretariat">Sekretariat BRIDA</option>
                  <option value="Penelitian, Pengembangan, Pengkajian, Penerapan">Bidang Litbangjirap</option>
                  <option value="Tujuan, Sasaran, dan Program">Bidang Invensi & Inovasi</option>
                </select>
              </div>

              <div>
                <label className="block font-semibold text-slate-700 mb-1">Sub Bagian / Tim Kerja</label>
                <input
                  type="text"
                  value={subBagian}
                  onChange={(e) => setSubBagian(e.target.value)}
                  className="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg"
                />
              </div>
            </div>

            <div>
              <label className="block font-semibold text-slate-700 mb-1">Program / Kegiatan</label>
              <input
                type="text"
                value={programKegiatan}
                onChange={(e) => setProgramKegiatan(e.target.value)}
                className="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg"
              />
            </div>

            <div>
              <label className="block font-semibold text-slate-700 mb-1">
                Indikator Kinerja <span className="text-red-500">*</span>
              </label>
              <input
                type="text"
                value={indikatorKinerja}
                onChange={(e) => setIndikatorKinerja(e.target.value)}
                placeholder="Contoh: Jumlah Dokumen Hasil Kajian Rekomendasi Kebijakan yang Dimanfaatkan"
                required
                className="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg font-medium text-slate-900"
              />
            </div>

            <div className="grid grid-cols-3 gap-3">
              <div>
                <label className="block font-semibold text-slate-700 mb-1">Tahun Anggaran</label>
                <input
                  type="number"
                  value={tahun}
                  onChange={(e) => setTahun(parseInt(e.target.value) || 2026)}
                  className="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg"
                />
              </div>
              <div>
                <label className="block font-semibold text-slate-700 mb-1">Target Anggaran</label>
                <input
                  type="number"
                  value={target}
                  onChange={(e) => setTarget(e.target.value)}
                  className="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg"
                />
              </div>
              <div>
                <label className="block font-semibold text-slate-700 mb-1">Satuan Target</label>
                <select
                  value={satuanTarget}
                  onChange={(e) => setSatuanTarget(e.target.value)}
                  className="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg"
                >
                  <option value="dokumen">Dokumen</option>
                  <option value="persen">Persen (%)</option>
                  <option value="laporan">Laporan</option>
                  <option value="paket">Paket</option>
                  <option value="unit">Unit</option>
                  <option value="rekomendasi">Rekomendasi</option>
                </select>
              </div>
            </div>

            {/* Triwulan Realization Strip */}
            <div className="bg-slate-50 p-3 rounded-xl border border-slate-200 space-y-2">
              <span className="font-bold text-slate-800 block">
                Realisasi Triwulanan (TW I s/d TW IV):
              </span>
              <div className="grid grid-cols-4 gap-2">
                <div>
                  <span className="text-[10px] text-slate-500 block mb-1">Triwulan I</span>
                  <input
                    type="number"
                    step="0.1"
                    value={tw1}
                    onChange={(e) => setTw1(parseFloat(e.target.value) || 0)}
                    className="w-full p-2 bg-white border border-slate-300 rounded font-bold text-center"
                  />
                </div>
                <div>
                  <span className="text-[10px] text-slate-500 block mb-1">Triwulan II</span>
                  <input
                    type="number"
                    step="0.1"
                    value={tw2}
                    onChange={(e) => setTw2(parseFloat(e.target.value) || 0)}
                    className="w-full p-2 bg-white border border-slate-300 rounded font-bold text-center"
                  />
                </div>
                <div>
                  <span className="text-[10px] text-slate-500 block mb-1">Triwulan III</span>
                  <input
                    type="number"
                    step="0.1"
                    value={tw3}
                    onChange={(e) => setTw3(parseFloat(e.target.value) || 0)}
                    className="w-full p-2 bg-white border border-slate-300 rounded font-bold text-center"
                  />
                </div>
                <div>
                  <span className="text-[10px] text-slate-500 block mb-1">Triwulan IV</span>
                  <input
                    type="number"
                    step="0.1"
                    value={tw4}
                    onChange={(e) => setTw4(parseFloat(e.target.value) || 0)}
                    className="w-full p-2 bg-white border border-slate-300 rounded font-bold text-center"
                  />
                </div>
              </div>
            </div>

            <div>
              <label className="block font-semibold text-slate-700 mb-1">Narasi Capaian / Keterangan</label>
              <textarea
                value={keterangan}
                onChange={(e) => setKeterangan(e.target.value)}
                placeholder="Penjelasan ringkas hasil capaian..."
                rows={2}
                className="w-full p-2.5 bg-slate-50 border border-slate-200 rounded-lg"
              />
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
              <div>
                <label className="block font-semibold text-slate-700 mb-1">Faktor Pendukung</label>
                <input
                  type="text"
                  value={faktorPendukung}
                  onChange={(e) => setFaktorPendukung(e.target.value)}
                  placeholder="Kolaborasi, ketersediaan anggaran..."
                  className="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg"
                />
              </div>

              <div>
                <label className="block font-semibold text-slate-700 mb-1">Kendala / Hambatan</label>
                <input
                  type="text"
                  value={peluangHambatan}
                  onChange={(e) => setPeluangHambatan(e.target.value)}
                  placeholder="Hambatan regulasi, waktu pelaksanaan..."
                  className="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg"
                />
              </div>
            </div>

            <div>
              <label className="block font-semibold text-slate-700 mb-1">Tautan Dokumen Bukti Dukung</label>
              <input
                type="url"
                value={linkDokumen}
                onChange={(e) => setLinkDokumen(e.target.value)}
                placeholder="https://cloud.brida.jatimprov.go.id/dokumen/..."
                className="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg"
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
                className="px-5 py-2 bg-emerald-600 hover:bg-emerald-700 text-white rounded-lg font-bold shadow-xs"
              >
                {reportToEdit ? 'Perbarui Laporan' : 'Kirim Laporan Kinerja'}
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
};
