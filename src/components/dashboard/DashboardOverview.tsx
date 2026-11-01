import React, { useState } from 'react';
import { useApp } from '../../context/AppContext';
import { VerifikatorWorkbench } from './VerifikatorWorkbench';
import { UserManagement } from './UserManagement';
import { AuditLogs } from './AuditLogs';
import { DeadlinesManager } from './DeadlinesManager';
import { DatasetFormModal } from './DatasetFormModal';
import { Dataset } from '../../types';
import {
  LayoutDashboard,
  Database,
  UserCheck,
  Users,
  History,
  Clock,
  Plus,
  FileCheck2,
  Edit,
  Trash2,
  FileSpreadsheet,
  AlertCircle,
  CheckCircle2,
  Building,
  Calendar,
} from 'lucide-react';

export const DashboardOverview: React.FC = () => {
  const { currentUser, datasets, deleteDataset, openPreview, sicakabReports, setActiveTab } = useApp();

  const role = currentUser?.role || 'publik';

  // Active section inside dashboard
  const [section, setSection] = useState<string>(() => {
    if (role === 'verifikator') return 'workbench';
    if (role === 'produsen_data' || role === 'produsen') return 'my_datasets';
    return 'overview';
  });

  const [formModalOpen, setFormModalOpen] = useState(false);
  const [datasetToEdit, setDatasetToEdit] = useState<Dataset | null>(null);

  // Filter datasets for producers
  const myDatasets = datasets.filter((d) => {
    if (role === 'super_admin' || role === 'pimpinan') return true;
    if (currentUser?.divisi) {
      return d.target_divisi === currentUser.divisi || d.category.toLowerCase().includes(currentUser.divisi.toLowerCase());
    }
    return true;
  });

  const handleEditDataset = (d: Dataset) => {
    setDatasetToEdit(d);
    setFormModalOpen(true);
  };

  const handleCreateDataset = () => {
    setDatasetToEdit(null);
    setFormModalOpen(true);
  };

  return (
    <div className="bg-slate-50 min-h-screen py-8">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 space-y-6">
        {/* User Welcome Banner */}
        <div className="bg-white rounded-2xl p-6 border border-slate-200 shadow-xs flex flex-col md:flex-row md:items-center justify-between gap-4">
          <div className="space-y-1">
            <div className="flex items-center gap-2">
              <span className="text-xs font-bold uppercase tracking-wider px-2.5 py-0.5 rounded-full bg-sky-100 text-[#004b87]">
                Peran: {role.replace('_', ' ').toUpperCase()}
              </span>
              {currentUser?.divisi && (
                <span className="text-xs font-semibold px-2.5 py-0.5 rounded-full bg-slate-100 text-slate-700 capitalize">
                  Divisi: {currentUser.divisi}
                </span>
              )}
            </div>
            <h1 className="text-2xl font-extrabold text-slate-900 tracking-tight">
              Dashboard Operasional SATRIA BRIDA
            </h1>
            <p className="text-xs text-slate-500">
              Selamat datang kembali, <strong>{currentUser?.name || 'Pengguna'}</strong> ({currentUser?.email}).
            </p>
          </div>

          {(role === 'super_admin' || role === 'produsen_data' || role === 'produsen') && (
            <button
              onClick={handleCreateDataset}
              className="px-4 py-2.5 bg-[#004b87] hover:bg-[#003865] text-white rounded-xl text-xs font-bold shadow-xs flex items-center gap-1.5 transition-colors self-start md:self-auto"
            >
              <Plus className="w-4 h-4" />
              Ajukan Dataset Baru
            </button>
          )}
        </div>

        {/* Dashboard Navigation Tabs */}
        <div className="bg-white rounded-xl p-1.5 border border-slate-200 shadow-xs flex items-center gap-1 overflow-x-auto text-xs font-semibold">
          {(role === 'super_admin' || role === 'pimpinan') && (
            <button
              onClick={() => setSection('overview')}
              className={`px-4 py-2 rounded-lg transition-colors flex items-center gap-1.5 whitespace-nowrap ${
                section === 'overview'
                  ? 'bg-[#004b87] text-white shadow-xs'
                  : 'text-slate-600 hover:text-slate-900 hover:bg-slate-50'
              }`}
            >
              <LayoutDashboard className="w-4 h-4" />
              Ringkasan Utama
            </button>
          )}

          {(role === 'super_admin' || role === 'produsen_data' || role === 'produsen') && (
            <button
              onClick={() => setSection('my_datasets')}
              className={`px-4 py-2 rounded-lg transition-colors flex items-center gap-1.5 whitespace-nowrap ${
                section === 'my_datasets'
                  ? 'bg-[#004b87] text-white shadow-xs'
                  : 'text-slate-600 hover:text-slate-900 hover:bg-slate-50'
              }`}
            >
              <Database className="w-4 h-4" />
              {role === 'super_admin' ? 'Manajemen Dataset' : 'Dataset Unit Kerja'}
            </button>
          )}

          {(role === 'super_admin' || role === 'verifikator') && (
            <button
              onClick={() => setSection('workbench')}
              className={`px-4 py-2 rounded-lg transition-colors flex items-center gap-1.5 whitespace-nowrap ${
                section === 'workbench'
                  ? 'bg-[#004b87] text-white shadow-xs'
                  : 'text-slate-600 hover:text-slate-900 hover:bg-slate-50'
              }`}
            >
              <UserCheck className="w-4 h-4" />
              Workbench Verifikator
              <span className="ml-1 px-1.5 py-0.2 rounded bg-amber-200 text-amber-900 text-[10px]">
                {datasets.filter((d) => d.status === 'waiting_for_verification').length}
              </span>
            </button>
          )}

          <button
            onClick={() => setActiveTab('sicakab')}
            className="px-4 py-2 rounded-lg text-slate-600 hover:text-slate-900 hover:bg-slate-50 transition-colors flex items-center gap-1.5 whitespace-nowrap"
          >
            <FileCheck2 className="w-4 h-4 text-emerald-600" />
            Modul SICAKAB
          </button>

          {(role === 'super_admin' || role === 'pimpinan') && (
            <button
              onClick={() => setSection('users')}
              className={`px-4 py-2 rounded-lg transition-colors flex items-center gap-1.5 whitespace-nowrap ${
                section === 'users'
                  ? 'bg-[#004b87] text-white shadow-xs'
                  : 'text-slate-600 hover:text-slate-900 hover:bg-slate-50'
              }`}
            >
              <Users className="w-4 h-4" />
              Pengguna & Role
            </button>
          )}

          {role === 'super_admin' && (
            <>
              <button
                onClick={() => setSection('deadlines')}
                className={`px-4 py-2 rounded-lg transition-colors flex items-center gap-1.5 whitespace-nowrap ${
                  section === 'deadlines'
                    ? 'bg-[#004b87] text-white shadow-xs'
                    : 'text-slate-600 hover:text-slate-900 hover:bg-slate-50'
                }`}
              >
                <Clock className="w-4 h-4" />
                Tenggat Pelaporan
              </button>

              <button
                onClick={() => setSection('logs')}
                className={`px-4 py-2 rounded-lg transition-colors flex items-center gap-1.5 whitespace-nowrap ${
                  section === 'logs'
                    ? 'bg-[#004b87] text-white shadow-xs'
                    : 'text-slate-600 hover:text-slate-900 hover:bg-slate-50'
                }`}
              >
                <History className="w-4 h-4" />
                Audit Trail
              </button>
            </>
          )}
        </div>

        {/* SECTION: Overview (For Super Admin / Pimpinan) */}
        {section === 'overview' && (
          <div className="space-y-6">
            {/* 4 Stat Cards */}
            <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
              <div className="bg-white p-5 rounded-xl border border-slate-200 shadow-xs">
                <span className="text-xs text-slate-500 font-semibold block">Total Dataset</span>
                <div className="text-2xl font-bold text-slate-900 mt-1 tabular-nums">
                  {datasets.length}
                </div>
                <div className="text-[11px] text-emerald-600 mt-1">
                  {datasets.filter((d) => d.status === 'published' || d.status === 'approved').length} disetujui
                </div>
              </div>

              <div className="bg-white p-5 rounded-xl border border-slate-200 shadow-xs">
                <span className="text-xs text-slate-500 font-semibold block">Menunggu Verifikasi</span>
                <div className="text-2xl font-bold text-amber-600 mt-1 tabular-nums">
                  {datasets.filter((d) => d.status === 'waiting_for_verification').length}
                </div>
                <div className="text-[11px] text-slate-400 mt-1">Memerlukan pemeriksaan verifikator</div>
              </div>

              <div className="bg-white p-5 rounded-xl border border-slate-200 shadow-xs">
                <span className="text-xs text-slate-500 font-semibold block">Perlu Revisi Produsen</span>
                <div className="text-2xl font-bold text-rose-600 mt-1 tabular-nums">
                  {datasets.filter((d) => d.status === 'waiting_for_revision').length}
                </div>
                <div className="text-[11px] text-slate-400 mt-1">Menunggu perbaikan kolom/metadata</div>
              </div>

              <div className="bg-white p-5 rounded-xl border border-slate-200 shadow-xs">
                <span className="text-xs text-slate-500 font-semibold block">Laporan SICAKAB</span>
                <div className="text-2xl font-bold text-[#004b87] mt-1 tabular-nums">
                  {sicakabReports.length}
                </div>
                <div className="text-[11px] text-slate-400 mt-1">Triwulan I - IV 2026</div>
              </div>
            </div>

            {/* Recent Datasets Table */}
            <div className="bg-white rounded-xl border border-slate-200 shadow-xs p-5 space-y-4">
              <div className="flex items-center justify-between pb-3 border-b border-slate-100">
                <h3 className="text-sm font-bold text-slate-900">
                  Dataset Terbaru yang Masuk ke Sistem
                </h3>
                <button
                  onClick={() => setSection('my_datasets')}
                  className="text-xs font-bold text-[#004b87] hover:underline"
                >
                  Kelola Semua Dataset
                </button>
              </div>

              <div className="divide-y divide-slate-100 text-xs">
                {datasets.slice(0, 5).map((d) => (
                  <div key={d.id} className="py-3 flex items-center justify-between gap-4">
                    <div className="space-y-0.5">
                      <span className="font-semibold text-slate-800 text-sm block">{d.title}</span>
                      <span className="text-slate-400 text-[11px]">
                        {d.category} · {d.agency} · Tahun {d.year}
                      </span>
                    </div>

                    <div className="flex items-center gap-3 shrink-0">
                      <span
                        className={`px-2 py-0.5 rounded text-[10px] font-bold uppercase ${
                          d.status === 'published' || d.status === 'approved'
                            ? 'bg-emerald-100 text-emerald-800'
                            : d.status === 'waiting_for_revision'
                            ? 'bg-rose-100 text-rose-800'
                            : 'bg-amber-100 text-amber-800'
                        }`}
                      >
                        {d.status.replace('_', ' ')}
                      </span>
                      <button
                        onClick={() => openPreview(d, 'csv')}
                        className="px-2.5 py-1 rounded bg-slate-100 hover:bg-slate-200 text-slate-700 font-medium"
                      >
                        Pratinjau
                      </button>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </div>
        )}

        {/* SECTION: My Datasets / Dataset Management */}
        {section === 'my_datasets' && (
          <div className="space-y-6">
            <div className="flex items-center justify-between">
              <div>
                <h2 className="text-xl font-bold text-slate-900">
                  {role === 'super_admin' ? 'Katalog Seluruh Dataset BRIDA' : 'Dataset Unit Pengampu'}
                </h2>
                <p className="text-xs text-slate-500 mt-0.5">
                  Daftar kumpulan data yang diajukan ke portal Satu Data Indonesia.
                </p>
              </div>

              <button
                onClick={handleCreateDataset}
                className="px-4 py-2 bg-[#004b87] hover:bg-[#003865] text-white rounded-lg text-xs font-semibold flex items-center gap-1.5"
              >
                <Plus className="w-4 h-4" />
                Tambah Dataset
              </button>
            </div>

            <div className="bg-white rounded-xl border border-slate-200 shadow-xs overflow-hidden">
              <div className="overflow-x-auto">
                <table className="w-full text-left text-xs border-collapse">
                  <thead className="bg-slate-50 text-slate-700 font-bold border-b border-slate-200">
                    <tr>
                      <th className="px-4 py-3">Judul Dataset</th>
                      <th className="px-4 py-3">Bidang / Kategori</th>
                      <th className="px-4 py-3">Tahun</th>
                      <th className="px-4 py-3">Status Verifikasi</th>
                      <th className="px-4 py-3">Akses</th>
                      <th className="px-4 py-3 text-right">Aksi</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-slate-100 text-slate-700">
                    {myDatasets.map((d) => (
                      <tr key={d.id} className="hover:bg-slate-50 transition-colors">
                        <td className="px-4 py-3 font-semibold text-slate-900 max-w-xs truncate">
                          {d.title}
                        </td>
                        <td className="px-4 py-3 text-slate-600">{d.category}</td>
                        <td className="px-4 py-3 tabular-nums">{d.year}</td>
                        <td className="px-4 py-3">
                          <span
                            className={`inline-block px-2.5 py-0.5 rounded text-[10px] font-bold uppercase tracking-wider ${
                              d.status === 'published' || d.status === 'approved'
                                ? 'bg-emerald-100 text-emerald-800'
                                : d.status === 'waiting_for_revision'
                                ? 'bg-rose-100 text-rose-800'
                                : 'bg-amber-100 text-amber-800'
                            }`}
                          >
                            {d.status.replace('_', ' ')}
                          </span>
                        </td>
                        <td className="px-4 py-3 tabular-nums text-slate-500">
                          {d.views_count} lihat · {d.downloads_count} unduh
                        </td>
                        <td className="px-4 py-3 text-right">
                          <div className="flex items-center justify-end gap-1.5">
                            <button
                              onClick={() => openPreview(d, 'csv')}
                              className="p-1.5 text-slate-500 hover:text-emerald-700 hover:bg-emerald-50 rounded"
                              title="Pratinjau Lembar Kerja CSV"
                            >
                              <FileSpreadsheet className="w-4 h-4 text-emerald-600" />
                            </button>
                            <button
                              onClick={() => handleEditDataset(d)}
                              className="p-1.5 text-slate-500 hover:text-blue-700 hover:bg-blue-50 rounded"
                              title="Ubah Dataset"
                            >
                              <Edit className="w-4 h-4" />
                            </button>
                            {role === 'super_admin' && (
                              <button
                                onClick={() => deleteDataset(d.id)}
                                className="p-1.5 text-slate-500 hover:text-red-700 hover:bg-red-50 rounded"
                                title="Hapus Dataset"
                              >
                                <Trash2 className="w-4 h-4" />
                              </button>
                            )}
                          </div>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        )}

        {/* SECTION: Verifikator Workbench */}
        {section === 'workbench' && <VerifikatorWorkbench />}

        {/* SECTION: User Management */}
        {section === 'users' && <UserManagement />}

        {/* SECTION: Deadlines */}
        {section === 'deadlines' && <DeadlinesManager />}

        {/* SECTION: Audit Logs */}
        {section === 'logs' && <AuditLogs />}
      </div>

      {/* Dataset Form Modal */}
      <DatasetFormModal
        isOpen={formModalOpen}
        onClose={() => setFormModalOpen(false)}
        datasetToEdit={datasetToEdit}
      />
    </div>
  );
};
