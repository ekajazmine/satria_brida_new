import React, { useState } from 'react';
import { useApp } from '../../context/AppContext';
import { X, Download, Search, FileSpreadsheet, FileText, ArrowUpDown } from 'lucide-react';

export const DataPreviewModal: React.FC = () => {
  const { previewModal, closePreview, notify } = useApp();
  const { isOpen, dataset, type } = previewModal;

  const [search, setSearch] = useState('');
  const [currentPage, setCurrentPage] = useState(1);
  const pageSize = 10;

  if (!isOpen || !dataset) return null;

  const handleDownload = () => {
    dataset.downloads_count += 1;
    notify(`Mengunduh berkas ${dataset.title} (${type?.toUpperCase() || 'CSV'})...`);
    
    const ext = type || 'csv';
    const filename = `${dataset.title.replace(/\s+/g, '_')}.${ext}`;
    const content = ext === 'csv'
      ? (dataset.preview_data ? dataset.preview_data.columns.join(',') + '\n' + dataset.preview_data.rows.map(r => r.join(',')).join('\n') : 'No,Data\n1,Contoh')
      : `%PDF-1.4\n% SATRIA BRIDA DOKUMEN RESMI\n% Judul: ${dataset.title}`;
    
    const blob = new Blob([content], { type: ext === 'csv' ? 'text/csv' : 'application/pdf' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = filename;
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(url);
  };

  const rows = dataset.preview_data ? dataset.preview_data.rows : [];
  const columns = dataset.preview_data ? dataset.preview_data.columns : [];

  const filteredRows = rows.filter((row) =>
    row.some((cell) => String(cell).toLowerCase().includes(search.toLowerCase()))
  );

  const totalPages = Math.ceil(filteredRows.length / pageSize) || 1;
  const paginatedRows = filteredRows.slice((currentPage - 1) * pageSize, currentPage * pageSize);

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-900/60 backdrop-blur-xs overflow-y-auto">
      <div className="bg-white rounded-2xl max-w-5xl w-full border border-slate-200 shadow-2xl overflow-hidden my-8 flex flex-col max-h-[90vh] animate-in fade-in zoom-in-95 duration-150">
        <div className="h-1.5 w-full bg-linear-to-r from-emerald-600 via-sky-600 to-[#004b87]" />

        {/* Modal Top Bar */}
        <div className="p-5 border-b border-slate-200 flex items-center justify-between gap-4">
          <div className="flex items-center gap-3">
            <div className="w-10 h-10 rounded-lg bg-emerald-50 text-emerald-700 flex items-center justify-center">
              <FileSpreadsheet className="w-5 h-5" />
            </div>
            <div>
              <h3 className="text-base font-bold text-slate-900 leading-tight">
                Pratinjau Data: {dataset.title}
              </h3>
              <p className="text-xs text-slate-500 font-mono mt-0.5">
                {dataset.file_path} · {dataset.agency} · Tahun {dataset.year}
              </p>
            </div>
          </div>

          <div className="flex items-center gap-2">
            <button
              onClick={handleDownload}
              className="px-3.5 py-2 bg-[#004b87] hover:bg-[#003865] text-white rounded-lg text-xs font-semibold flex items-center gap-1.5 transition-colors shadow-xs"
            >
              <Download className="w-3.5 h-3.5" />
              Unduh CSV
            </button>
            <button
              onClick={closePreview}
              className="p-1.5 rounded-lg text-slate-400 hover:text-slate-700 hover:bg-slate-100"
            >
              <X className="w-5 h-5" />
            </button>
          </div>
        </div>

        {/* Search within table & info */}
        <div className="p-4 bg-slate-50 border-b border-slate-200 flex flex-col sm:flex-row sm:items-center justify-between gap-3">
          <div className="relative max-w-sm flex-1">
            <Search className="w-4 h-4 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2" />
            <input
              type="text"
              value={search}
              onChange={(e) => {
                setSearch(e.target.value);
                setCurrentPage(1);
              }}
              placeholder="Saring isi data tabel..."
              className="w-full pl-9 pr-3 py-1.5 text-xs bg-white border border-slate-200 rounded-lg focus:outline-hidden focus:ring-1 focus:ring-[#004b87]"
            />
          </div>

          <div className="text-xs text-slate-500 font-medium">
            Menampilkan <span className="font-bold text-slate-900">{filteredRows.length}</span> baris data
          </div>
        </div>

        {/* Scrollable Table Viewport */}
        <div className="flex-1 overflow-auto p-4">
          {columns.length > 0 ? (
            <div className="border border-slate-200 rounded-lg overflow-hidden shadow-xs">
              <table className="w-full text-left text-xs border-collapse">
                <thead className="bg-slate-100 text-slate-700 font-bold border-b border-slate-200 sticky top-0">
                  <tr>
                    {columns.map((col, idx) => (
                      <th
                        key={idx}
                        className="px-4 py-2.5 border-r border-slate-200 last:border-r-0 whitespace-nowrap bg-slate-100"
                      >
                        {col}
                      </th>
                    ))}
                  </tr>
                </thead>
                <tbody className="divide-y divide-slate-100 text-slate-700 bg-white">
                  {paginatedRows.length > 0 ? (
                    paginatedRows.map((row, rIdx) => (
                      <tr key={rIdx} className="hover:bg-sky-50/50 transition-colors">
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
                      <td colSpan={columns.length} className="px-4 py-8 text-center text-slate-400 italic">
                        Tidak ada data yang sesuai dengan penyaringan "{search}"
                      </td>
                    </tr>
                  )}
                </tbody>
              </table>
            </div>
          ) : (
            <div className="p-8 text-center text-slate-400 italic">
              Data belum tersedia untuk dipratinjau.
            </div>
          )}
        </div>

        {/* Modal Pagination Footer */}
        {totalPages > 1 && (
          <div className="p-3 bg-slate-50 border-t border-slate-200 flex items-center justify-between text-xs text-slate-600">
            <span>
              Halaman {currentPage} dari {totalPages}
            </span>
            <div className="flex items-center gap-1.5">
              <button
                disabled={currentPage <= 1}
                onClick={() => setCurrentPage((p) => Math.max(1, p - 1))}
                className="px-3 py-1 bg-white border border-slate-200 rounded disabled:opacity-40"
              >
                Sebelumnya
              </button>
              <button
                disabled={currentPage >= totalPages}
                onClick={() => setCurrentPage((p) => Math.min(totalPages, p + 1))}
                className="px-3 py-1 bg-white border border-slate-200 rounded disabled:opacity-40"
              >
                Selanjutnya
              </button>
            </div>
          </div>
        )}
      </div>
    </div>
  );
};
