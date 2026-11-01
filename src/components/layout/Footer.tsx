import React from 'react';
import { Database, MapPin, Mail, Phone, ExternalLink } from 'lucide-react';

export const Footer: React.FC = () => {
  return (
    <footer className="bg-[#00284d] text-slate-300 pt-12 pb-8 border-t border-slate-800">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-8 pb-10 border-b border-slate-700/60">
          {/* Col 1: Identity */}
          <div className="md:col-span-1 space-y-3">
            <div className="flex items-center gap-2.5">
              <div className="w-8 h-8 rounded-md bg-[#0284c7] flex items-center justify-center text-white">
                <Database className="w-4 h-4 text-white" />
              </div>
              <span className="text-lg font-bold text-white tracking-tight">
                SATRIA <span className="text-sky-400">BRIDA</span>
              </span>
            </div>
            <p className="text-xs text-slate-300 leading-relaxed">
              Sistem Satu Data Riset dan Inovasi Daerah (SATRIA BRIDA) Pemerintah Provinsi Jawa Timur.
              Mendukung perumusan kebijakan berbasis bukti (evidence-based policy).
            </p>
            <div className="pt-2 text-[11px] text-slate-400">
              <span className="inline-block px-2 py-0.5 rounded bg-slate-800 text-sky-300 border border-slate-700">
                Satu Data Indonesia Compliant
              </span>
            </div>
          </div>

          {/* Col 2: Struktur Bidang BRIDA */}
          <div className="space-y-3 text-xs">
            <h4 className="text-xs font-bold uppercase tracking-wider text-white">
              Produsen Data Internal
            </h4>
            <ul className="space-y-2 text-slate-300">
              <li>
                <span className="font-semibold text-white block">Sekretariat BRIDA</span>
                <span className="text-slate-400 text-[11px]">Kepegawaian, Umum, Keuangan, Program & Anggaran</span>
              </li>
              <li>
                <span className="font-semibold text-white block">Bidang Invensi & Inovasi</span>
                <span className="text-slate-400 text-[11px]">Inovasi Daerah (IGA), HKI/Paten, Diseminasi Riset</span>
              </li>
              <li>
                <span className="font-semibold text-white block">Bidang Litbangjirap</span>
                <span className="text-slate-400 text-[11px]">Penelitian, Pengembangan, Pengkajian & Penerapan</span>
              </li>
            </ul>
          </div>

          {/* Col 3: Modul & Layanan */}
          <div className="space-y-3 text-xs">
            <h4 className="text-xs font-bold uppercase tracking-wider text-white">
              Layanan & Standar
            </h4>
            <ul className="space-y-2 text-slate-300">
              <li>
                <a href="#katalog" className="hover:text-white transition-colors flex items-center gap-1.5">
                  Katalog Dataset Terbuka
                </a>
              </li>
              <li>
                <a href="#sicakab" className="hover:text-white transition-colors flex items-center gap-1.5">
                  Modul SICAKAB (Capaian Kinerja)
                </a>
              </li>
              <li>
                <a href="https://data.go.id" target="_blank" rel="noopener noreferrer" className="hover:text-white transition-colors flex items-center gap-1.5">
                  Portal Satu Data Indonesia <ExternalLink className="w-3 h-3 text-slate-400" />
                </a>
              </li>
              <li>
                <a href="https://jatimprov.go.id" target="_blank" rel="noopener noreferrer" className="hover:text-white transition-colors flex items-center gap-1.5">
                  Pemerintah Provinsi Jawa Timur <ExternalLink className="w-3 h-3 text-slate-400" />
                </a>
              </li>
            </ul>
          </div>

          {/* Col 4: Kontak & Alamat */}
          <div className="space-y-3 text-xs">
            <h4 className="text-xs font-bold uppercase tracking-wider text-white">
              Sekretariat BRIDA Jatim
            </h4>
            <div className="space-y-2 text-slate-300">
              <div className="flex items-start gap-2">
                <MapPin className="w-4 h-4 text-sky-400 shrink-0 mt-0.5" />
                <span>Jl. Gayung Kebonsari No. 56, Gayungan, Kota Surabaya, Jawa Timur 60235</span>
              </div>
              <div className="flex items-center gap-2">
                <Mail className="w-4 h-4 text-sky-400 shrink-0" />
                <span>brida@jatimprov.go.id</span>
              </div>
              <div className="flex items-center gap-2">
                <Phone className="w-4 h-4 text-sky-400 shrink-0" />
                <span>(031) 8290123 / 8290124</span>
              </div>
            </div>
          </div>
        </div>

        {/* Bottom Bar */}
        <div className="pt-6 flex flex-col sm:flex-row items-center justify-between text-[11px] text-slate-400 gap-3">
          <p>
            © 2026 Badan Riset dan Inovasi Daerah Provinsi Jawa Timur. Hak Cipta Dilindungi Undang-Undang.
          </p>
          <div className="flex items-center gap-4">
            <span>Standar Desain data.go.id</span>
            <span>·</span>
            <span>Kebijakan Privasi</span>
            <span>·</span>
            <span>Syarat & Ketentuan Data</span>
          </div>
        </div>
      </div>
    </footer>
  );
};
