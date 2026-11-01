import React, { useState, useMemo } from 'react';
import { useApp } from '../../context/AppContext';
import { Dataset } from '../../types';
import {
  Search,
  Filter,
  FileSpreadsheet,
  FileText,
  Eye,
  Download,
  Calendar,
  Building,
  CheckCircle2,
  Clock,
  AlertCircle,
  RotateCcw,
  SlidersHorizontal,
  ChevronRight,
} from 'lucide-react';

interface CatalogSectionProps {
  initialCategory?: string;
  initialSearch?: string;
  onSelectDataset: (id: number) => void;
}

export const CatalogSection: React.FC<CatalogSectionProps> = ({
  initialCategory = 'Semua',
  initialSearch = '',
  onSelectDataset,
}) => {
  const { datasets, openPreview, notify } = useApp();

  const [search, setSearch] = useState(initialSearch);
  const [selectedCategory, setSelectedCategory] = useState<string>(initialCategory);
  const [selectedYear, setSelectedYear] = useState<string>('Semua');
  const [selectedFormat, setSelectedFormat] = useState<string>('Semua');
  const [selectedStatus, setSelectedStatus] = useState<string>('Semua');
  const [sortBy, setSortBy] = useState<'terbaru' | 'views' | 'downloads' | 'title'>('terbaru');

  // Filter datasets
  const filteredDatasets = useMemo(() => {
    return datasets
      .filter((d) => {
        // Search query
        if (search.trim()) {
          const q = search.toLowerCase();
          const matchTitle = d.title.toLowerCase().includes(q);
          const matchDesc = d.description.toLowerCase().includes(q);
          const matchAgency = (d.agency || '').toLowerCase().includes(q);
          const matchResearcher = (d.researcher || '').toLowerCase().includes(q);
          if (!matchTitle && !matchDesc && !matchAgency && !matchResearcher) return false;
        }

        // Category filter
        if (selectedCategory !== 'Semua' && d.category !== selectedCategory) {
          return false;
        }

        // Year filter
        if (selectedYear !== 'Semua' && String(d.year) !== selectedYear) {
          return false;
        }

        // Format filter
        if (selectedFormat !== 'Semua') {
          if (selectedFormat === 'CSV' && !d.file_path.endsWith('.csv')) return false;
          if (selectedFormat === 'PDF' && !d.pdf_path) return false;
          if (selectedFormat === 'DOC' && !d.metadata_path) return false;
        }

        // Status filter
        if (selectedStatus !== 'Semua') {
          if (selectedStatus === 'published' && d.status !== 'published' && d.status !== 'approved') return false;
          if (selectedStatus === 'waiting_for_verification' && d.status !== 'waiting_for_verification') return false;
          if (selectedStatus === 'waiting_for_revision' && d.status !== 'waiting_for_revision') return false;
        }

        return true;
      })
      .sort((a, b) => {
        if (sortBy === 'terbaru') return b.id - a.id;
        if (sortBy === 'views') return b.views_count - a.views_count;
        if (sortBy === 'downloads') return b.downloads_count - a.downloads_count;
        if (sortBy === 'title') return a.title.localeCompare(b.title);
        return 0;
      });
  }, [datasets, search, selectedCategory, selectedYear, selectedFormat, selectedStatus, sortBy]);

  const handleResetFilters = () => {
    setSearch('');
    setSelectedCategory('Semua');
    setSelectedYear('Semua');
    setSelectedFormat('Semua');
    setSelectedStatus('Semua');
    setSortBy('terbaru');
  };

  const handleDownloadFile = (dataset: Dataset, format: 'csv' | 'pdf') => {
    // Increment download counter
    dataset.downloads_count += 1;
    notify(`Mengunduh file ${dataset.title} (${format.toUpperCase()})...`);
    
    // Generate simple blob download
    const filename = `${dataset.title.replace(/\s+/g, '_')}.${format}`;
    const dummyContent = format === 'csv'
      ? (dataset.preview_data ? dataset.preview_data.columns.join(',') + '\n' + dataset.preview_data.rows.map(r => r.join(',')).join('\n') : 'No,Data\n1,Contoh')
      : `%PDF-1.4\n% SATRIA BRIDA DOKUMEN RESMI\n% Judul: ${dataset.title}\n% Instansi: ${dataset.agency}`;
    
    const blob = new Blob([dummyContent], { type: format === 'csv' ? 'text/csv' : 'application/pdf' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = filename;
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(url);
  };

  return (
    <div className="bg-slate-50 min-h-screen py-10">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        {/* Breadcrumb & Section Header */}
        <div className="mb-6">
          <div className="flex items-center gap-2 text-xs text-slate-500 mb-2">
            <span>Beranda</span>
            <ChevronRight className="w-3.5 h-3.5 text-slate-400" />
            <span className="text-[#004b87] font-semibold">Katalog Data</span>
          </div>
          <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
            <div>
              <h2 className="text-2xl font-bold text-slate-900 tracking-tight">
                Katalog Dataset Riset & Inovasi
              </h2>
              <p className="text-xs text-slate-600 mt-1">
                Koleksi data terbuka hasil penelitian, pengembangan, pengkajian, dan penerapan di Jawa Timur.
              </p>
            </div>
            <div className="text-xs text-slate-500 font-medium">
              Menampilkan <span className="font-bold text-slate-900">{filteredDatasets.length}</span> dari{' '}
              <span className="font-bold text-slate-900">{datasets.length}</span> dataset
            </div>
          </div>
        </div>

        {/* Search Bar & Sort Strip */}
        <div className="bg-white rounded-xl p-4 border border-slate-200 shadow-xs mb-8 flex flex-col md:flex-row gap-4 items-stretch md:items-center justify-between">
          <div className="relative flex-1">
            <Search className="w-4 h-4 text-slate-400 absolute left-3.5 top-1/2 -translate-y-1/2" />
            <input
              type="text"
              value={search}
              onChange={(e) => setSearch(e.target.value)}
              placeholder="Cari kata kunci judul dataset, instansi, peneliti..."
              className="w-full pl-10 pr-4 py-2.5 text-xs text-slate-800 placeholder-slate-400 bg-slate-50 border border-slate-200 rounded-lg focus:outline-hidden focus:ring-2 focus:ring-[#004b87] focus:bg-white transition-all"
            />
          </div>

          <div className="flex items-center gap-3 shrink-0">
            <div className="flex items-center gap-2 text-xs text-slate-600">
              <SlidersHorizontal className="w-4 h-4 text-slate-500" />
              <span>Urutkan:</span>
              <select
                value={sortBy}
                onChange={(e) => setSortBy(e.target.value as any)}
                className="bg-slate-50 border border-slate-200 text-slate-800 text-xs rounded-lg px-3 py-2 font-medium focus:outline-hidden focus:ring-2 focus:ring-[#004b87]"
              >
                <option value="terbaru">Terbaru Ditambahkan</option>
                <option value="views">Paling Banyak Dilihat</option>
                <option value="downloads">Paling Banyak Diunduh</option>
                <option value="title">Judul (A - Z)</option>
              </select>
            </div>

            {(search || selectedCategory !== 'Semua' || selectedYear !== 'Semua' || selectedFormat !== 'Semua') && (
              <button
                onClick={handleResetFilters}
                className="px-3 py-2 rounded-lg text-xs font-medium text-slate-600 hover:text-red-600 hover:bg-red-50 border border-slate-200 transition-colors flex items-center gap-1.5"
                title="Reset Semua Filter"
              >
                <RotateCcw className="w-3.5 h-3.5" />
                Reset
              </button>
            )}
          </div>
        </div>

        {/* 2-Column Layout: Sidebar Filters + Dataset Cards */}
        <div className="grid grid-cols-1 lg:grid-cols-4 gap-8">
          {/* Left Sidebar Filter */}
          <div className="lg:col-span-1 space-y-6">
            <div className="bg-white rounded-xl p-5 border border-slate-200 shadow-xs space-y-5">
              <div className="flex items-center justify-between pb-3 border-b border-slate-100">
                <span className="font-bold text-xs uppercase tracking-wider text-slate-900 flex items-center gap-2">
                  <Filter className="w-4 h-4 text-[#004b87]" />
                  Filter Data
                </span>
                <span className="text-[11px] text-slate-500">
                  {filteredDatasets.length} hasil
                </span>
              </div>

              {/* Filter 1: Kategori / Bidang */}
              <div>
                <label className="block text-xs font-bold text-slate-800 mb-2">
                  Bidang Organisasi
                </label>
                <div className="space-y-1">
                  {[
                    { label: 'Semua Bidang', val: 'Semua' },
                    { label: 'Litbangjirap', val: 'Litbangjirap' },
                    { label: 'Invensi & Inovasi', val: 'Invensi Inovasi' },
                    { label: 'Sekretariat BRIDA', val: 'Sekretariat' },
                  ].map((cat) => (
                    <button
                      key={cat.val}
                      onClick={() => setSelectedCategory(cat.val)}
                      className={`w-full text-left px-3 py-1.5 rounded-md text-xs transition-colors flex items-center justify-between ${
                        selectedCategory === cat.val
                          ? 'bg-sky-50 text-[#004b87] font-semibold'
                          : 'text-slate-600 hover:bg-slate-50 hover:text-slate-900'
                      }`}
                    >
                      <span>{cat.label}</span>
                      <span className="text-[10px] text-slate-400 tabular-nums">
                        {cat.val === 'Semua'
                          ? datasets.length
                          : datasets.filter((d) => d.category === cat.val).length}
                      </span>
                    </button>
                  ))}
                </div>
              </div>

              {/* Filter 2: Tahun Data */}
              <div className="pt-3 border-t border-slate-100">
                <label className="block text-xs font-bold text-slate-800 mb-2">
                  Tahun Anggaran / Data
                </label>
                <div className="grid grid-cols-3 gap-1.5">
                  {['Semua', '2026', '2025'].map((yr) => (
                    <button
                      key={yr}
                      onClick={() => setSelectedYear(yr)}
                      className={`py-1.5 px-2 text-center rounded-md text-xs font-medium transition-colors ${
                        selectedYear === yr
                          ? 'bg-[#004b87] text-white shadow-xs'
                          : 'bg-slate-100 text-slate-700 hover:bg-slate-200'
                      }`}
                    >
                      {yr}
                    </button>
                  ))}
                </div>
              </div>

              {/* Filter 3: Format Berkas */}
              <div className="pt-3 border-t border-slate-100">
                <label className="block text-xs font-bold text-slate-800 mb-2">
                  Format Berkas
                </label>
                <div className="space-y-1">
                  {[
                    { label: 'Semua Format', val: 'Semua' },
                    { label: 'CSV (Data Tabular)', val: 'CSV' },
                    { label: 'PDF (Dokumen Resmi)', val: 'PDF' },
                    { label: 'DOC / Naskah Word', val: 'DOC' },
                  ].map((fmt) => (
                    <button
                      key={fmt.val}
                      onClick={() => setSelectedFormat(fmt.val)}
                      className={`w-full text-left px-3 py-1.5 rounded-md text-xs transition-colors flex items-center justify-between ${
                        selectedFormat === fmt.val
                          ? 'bg-sky-50 text-[#004b87] font-semibold'
                          : 'text-slate-600 hover:bg-slate-50'
                      }`}
                    >
                      <span>{fmt.label}</span>
                    </button>
                  ))}
                </div>
              </div>

              {/* Filter 4: Status Verifikasi */}
              <div className="pt-3 border-t border-slate-100">
                <label className="block text-xs font-bold text-slate-800 mb-2">
                  Status Standar SDI
                </label>
                <div className="space-y-1">
                  {[
                    { label: 'Semua Status', val: 'Semua' },
                    { label: 'Terbuka / Published', val: 'published' },
                    { label: 'Menunggu Verifikasi', val: 'waiting_for_verification' },
                    { label: 'Perlu Revisi', val: 'waiting_for_revision' },
                  ].map((st) => (
                    <button
                      key={st.val}
                      onClick={() => setSelectedStatus(st.val)}
                      className={`w-full text-left px-3 py-1.5 rounded-md text-xs transition-colors flex items-center justify-between ${
                        selectedStatus === st.val
                          ? 'bg-sky-50 text-[#004b87] font-semibold'
                          : 'text-slate-600 hover:bg-slate-50'
                      }`}
                    >
                      <span>{st.label}</span>
                    </button>
                  ))}
                </div>
              </div>
            </div>

            {/* SDI Principle Box */}
            <div className="bg-sky-50 border border-sky-100 rounded-xl p-4 text-xs text-slate-700 space-y-2">
              <span className="font-bold text-[#004b87] block">
                4 Prinsip Satu Data Indonesia
              </span>
              <ul className="space-y-1 text-[11px] text-slate-600 list-disc list-inside">
                <li>Satu Standar Data Terdefinisi</li>
                <li>Satu Metadata Baku</li>
                <li>Interoperabilitas Antar Sistem</li>
                <li>Kode Referensi / Data Induk</li>
              </ul>
            </div>
          </div>

          {/* Right Column: Dataset Card Grid */}
          <div className="lg:col-span-3 space-y-4">
            {filteredDatasets.length === 0 ? (
              <div className="bg-white rounded-xl p-12 text-center border border-slate-200">
                <div className="w-12 h-12 rounded-full bg-slate-100 text-slate-400 flex items-center justify-center mx-auto mb-3">
                  <Search className="w-6 h-6" />
                </div>
                <h3 className="text-base font-bold text-slate-800">
                  Tidak ada dataset yang sesuai filter
                </h3>
                <p className="text-xs text-slate-500 max-w-md mx-auto mt-1">
                  Coba sesuaikan kata kunci pencarian atau bersihkan filter bidang dan format file.
                </p>
                <button
                  onClick={handleResetFilters}
                  className="mt-4 px-4 py-2 bg-[#004b87] text-white rounded-lg text-xs font-semibold hover:bg-[#003865] transition-colors"
                >
                  Bersihkan Semua Filter
                </button>
              </div>
            ) : (
              filteredDatasets.map((dataset) => (
                <div
                  key={dataset.id}
                  className="bg-white rounded-xl p-5 border border-slate-200 hover:border-sky-300 hover:shadow-md transition-all group"
                >
                  <div className="flex flex-col sm:flex-row sm:items-start justify-between gap-3">
                    <div className="space-y-1.5 flex-1">
                      {/* Quiet Unboxed Metadata Line */}
                      <div className="flex flex-wrap items-center gap-2 text-xs text-slate-500">
                        <span className="font-semibold text-[#004b87]">
                          {dataset.category}
                        </span>
                        <span aria-hidden="true">·</span>
                        <span className="flex items-center gap-1">
                          <Building className="w-3 h-3 text-slate-400" />
                          {dataset.agency}
                        </span>
                        <span aria-hidden="true">·</span>
                        <span className="flex items-center gap-1">
                          <Calendar className="w-3 h-3 text-slate-400" />
                          Tahun {dataset.year}
                        </span>
                      </div>

                      {/* Title */}
                      <h3
                        onClick={() => onSelectDataset(dataset.id)}
                        className="text-base font-bold text-slate-900 group-hover:text-[#004b87] transition-colors cursor-pointer"
                      >
                        {dataset.title}
                      </h3>

                      {/* Excerpt */}
                      <p className="text-xs text-slate-600 line-clamp-2 leading-relaxed">
                        {dataset.description}
                      </p>
                    </div>

                    {/* Status Badge */}
                    <div className="shrink-0 self-start">
                      {dataset.status === 'published' && (
                        <span className="inline-flex items-center gap-1 px-2.5 py-1 rounded-full text-[11px] font-medium bg-emerald-50 text-emerald-700 border border-emerald-200">
                          <CheckCircle2 className="w-3 h-3" />
                          Publik
                        </span>
                      )}
                      {dataset.status === 'approved' && (
                        <span className="inline-flex items-center gap-1 px-2.5 py-1 rounded-full text-[11px] font-medium bg-blue-50 text-blue-700 border border-blue-200">
                          <CheckCircle2 className="w-3 h-3" />
                          Disetujui
                        </span>
                      )}
                      {dataset.status === 'waiting_for_verification' && (
                        <span className="inline-flex items-center gap-1 px-2.5 py-1 rounded-full text-[11px] font-medium bg-amber-50 text-amber-700 border border-amber-200">
                          <Clock className="w-3 h-3" />
                          Menunggu Verifikasi
                        </span>
                      )}
                      {dataset.status === 'waiting_for_revision' && (
                        <span className="inline-flex items-center gap-1 px-2.5 py-1 rounded-full text-[11px] font-medium bg-rose-50 text-rose-700 border border-rose-200">
                          <AlertCircle className="w-3 h-3" />
                          Perlu Revisi
                        </span>
                      )}
                    </div>
                  </div>

                  {/* Card Bottom: File Formats, Metrics & Action Buttons */}
                  <div className="mt-4 pt-3.5 border-t border-slate-100 flex flex-wrap items-center justify-between gap-3">
                    {/* Formats and Metrics */}
                    <div className="flex flex-wrap items-center gap-3 text-xs text-slate-500">
                      <div className="flex items-center gap-1.5">
                        <span className="text-[10px] font-bold px-2 py-0.5 rounded bg-slate-100 text-slate-700 font-mono">
                          CSV
                        </span>
                        {dataset.pdf_path && (
                          <span className="text-[10px] font-bold px-2 py-0.5 rounded bg-rose-50 text-rose-700 font-mono">
                            PDF
                          </span>
                        )}
                        {dataset.metadata_path && (
                          <span className="text-[10px] font-bold px-2 py-0.5 rounded bg-blue-50 text-blue-700 font-mono">
                            DOC
                          </span>
                        )}
                      </div>

                      <span className="hidden sm:inline">·</span>

                      <div className="flex items-center gap-3 text-slate-500">
                        <span className="flex items-center gap-1" title="Jumlah Kali Dilihat">
                          <Eye className="w-3.5 h-3.5 text-slate-400" />
                          <span className="tabular-nums">{dataset.views_count}</span>
                        </span>
                        <span className="flex items-center gap-1" title="Jumlah Unduhan">
                          <Download className="w-3.5 h-3.5 text-slate-400" />
                          <span className="tabular-nums">{dataset.downloads_count}</span>
                        </span>
                      </div>
                    </div>

                    {/* Action Controls */}
                    <div className="flex items-center gap-2">
                      <button
                        onClick={() => openPreview(dataset, 'csv')}
                        className="px-3 py-1.5 rounded-lg border border-slate-200 hover:border-[#004b87] hover:bg-sky-50 text-slate-700 hover:text-[#004b87] text-xs font-semibold transition-colors flex items-center gap-1.5"
                      >
                        <FileSpreadsheet className="w-3.5 h-3.5 text-emerald-600" />
                        Pratinjau Data
                      </button>

                      <button
                        onClick={() => handleDownloadFile(dataset, 'csv')}
                        className="px-3 py-1.5 rounded-lg bg-slate-100 hover:bg-slate-200 text-slate-800 text-xs font-medium transition-colors flex items-center gap-1"
                        title="Unduh format CSV"
                      >
                        <Download className="w-3.5 h-3.5" />
                        Unduh
                      </button>

                      <button
                        onClick={() => onSelectDataset(dataset.id)}
                        className="px-3 py-1.5 rounded-lg bg-[#004b87] hover:bg-[#003865] text-white text-xs font-semibold transition-colors flex items-center gap-1"
                      >
                        Detail
                      </button>
                    </div>
                  </div>
                </div>
              ))
            )}
          </div>
        </div>
      </div>
    </div>
  );
};
