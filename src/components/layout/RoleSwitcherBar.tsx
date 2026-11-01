import React from 'react';
import { useApp } from '../../context/AppContext';
import { UserCheck, Shield, Award, Building2, Lightbulb, BookOpen, User, LogOut } from 'lucide-react';

export const RoleSwitcherBar: React.FC = () => {
  const { currentUser, switchRole, logout } = useApp();

  return (
    <div className="bg-slate-900 text-slate-200 text-xs border-b border-slate-800 px-4 py-2">
      <div className="max-w-7xl mx-auto flex flex-wrap items-center justify-between gap-3">
        <div className="flex items-center gap-2">
          <span className="font-semibold text-sky-400 flex items-center gap-1.5">
            <Shield className="w-3.5 h-3.5" />
            Simulasi Role / Hak Akses:
          </span>
          <span className="text-slate-400 hidden sm:inline">
            (Pilih peran untuk menguji antarmuka & hak akses):
          </span>
        </div>

        <div className="flex flex-wrap items-center gap-1.5">
          <button
            onClick={() => switchRole('publik')}
            className={`px-2.5 py-1 rounded text-xs font-medium transition-colors flex items-center gap-1 ${
              currentUser === null
                ? 'bg-sky-600 text-white shadow-sm'
                : 'bg-slate-800 text-slate-300 hover:bg-slate-700'
            }`}
          >
            <User className="w-3 h-3" />
            Publik
          </button>

          <button
            onClick={() => switchRole('super_admin')}
            className={`px-2.5 py-1 rounded text-xs font-medium transition-colors flex items-center gap-1 ${
              currentUser?.role === 'super_admin'
                ? 'bg-sky-600 text-white shadow-sm'
                : 'bg-slate-800 text-slate-300 hover:bg-slate-700'
            }`}
          >
            <Shield className="w-3 h-3" />
            Super Admin
          </button>

          <button
            onClick={() => switchRole('verifikator')}
            className={`px-2.5 py-1 rounded text-xs font-medium transition-colors flex items-center gap-1 ${
              currentUser?.role === 'verifikator'
                ? 'bg-sky-600 text-white shadow-sm'
                : 'bg-slate-800 text-slate-300 hover:bg-slate-700'
            }`}
          >
            <UserCheck className="w-3 h-3" />
            Verifikator
          </button>

          <button
            onClick={() => switchRole('pimpinan')}
            className={`px-2.5 py-1 rounded text-xs font-medium transition-colors flex items-center gap-1 ${
              currentUser?.role === 'pimpinan'
                ? 'bg-sky-600 text-white shadow-sm'
                : 'bg-slate-800 text-slate-300 hover:bg-slate-700'
            }`}
          >
            <Award className="w-3 h-3" />
            Pimpinan
          </button>

          <button
            onClick={() => switchRole('produsen_data', 'sekretariat')}
            className={`px-2.5 py-1 rounded text-xs font-medium transition-colors flex items-center gap-1 ${
              currentUser?.role === 'produsen_data' && currentUser.divisi === 'sekretariat'
                ? 'bg-sky-600 text-white shadow-sm'
                : 'bg-slate-800 text-slate-300 hover:bg-slate-700'
            }`}
          >
            <Building2 className="w-3 h-3" />
            Produsen: Sekretariat
          </button>

          <button
            onClick={() => switchRole('produsen_data', 'inovasi')}
            className={`px-2.5 py-1 rounded text-xs font-medium transition-colors flex items-center gap-1 ${
              currentUser?.role === 'produsen_data' && currentUser.divisi === 'inovasi'
                ? 'bg-sky-600 text-white shadow-sm'
                : 'bg-slate-800 text-slate-300 hover:bg-slate-700'
            }`}
          >
            <Lightbulb className="w-3 h-3" />
            Produsen: Inovasi
          </button>

          <button
            onClick={() => switchRole('produsen_data', 'litbang')}
            className={`px-2.5 py-1 rounded text-xs font-medium transition-colors flex items-center gap-1 ${
              currentUser?.role === 'produsen_data' && currentUser.divisi === 'litbang'
                ? 'bg-sky-600 text-white shadow-sm'
                : 'bg-slate-800 text-slate-300 hover:bg-slate-700'
            }`}
          >
            <BookOpen className="w-3 h-3" />
            Produsen: Litbang
          </button>

          {currentUser && (
            <button
              onClick={logout}
              title="Logout"
              className="px-2 py-1 bg-red-950/60 text-red-300 hover:bg-red-900 rounded transition-colors flex items-center gap-1 ml-1"
            >
              <LogOut className="w-3 h-3" />
              Keluar
            </button>
          )}
        </div>
      </div>
    </div>
  );
};
