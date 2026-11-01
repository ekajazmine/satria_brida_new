import React, { useState } from 'react';
import { useApp } from '../../context/AppContext';
import {
  Search,
  Database,
  Users,
  Lightbulb,
  FileText,
  Building2,
  BookOpen,
  ArrowRight,
  TrendingUp,
} from 'lucide-react';

interface HeroSectionProps {
  onSearch: (query: string) => void;
  onSelectCategory: (category: string) => void;
}

export const HeroSection: React.FC<HeroSectionProps> = ({ onSearch, onSelectCategory }) => {
  const { datasets, sicakabReports, setActiveTab } = useApp();
  const [query, setQuery] = useState('');

  const handleSearchSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    onSearch(query);
    setActiveTab('catalog');
  };

  const handleQuickTag = (tag: string) => {
    setQuery(tag);
    onSearch(tag);
    setActiveTab('catalog');
  };

  const publishedCount = datasets.filter((d) => d.status === 'published' || d.status === 'approved').length;

  return (
    <div className="relative bg-linear-to-b from-[#003566] via-[#004080] to-[#004d99] text-white overflow-hidden">
      {/* Subtle Background Pattern */}
      <div
        className="absolute inset-0 opacity-10 pointer-events-none"
        style={{
          backgroundImage: `radial-gradient(circle at 1px 1px, rgba(255,255,255,0.25) 1px, transparent 0)`,
          backgroundSize: '24px 24px',
        }}
      />

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pt-14 pb-16 relative z-10">
        <div className="max-w-3xl mx-auto text-center space-y-4">
          <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-sky-500/20 border border-sky-400/30 text-sky-200 text-xs font-medium">
            <span className="w-2 h-2 rounded-full bg-sky-400" />
            Portal Resmi Satu Data Riset & Inovasi Jawa Timur
          </div>

          <h1 className="text-3xl sm:text-4xl lg:text-5xl font-extrabold tracking-tight text-white text-balance leading-tight">
            Temukan & Akses Data Riset Daerah Terbuka
          </h1>

          <p className="text-sm sm:text-base text-slate-200 text-balance leading-relaxed">
            Menghubungkan data hasil kajian kebijakan, inovasi daerah, kepakaran peneliti,
            serta capaian kinerja dalam satu portal terpadu standar Satu Data Indonesia.
          </p>

          {/* Big Search Bar (Data.go.id Signature Element) */}
          <form onSubmit={handleSearchSubmit} className="pt-2">
            <div className="relative max-w-2xl mx-auto">
              <div className="flex items-center bg-white rounded-xl shadow-lg overflow-hidden p-1.5 border border-white/20 focus-within:ring-3 focus-within:ring-sky-400">
                <Search className="w-5 h-5 text-slate-400 ml-3 shrink-0" />
                <input
                  type="text"
                  value={query}
                  onChange={(e) => setQuery(e.target.value)}
                  placeholder="Cari dataset, inovasi daerah, policy paper, HKI..."
                  className="w-full px-3 py-2 text-sm text-slate-800 placeholder-slate-400 focus:outline-hidden"
                />
                <button
                  type="submit"
                  className="bg-[#004b87] hover:bg-[#003865] text-white px-5 py-2.5 rounded-lg text-xs font-semibold tracking-wide flex items-center gap-1.5 transition-colors shrink-0"
                >
                  Cari Data
                </button>
              </div>

              {/* Quick Search Keywords */}
              <div className="flex flex-wrap items-center justify-center gap-2 mt-3 text-xs text-slate-300">
                <span className="text-slate-400">Populer:</span>
                {['Policy Paper', 'Indeks Inovasi', 'Peneliti', 'HKI', 'Anggaran Riset', 'SICAKAB'].map((item) => (
                  <button
                    key={item}
                    type="button"
                    onClick={() => handleQuickTag(item)}
                    className="hover:text-white underline decoration-slate-400 hover:decoration-white transition-colors"
                  >
                    {item}
                  </button>
                ))}
              </div>
            </div>
          </form>
        </div>

        {/* 4 Statistics Strip */}
        <div className="grid grid-cols-2 lg:grid-cols-4 gap-4 mt-12 pt-8 border-t border-sky-400/20">
          <div className="bg-white/10 backdrop-blur-xs rounded-xl p-4 border border-white/10">
            <div className="flex items-center gap-3">
              <div className="w-10 h-10 rounded-lg bg-sky-500/20 flex items-center justify-center text-sky-300">
                <Database className="w-5 h-5" />
              </div>
              <div>
                <div className="text-2xl font-bold tracking-tight text-white tabular-nums">
                  {publishedCount}
                </div>
                <div className="text-xs text-sky-200">Dataset Terverifikasi</div>
              </div>
            </div>
          </div>

          <div className="bg-white/10 backdrop-blur-xs rounded-xl p-4 border border-white/10">
            <div className="flex items-center gap-3">
              <div className="w-10 h-10 rounded-lg bg-sky-500/20 flex items-center justify-center text-sky-300">
                <Users className="w-5 h-5" />
              </div>
              <div>
                <div className="text-2xl font-bold tracking-tight text-white tabular-nums">
                  298
                </div>
                <div className="text-xs text-sky-200">Peneliti Terdata</div>
              </div>
            </div>
          </div>

          <div className="bg-white/10 backdrop-blur-xs rounded-xl p-4 border border-white/10">
            <div className="flex items-center gap-3">
              <div className="w-10 h-10 rounded-lg bg-sky-500/20 flex items-center justify-center text-sky-300">
                <Lightbulb className="w-5 h-5" />
              </div>
              <div>
                <div className="text-2xl font-bold tracking-tight text-white tabular-nums">
                  312
                </div>
                <div className="text-xs text-sky-200">Inovasi IGA Masuk</div>
              </div>
            </div>
          </div>

          <div className="bg-white/10 backdrop-blur-xs rounded-xl p-4 border border-white/10">
            <div className="flex items-center gap-3">
              <div className="w-10 h-10 rounded-lg bg-sky-500/20 flex items-center justify-center text-sky-300">
                <FileText className="w-5 h-5" />
              </div>
              <div>
                <div className="text-2xl font-bold tracking-tight text-white tabular-nums">
                  {sicakabReports.length}
                </div>
                <div className="text-xs text-sky-200">Laporan SICAKAB</div>
              </div>
            </div>
          </div>
        </div>

        {/* 3 Main Thematic Sectors */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-5 mt-8">
          <div
            onClick={() => {
              onSelectCategory('Litbangjirap');
              setActiveTab('catalog');
            }}
            className="group cursor-pointer bg-white rounded-xl p-5 text-slate-800 shadow-md hover:shadow-xl transition-all border border-slate-200"
          >
            <div className="flex items-start justify-between">
              <div className="w-11 h-11 rounded-lg bg-blue-50 text-[#004b87] flex items-center justify-center">
                <BookOpen className="w-6 h-6" />
              </div>
              <span className="text-xs font-semibold text-[#004b87] flex items-center gap-1 group-hover:translate-x-0.5 transition-transform">
                Jelajahi <ArrowRight className="w-3.5 h-3.5" />
              </span>
            </div>
            <h3 className="text-base font-bold text-slate-900 mt-4 group-hover:text-[#004b87] transition-colors">
              Bidang Litbangjirap
            </h3>
            <p className="text-xs text-slate-600 mt-1 line-clamp-2 leading-relaxed">
              Kajian strategis, naskah kebijakan (policy paper/brief), repositori ilmiah, dan publikasi jurnal bereputasi.
            </p>
            <div className="mt-3 text-[11px] font-medium text-slate-500 flex items-center gap-2">
              <span className="text-[#004b87] font-semibold">
                {datasets.filter((d) => d.category === 'Litbangjirap').length} Dataset
              </span>
              <span>·</span>
              <span>Evidence-based Policy</span>
            </div>
          </div>

          <div
            onClick={() => {
              onSelectCategory('Invensi Inovasi');
              setActiveTab('catalog');
            }}
            className="group cursor-pointer bg-white rounded-xl p-5 text-slate-800 shadow-md hover:shadow-xl transition-all border border-slate-200"
          >
            <div className="flex items-start justify-between">
              <div className="w-11 h-11 rounded-lg bg-amber-50 text-amber-700 flex items-center justify-center">
                <Lightbulb className="w-6 h-6" />
              </div>
              <span className="text-xs font-semibold text-amber-700 flex items-center gap-1 group-hover:translate-x-0.5 transition-transform">
                Jelajahi <ArrowRight className="w-3.5 h-3.5" />
              </span>
            </div>
            <h3 className="text-base font-bold text-slate-900 mt-4 group-hover:text-amber-700 transition-colors">
              Bidang Invensi & Inovasi
            </h3>
            <p className="text-xs text-slate-600 mt-1 line-clamp-2 leading-relaxed">
              Pengukuran Indeks Inovasi Daerah (IID), data usulan IGA, perolehan HKI/Paten, dan diseminasi riset terapan.
            </p>
            <div className="mt-3 text-[11px] font-medium text-slate-500 flex items-center gap-2">
              <span className="text-amber-700 font-semibold">
                {datasets.filter((d) => d.category === 'Invensi Inovasi').length} Dataset
              </span>
              <span>·</span>
              <span>IGA & Ekosistem Inovasi</span>
            </div>
          </div>

          <div
            onClick={() => {
              onSelectCategory('Sekretariat');
              setActiveTab('catalog');
            }}
            className="group cursor-pointer bg-white rounded-xl p-5 text-slate-800 shadow-md hover:shadow-xl transition-all border border-slate-200"
          >
            <div className="flex items-start justify-between">
              <div className="w-11 h-11 rounded-lg bg-emerald-50 text-emerald-700 flex items-center justify-center">
                <Building2 className="w-6 h-6" />
              </div>
              <span className="text-xs font-semibold text-emerald-700 flex items-center gap-1 group-hover:translate-x-0.5 transition-transform">
                Jelajahi <ArrowRight className="w-3.5 h-3.5" />
              </span>
            </div>
            <h3 className="text-base font-bold text-slate-900 mt-4 group-hover:text-emerald-700 transition-colors">
              Sekretariat BRIDA
            </h3>
            <p className="text-xs text-slate-600 mt-1 line-clamp-2 leading-relaxed">
              Statistik peneliti & SDM, perjanjian kerja sama (PKS), alokasi anggaran riset, serta modul SICAKAB.
            </p>
            <div className="mt-3 text-[11px] font-medium text-slate-500 flex items-center gap-2">
              <span className="text-emerald-700 font-semibold">
                {datasets.filter((d) => d.category === 'Sekretariat').length} Dataset
              </span>
              <span>·</span>
              <span>Tata Kelola & Kinerja</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};
