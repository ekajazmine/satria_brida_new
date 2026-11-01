import React, { useState } from 'react';
import { useApp } from '../../context/AppContext';
import {
  Database,
  BarChart2,
  FileCheck2,
  BookOpen,
  LogIn,
  LayoutDashboard,
  Menu,
  X,
  Code2,
  Info,
} from 'lucide-react';

interface HeaderProps {
  onOpenLogin: () => void;
  onOpenGuide: () => void;
  onOpenApi: () => void;
}

export const Header: React.FC<HeaderProps> = ({ onOpenLogin, onOpenGuide, onOpenApi }) => {
  const { currentUser, activeTab, setActiveTab } = useApp();
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

  const handleNav = (tab: string) => {
    setActiveTab(tab);
    setMobileMenuOpen(false);
  };

  return (
    <header className="sticky top-0 z-40 bg-white border-b border-slate-200 shadow-xs">
      {/* Red & White Gov Header Ribbon */}
      <div className="h-1 w-full bg-linear-to-r from-red-600 via-red-500 to-white" />

      {/* Institutional Bar */}
      <div className="bg-slate-50 border-b border-slate-100 px-4 py-1.5 text-[11px] text-slate-600 hidden sm:block">
        <div className="max-w-7xl mx-auto flex items-center justify-between">
          <div className="flex items-center gap-2">
            <span className="font-semibold text-slate-800">PORTAL SATU DATA INDONESIA</span>
            <span>·</span>
            <span>Pemerintah Provinsi Jawa Timur</span>
            <span>·</span>
            <span>Badan Riset dan Inovasi Daerah (BRIDA)</span>
          </div>
          <div className="flex items-center gap-4 text-slate-500">
            <span>Standar Interoperabilitas Perpres No. 39/2019</span>
          </div>
        </div>
      </div>

      {/* Main Navigation Bar */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between h-18">
          {/* Brand Wordmark & Logo */}
          <div className="flex items-center gap-3">
            <button
              onClick={() => handleNav('home')}
              className="flex items-center gap-3 text-left focus:outline-hidden group"
            >
              <div className="w-10 h-10 rounded-lg bg-linear-to-br from-[#003566] to-[#00509d] flex items-center justify-center text-white shadow-xs group-hover:scale-105 transition-transform">
                <Database className="w-5 h-5 text-sky-300" />
              </div>
              <div>
                <div className="flex items-center gap-2">
                  <span className="text-xl font-extrabold text-[#003566] tracking-tight">
                    SATRIA <span className="text-[#0284c7]">BRIDA</span>
                  </span>
                  <span className="text-[10px] font-semibold uppercase tracking-wider bg-sky-100 text-[#004b87] px-2 py-0.5 rounded">
                    JATIM
                  </span>
                </div>
                <p className="text-[11px] text-slate-500 font-medium leading-none mt-0.5">
                  Satu Data Riset & Inovasi Daerah
                </p>
              </div>
            </button>
          </div>

          {/* Desktop Nav Links */}
          <nav className="hidden lg:flex items-center gap-1 font-medium text-sm text-slate-600">
            <button
              onClick={() => handleNav('home')}
              className={`px-3 py-2 rounded-md transition-colors ${
                activeTab === 'home'
                  ? 'text-[#004b87] font-semibold bg-sky-50'
                  : 'hover:text-slate-900 hover:bg-slate-50'
              }`}
            >
              Beranda
            </button>

            <button
              onClick={() => handleNav('catalog')}
              className={`px-3 py-2 rounded-md transition-colors ${
                activeTab === 'catalog'
                  ? 'text-[#004b87] font-semibold bg-sky-50'
                  : 'hover:text-slate-900 hover:bg-slate-50'
              }`}
            >
              Katalog Data
            </button>

            <button
              onClick={() => handleNav('stats')}
              className={`px-3 py-2 rounded-md transition-colors ${
                activeTab === 'stats'
                  ? 'text-[#004b87] font-semibold bg-sky-50'
                  : 'hover:text-slate-900 hover:bg-slate-50'
              }`}
            >
              <span className="flex items-center gap-1.5">
                <BarChart2 className="w-4 h-4 text-slate-500" />
                Statistik
              </span>
            </button>

            <button
              onClick={() => handleNav('sicakab')}
              className={`px-3 py-2 rounded-md transition-colors ${
                activeTab === 'sicakab'
                  ? 'text-[#004b87] font-semibold bg-sky-50'
                  : 'hover:text-slate-900 hover:bg-slate-50'
              }`}
            >
              <span className="flex items-center gap-1.5">
                <FileCheck2 className="w-4 h-4 text-emerald-600" />
                SICAKAB
              </span>
            </button>

            <button
              onClick={onOpenGuide}
              className="px-3 py-2 rounded-md text-slate-600 hover:text-slate-900 hover:bg-slate-50 transition-colors flex items-center gap-1.5"
            >
              <BookOpen className="w-4 h-4 text-slate-500" />
              Panduan
            </button>

            <button
              onClick={onOpenApi}
              className="px-3 py-2 rounded-md text-slate-600 hover:text-slate-900 hover:bg-slate-50 transition-colors flex items-center gap-1.5"
            >
              <Code2 className="w-4 h-4 text-slate-500" />
              API
            </button>

            <button
              onClick={() => handleNav('about')}
              className={`px-3 py-2 rounded-md transition-colors ${
                activeTab === 'about'
                  ? 'text-[#004b87] font-semibold bg-sky-50'
                  : 'hover:text-slate-900 hover:bg-slate-50'
              }`}
            >
              <span className="flex items-center gap-1.5">
                <Info className="w-4 h-4 text-slate-500" />
                Tentang
              </span>
            </button>
          </nav>

          {/* Right Action: Login / Dashboard Button */}
          <div className="hidden sm:flex items-center gap-3">
            {currentUser ? (
              <button
                onClick={() => handleNav('dashboard')}
                className="px-4 py-2 rounded-lg bg-[#004b87] hover:bg-[#003865] text-white text-xs font-semibold shadow-xs flex items-center gap-2 transition-colors"
              >
                <LayoutDashboard className="w-4 h-4" />
                Dashboard ({currentUser.role.replace('_', ' ')})
              </button>
            ) : (
              <button
                onClick={onOpenLogin}
                className="px-4 py-2 rounded-lg border border-[#004b87] text-[#004b87] hover:bg-sky-50 text-xs font-semibold transition-colors flex items-center gap-1.5"
              >
                <LogIn className="w-4 h-4" />
                Masuk / Login
              </button>
            )}
          </div>

          {/* Mobile hamburger button */}
          <div className="lg:hidden flex items-center gap-2">
            {currentUser && (
              <button
                onClick={() => handleNav('dashboard')}
                className="px-2.5 py-1.5 bg-[#004b87] text-white rounded text-xs font-medium"
              >
                Dashboard
              </button>
            )}
            <button
              onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
              className="p-2 rounded-md text-slate-600 hover:bg-slate-100"
            >
              {mobileMenuOpen ? <X className="w-6 h-6" /> : <Menu className="w-6 h-6" />}
            </button>
          </div>
        </div>
      </div>

      {/* Mobile Drawer Menu */}
      {mobileMenuOpen && (
        <div className="lg:hidden border-t border-slate-200 bg-white px-4 pt-2 pb-6 space-y-1">
          <button
            onClick={() => handleNav('home')}
            className="w-full text-left px-3 py-2 rounded-md text-sm font-medium text-slate-700 hover:bg-slate-100"
          >
            Beranda
          </button>
          <button
            onClick={() => handleNav('catalog')}
            className="w-full text-left px-3 py-2 rounded-md text-sm font-medium text-slate-700 hover:bg-slate-100"
          >
            Katalog Data
          </button>
          <button
            onClick={() => handleNav('stats')}
            className="w-full text-left px-3 py-2 rounded-md text-sm font-medium text-slate-700 hover:bg-slate-100"
          >
            Statistik BRIDA
          </button>
          <button
            onClick={() => handleNav('sicakab')}
            className="w-full text-left px-3 py-2 rounded-md text-sm font-medium text-slate-700 hover:bg-slate-100"
          >
            Modul SICAKAB
          </button>
          <button
            onClick={() => {
              onOpenGuide();
              setMobileMenuOpen(false);
            }}
            className="w-full text-left px-3 py-2 rounded-md text-sm font-medium text-slate-700 hover:bg-slate-100"
          >
            Buku Panduan (SOP)
          </button>
          <button
            onClick={() => {
              onOpenApi();
              setMobileMenuOpen(false);
            }}
            className="w-full text-left px-3 py-2 rounded-md text-sm font-medium text-slate-700 hover:bg-slate-100"
          >
            API Integrasi
          </button>
          <button
            onClick={() => handleNav('about')}
            className="w-full text-left px-3 py-2 rounded-md text-sm font-medium text-slate-700 hover:bg-slate-100"
          >
            Tentang SATRIA BRIDA
          </button>
          <div className="pt-3 border-t border-slate-100">
            {currentUser ? (
              <button
                onClick={() => handleNav('dashboard')}
                className="w-full py-2.5 bg-[#004b87] text-white rounded-md text-sm font-medium text-center"
              >
                Buka Dashboard
              </button>
            ) : (
              <button
                onClick={() => {
                  onOpenLogin();
                  setMobileMenuOpen(false);
                }}
                className="w-full py-2.5 border border-[#004b87] text-[#004b87] rounded-md text-sm font-medium text-center"
              >
                Masuk / Login
              </button>
            )}
          </div>
        </div>
      )}
    </header>
  );
};
