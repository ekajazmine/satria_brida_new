import React, { useState } from 'react';
import { useApp } from '../../context/AppContext';
import { History, Shield, Search, Download } from 'lucide-react';

export const AuditLogs: React.FC = () => {
  const { logs, notify } = useApp();
  const [search, setSearch] = useState('');

  const filteredLogs = logs.filter((log) => {
    if (search.trim()) {
      const q = search.toLowerCase();
      return (
        log.user_name.toLowerCase().includes(q) ||
        log.action.toLowerCase().includes(q) ||
        log.target.toLowerCase().includes(q)
      );
    }
    return true;
  });

  const handleExport = () => {
    notify('Mengunduh catatan audit log sistem ke CSV...');
  };

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h2 className="text-xl font-bold text-slate-900 tracking-tight flex items-center gap-2">
            <History className="w-5 h-5 text-[#004b87]" />
            Catatan Audit & Riwayat Aktivitas Sistem
          </h2>
          <p className="text-xs text-slate-500 mt-0.5">
            Jejak digital autentikasi, verifikasi dataset, dan perubahan pelaporan kinerja.
          </p>
        </div>

        <button
          onClick={handleExport}
          className="px-3.5 py-2 border border-slate-200 bg-white hover:bg-slate-50 text-slate-700 rounded-lg text-xs font-semibold flex items-center gap-1.5 shadow-xs transition-colors self-start sm:self-auto"
        >
          <Download className="w-4 h-4 text-slate-500" />
          Ekspor Log (CSV)
        </button>
      </div>

      <div className="relative max-w-sm">
        <Search className="w-4 h-4 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2" />
        <input
          type="text"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          placeholder="Cari aktivitas, nama pengguna, aksi..."
          className="w-full pl-9 pr-3 py-2 text-xs bg-white border border-slate-200 rounded-lg focus:outline-hidden focus:ring-2 focus:ring-[#004b87]"
        />
      </div>

      <div className="bg-white rounded-xl border border-slate-200 shadow-xs overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left text-xs border-collapse">
            <thead className="bg-slate-50 text-slate-700 font-bold border-b border-slate-200">
              <tr>
                <th className="px-4 py-3">Waktu Kejadian</th>
                <th className="px-4 py-3">Pengguna / Operator</th>
                <th className="px-4 py-3">Jenis Aksi</th>
                <th className="px-4 py-3">Target / Objek</th>
                <th className="px-4 py-3">Alamat IP</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100 text-slate-700">
              {filteredLogs.map((log) => (
                <tr key={log.id} className="hover:bg-slate-50/80 transition-colors">
                  <td className="px-4 py-3 text-slate-500 tabular-nums">{log.timestamp}</td>
                  <td className="px-4 py-3 font-semibold text-slate-900">{log.user_name}</td>
                  <td className="px-4 py-3">
                    <span className="inline-block px-2 py-0.5 rounded bg-slate-100 text-slate-800 font-mono text-[10px] font-bold">
                      {log.action}
                    </span>
                  </td>
                  <td className="px-4 py-3 text-slate-700">{log.target}</td>
                  <td className="px-4 py-3 text-slate-400 font-mono text-[11px] tabular-nums">
                    {log.ip_address}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
};
