import React, { useState } from 'react';
import { useApp } from '../../context/AppContext';
import { X, Lock, Mail, Shield, UserCheck, Award, Building2, Lightbulb, BookOpen, AlertCircle } from 'lucide-react';

interface LoginModalProps {
  isOpen: boolean;
  onClose: () => void;
}

export const LoginModal: React.FC<LoginModalProps> = ({ isOpen, onClose }) => {
  const { login } = useApp();
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('123456');
  const [error, setError] = useState<string | null>(null);

  if (!isOpen) return null;

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    setError(null);
    const success = login(email);
    if (success) {
      onClose();
    } else {
      setError('Email pengguna tidak terdaftar. Gunakan opsi akun pengujian di bawah.');
    }
  };

  const handleQuickLogin = (userEmail: string) => {
    setEmail(userEmail);
    const success = login(userEmail);
    if (success) {
      onClose();
    }
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-900/60 backdrop-blur-xs">
      <div className="bg-white rounded-2xl max-w-md w-full border border-slate-200 shadow-2xl overflow-hidden animate-in fade-in zoom-in-95 duration-150">
        {/* Red & White Ribbon */}
        <div className="h-1.5 w-full bg-linear-to-r from-red-600 via-red-500 to-white" />

        <div className="p-6">
          <div className="flex items-center justify-between pb-4 border-b border-slate-100">
            <div>
              <h3 className="text-base font-bold text-slate-900">
                Masuk ke Portal SATRIA BRIDA
              </h3>
              <p className="text-xs text-slate-500">
                Layanan Otentikasi Terpadu Satu Data Indonesia
              </p>
            </div>
            <button
              onClick={onClose}
              className="p-1 rounded-lg text-slate-400 hover:text-slate-700 hover:bg-slate-100 transition-colors"
            >
              <X className="w-5 h-5" />
            </button>
          </div>

          {error && (
            <div className="my-3 p-3 bg-rose-50 border border-rose-200 text-rose-700 text-xs rounded-lg flex items-start gap-2">
              <AlertCircle className="w-4 h-4 shrink-0 mt-0.5" />
              <span>{error}</span>
            </div>
          )}

          {/* Form */}
          <form onSubmit={handleSubmit} className="mt-4 space-y-3.5">
            <div>
              <label className="block text-xs font-semibold text-slate-700 mb-1">
                Alamat Email Pengguna / ASN
              </label>
              <div className="relative">
                <Mail className="w-4 h-4 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2" />
                <input
                  type="email"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  placeholder="nama@satria.local"
                  required
                  className="w-full pl-9 pr-3 py-2 text-xs bg-slate-50 border border-slate-200 rounded-lg focus:outline-hidden focus:ring-2 focus:ring-[#004b87] focus:bg-white transition-all"
                />
              </div>
            </div>

            <div>
              <label className="block text-xs font-semibold text-slate-700 mb-1">
                Kata Sandi (Default: 123456)
              </label>
              <div className="relative">
                <Lock className="w-4 h-4 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2" />
                <input
                  type="password"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  placeholder="••••••••"
                  required
                  className="w-full pl-9 pr-3 py-2 text-xs bg-slate-50 border border-slate-200 rounded-lg focus:outline-hidden focus:ring-2 focus:ring-[#004b87] focus:bg-white transition-all font-mono"
                />
              </div>
            </div>

            <button
              type="submit"
              className="w-full py-2.5 bg-[#004b87] hover:bg-[#003865] text-white rounded-lg text-xs font-bold tracking-wide transition-colors shadow-xs"
            >
              Masuk ke Akun
            </button>
          </form>

          {/* 1-Click Quick Testing Accounts */}
          <div className="mt-6 pt-4 border-t border-slate-100 space-y-2.5">
            <span className="text-[11px] font-bold uppercase tracking-wider text-slate-400 block">
              Akses Cepat Pengujian (1-Klik):
            </span>

            <div className="grid grid-cols-2 gap-2 text-xs">
              <button
                type="button"
                onClick={() => handleQuickLogin('admin@satria.local')}
                className="p-2 text-left bg-slate-50 hover:bg-sky-50 border border-slate-200 rounded-lg transition-colors group"
              >
                <div className="flex items-center gap-1.5 text-xs font-bold text-slate-900 group-hover:text-[#004b87]">
                  <Shield className="w-3.5 h-3.5 text-sky-600" />
                  Super Admin
                </div>
                <div className="text-[10px] text-slate-500 truncate">admin@satria.local</div>
              </button>

              <button
                type="button"
                onClick={() => handleQuickLogin('verifikator@satria.local')}
                className="p-2 text-left bg-slate-50 hover:bg-sky-50 border border-slate-200 rounded-lg transition-colors group"
              >
                <div className="flex items-center gap-1.5 text-xs font-bold text-slate-900 group-hover:text-[#004b87]">
                  <UserCheck className="w-3.5 h-3.5 text-emerald-600" />
                  Verifikator Data
                </div>
                <div className="text-[10px] text-slate-500 truncate">verifikator@satria.local</div>
              </button>

              <button
                type="button"
                onClick={() => handleQuickLogin('pimpinan@satria.local')}
                className="p-2 text-left bg-slate-50 hover:bg-sky-50 border border-slate-200 rounded-lg transition-colors group"
              >
                <div className="flex items-center gap-1.5 text-xs font-bold text-slate-900 group-hover:text-[#004b87]">
                  <Award className="w-3.5 h-3.5 text-amber-600" />
                  Kepala BRIDA
                </div>
                <div className="text-[10px] text-slate-500 truncate">pimpinan@satria.local</div>
              </button>

              <button
                type="button"
                onClick={() => handleQuickLogin('sekretariat@satria.local')}
                className="p-2 text-left bg-slate-50 hover:bg-sky-50 border border-slate-200 rounded-lg transition-colors group"
              >
                <div className="flex items-center gap-1.5 text-xs font-bold text-slate-900 group-hover:text-[#004b87]">
                  <Building2 className="w-3.5 h-3.5 text-blue-600" />
                  Sekretariat
                </div>
                <div className="text-[10px] text-slate-500 truncate">sekretariat@satria.local</div>
              </button>

              <button
                type="button"
                onClick={() => handleQuickLogin('inovasi@satria.local')}
                className="p-2 text-left bg-slate-50 hover:bg-sky-50 border border-slate-200 rounded-lg transition-colors group"
              >
                <div className="flex items-center gap-1.5 text-xs font-bold text-slate-900 group-hover:text-[#004b87]">
                  <Lightbulb className="w-3.5 h-3.5 text-amber-600" />
                  Invensi & Inovasi
                </div>
                <div className="text-[10px] text-slate-500 truncate">inovasi@satria.local</div>
              </button>

              <button
                type="button"
                onClick={() => handleQuickLogin('litbang@satria.local')}
                className="p-2 text-left bg-slate-50 hover:bg-sky-50 border border-slate-200 rounded-lg transition-colors group"
              >
                <div className="flex items-center gap-1.5 text-xs font-bold text-slate-900 group-hover:text-[#004b87]">
                  <BookOpen className="w-3.5 h-3.5 text-purple-600" />
                  Litbangjirap
                </div>
                <div className="text-[10px] text-slate-500 truncate">litbang@satria.local</div>
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};
