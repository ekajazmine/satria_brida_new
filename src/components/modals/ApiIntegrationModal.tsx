import React, { useState } from 'react';
import { useApp } from '../../context/AppContext';
import { X, Code2, Send, Copy, Check } from 'lucide-react';

interface ApiIntegrationModalProps {
  isOpen: boolean;
  onClose: () => void;
}

export const ApiIntegrationModal: React.FC<ApiIntegrationModalProps> = ({ isOpen, onClose }) => {
  const { datasets, notify } = useApp();
  const [selectedEndpoint, setSelectedEndpoint] = useState<string>('/api/datasets');
  const [copied, setCopied] = useState(false);

  if (!isOpen) return null;

  const endpoints = [
    {
      path: '/api/datasets',
      desc: 'Daftar seluruh dataset terbuka terverifikasi standar SDI',
      sampleResponse: datasets.slice(0, 3).map((d) => ({
        id: d.id,
        title: d.title,
        category: d.category,
        agency: d.agency,
        year: d.year,
        format: 'CSV/PDF',
        status: d.status,
      })),
    },
    {
      path: '/api/inovasi',
      desc: 'Data inovasi daerah usulan Innovative Government Award (IGA)',
      sampleResponse: [
        { id: 1, nama_inovasi: 'Samsat 4.0 QRIS', instansi: 'Bapenda Jatim', skor: 118 },
        { id: 2, nama_inovasi: 'E-Ternak Telemedicine', instansi: 'Disnak Jatim', skor: 112 },
      ],
    },
    {
      path: '/api/peneliti',
      desc: 'Data sebaran sumber daya manusia peneliti fungsional di Jawa Timur',
      sampleResponse: {
        total_peneliti: 298,
        ahli_utama: 70,
        ahli_madya: 122,
        ahli_muda: 80,
        ahli_pertama: 26,
      },
    },
    {
      path: '/api/datasets_by_bidang',
      desc: 'Statistik agregat jumlah dataset per bidang kerja',
      sampleResponse: {
        Litbangjirap: datasets.filter((d) => d.category === 'Litbangjirap').length,
        'Invensi Inovasi': datasets.filter((d) => d.category === 'Invensi Inovasi').length,
        Sekretariat: datasets.filter((d) => d.category === 'Sekretariat').length,
      },
    },
  ];

  const current = endpoints.find((e) => e.path === selectedEndpoint) || endpoints[0];

  const handleCopyJson = () => {
    navigator.clipboard?.writeText(JSON.stringify(current.sampleResponse, null, 2));
    setCopied(true);
    notify('JSON Response berhasil disalin ke clipboard.');
    setTimeout(() => setCopied(false), 2000);
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-900/60 backdrop-blur-xs">
      <div className="bg-white rounded-2xl max-w-3xl w-full border border-slate-200 shadow-2xl overflow-hidden animate-in fade-in zoom-in-95 duration-150 flex flex-col max-h-[90vh]">
        <div className="h-1.5 w-full bg-linear-to-r from-blue-600 via-sky-500 to-indigo-600" />

        <div className="p-6 border-b border-slate-100 flex items-center justify-between">
          <div className="flex items-center gap-3">
            <div className="w-10 h-10 rounded-lg bg-sky-50 text-[#004b87] flex items-center justify-center">
              <Code2 className="w-5 h-5" />
            </div>
            <div>
              <h3 className="text-base font-bold text-slate-900">
                Sandbox API Interoperabilitas Satu Data Indonesia
              </h3>
              <p className="text-xs text-slate-500">
                Endpoint resmi RESTful JSON untuk integrasi sistem informasi pemerintah.
              </p>
            </div>
          </div>
          <button onClick={onClose} className="p-1 text-slate-400 hover:text-slate-700">
            <X className="w-5 h-5" />
          </button>
        </div>

        <div className="p-6 space-y-4 overflow-y-auto flex-1 text-xs">
          {/* Endpoint selector */}
          <div>
            <label className="block font-bold text-slate-800 mb-1.5">Pilih Endpoint API:</label>
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-2">
              {endpoints.map((ep) => (
                <button
                  key={ep.path}
                  onClick={() => setSelectedEndpoint(ep.path)}
                  className={`p-3 rounded-lg text-left border transition-all ${
                    selectedEndpoint === ep.path
                      ? 'border-[#004b87] bg-sky-50/70 text-[#004b87] font-semibold'
                      : 'border-slate-200 bg-slate-50 hover:bg-slate-100 text-slate-700'
                  }`}
                >
                  <div className="flex items-center gap-2">
                    <span className="text-[10px] font-bold px-1.5 py-0.5 rounded bg-emerald-600 text-white font-mono">
                      GET
                    </span>
                    <span className="font-mono">{ep.path}</span>
                  </div>
                  <p className="text-[11px] text-slate-500 mt-1 line-clamp-1">{ep.desc}</p>
                </button>
              ))}
            </div>
          </div>

          {/* Request URL Box */}
          <div className="p-3 bg-slate-900 text-slate-200 rounded-lg font-mono text-xs flex items-center justify-between">
            <div className="flex items-center gap-2 truncate">
              <span className="text-emerald-400 font-bold">GET</span>
              <span className="text-sky-300">
                https://satria.brida.jatimprov.go.id{selectedEndpoint}
              </span>
            </div>
            <button
              onClick={handleCopyJson}
              className="px-2 py-1 bg-slate-800 hover:bg-slate-700 text-slate-300 rounded text-[11px] flex items-center gap-1 shrink-0"
            >
              {copied ? <Check className="w-3.5 h-3.5 text-emerald-400" /> : <Copy className="w-3.5 h-3.5" />}
              Salin JSON
            </button>
          </div>

          {/* Response Viewer */}
          <div>
            <span className="font-bold text-slate-800 block mb-1">
              Response Body (application/json; charset=utf-8) [200 OK]:
            </span>
            <pre className="p-4 bg-slate-950 text-emerald-400 rounded-xl overflow-x-auto text-[11px] font-mono leading-relaxed border border-slate-800 max-h-64">
              {JSON.stringify(current.sampleResponse, null, 2)}
            </pre>
          </div>
        </div>

        <div className="p-4 bg-slate-50 border-t border-slate-100 flex justify-end">
          <button
            onClick={onClose}
            className="px-4 py-2 bg-slate-200 hover:bg-slate-300 text-slate-700 rounded-lg text-xs font-semibold"
          >
            Tutup
          </button>
        </div>
      </div>
    </div>
  );
};
