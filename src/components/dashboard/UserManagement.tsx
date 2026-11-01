import React, { useState } from 'react';
import { useApp } from '../../context/AppContext';
import { User, UserRole } from '../../types';
import {
  Users,
  UserPlus,
  KeyRound,
  Trash2,
  Edit2,
  Search,
  Shield,
  X,
  Check,
} from 'lucide-react';

export const UserManagement: React.FC = () => {
  const { users, currentUser, addUser, updateUser, deleteUser, notify } = useApp();
  const [search, setSearch] = useState('');
  const [roleFilter, setRoleFilter] = useState<string>('all');
  
  // Modal state
  const [modalOpen, setModalOpen] = useState(false);
  const [editingUser, setEditingUser] = useState<User | null>(null);
  
  // Form fields
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');
  const [role, setRole] = useState<UserRole>('produsen_data');
  const [divisi, setDivisi] = useState<'sekretariat' | 'inovasi' | 'litbang' | null>('sekretariat');

  const isReadOnly = currentUser?.role === 'pimpinan';

  const filteredUsers = users.filter((u) => {
    if (roleFilter !== 'all' && u.role !== roleFilter) return false;
    if (search.trim()) {
      const q = search.toLowerCase();
      return u.name.toLowerCase().includes(q) || u.email.toLowerCase().includes(q);
    }
    return true;
  });

  const handleOpenAdd = () => {
    setEditingUser(null);
    setName('');
    setEmail('');
    setRole('produsen_data');
    setDivisi('sekretariat');
    setModalOpen(true);
  };

  const handleOpenEdit = (user: User) => {
    setEditingUser(user);
    setName(user.name);
    setEmail(user.email);
    setRole(user.role);
    setDivisi(user.divisi || 'sekretariat');
    setModalOpen(true);
  };

  const handleSave = (e: React.FormEvent) => {
    e.preventDefault();
    if (!name.trim() || !email.trim()) return;

    if (editingUser) {
      updateUser(editingUser.id, {
        name,
        email,
        role,
        divisi: role === 'produsen_data' || role === 'produsen' ? divisi : null,
      });
    } else {
      addUser({
        name,
        email,
        role,
        divisi: role === 'produsen_data' || role === 'produsen' ? divisi : null,
      });
    }
    setModalOpen(false);
  };

  const handleResetPassword = (user: User) => {
    notify(`Kata sandi untuk ${user.name} (${user.email}) telah di-reset ke default: 123456`);
  };

  return (
    <div className="space-y-6">
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h2 className="text-xl font-bold text-slate-900 tracking-tight flex items-center gap-2">
            <Users className="w-5 h-5 text-[#004b87]" />
            Manajemen Pengguna & Hak Akses
          </h2>
          <p className="text-xs text-slate-500 mt-0.5">
            Kelola akun ASN, peran pengguna, dan penugasan divisi produsen data.
            {isReadOnly && ' (Mode Akses: Baca Saja untuk Pimpinan)'}
          </p>
        </div>

        {!isReadOnly && (
          <button
            onClick={handleOpenAdd}
            className="px-4 py-2 bg-[#004b87] hover:bg-[#003865] text-white rounded-lg text-xs font-semibold shadow-xs flex items-center gap-1.5 transition-colors self-start sm:self-auto"
          >
            <UserPlus className="w-4 h-4" />
            Tambah Pengguna Baru
          </button>
        )}
      </div>

      {/* Filter and Search Bar */}
      <div className="flex flex-col sm:flex-row gap-3 items-stretch sm:items-center justify-between">
        <div className="relative max-w-sm flex-1">
          <Search className="w-4 h-4 text-slate-400 absolute left-3 top-1/2 -translate-y-1/2" />
          <input
            type="text"
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            placeholder="Cari nama atau email pengguna..."
            className="w-full pl-9 pr-3 py-2 text-xs bg-white border border-slate-200 rounded-lg focus:outline-hidden focus:ring-2 focus:ring-[#004b87]"
          />
        </div>

        <div className="flex items-center gap-2 text-xs text-slate-600">
          <span>Filter Peran:</span>
          <select
            value={roleFilter}
            onChange={(e) => setRoleFilter(e.target.value)}
            className="bg-white border border-slate-200 text-slate-800 text-xs rounded-lg px-3 py-2 focus:outline-hidden focus:ring-2 focus:ring-[#004b87]"
          >
            <option value="all">Semua Peran</option>
            <option value="super_admin">Super Admin</option>
            <option value="verifikator">Verifikator</option>
            <option value="pimpinan">Pimpinan</option>
            <option value="produsen_data">Produsen Data</option>
          </select>
        </div>
      </div>

      {/* Users Table */}
      <div className="bg-white rounded-xl border border-slate-200 shadow-xs overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-left text-xs border-collapse">
            <thead className="bg-slate-50 text-slate-700 font-bold border-b border-slate-200">
              <tr>
                <th className="px-4 py-3">Nama Lengkap</th>
                <th className="px-4 py-3">Email Akun</th>
                <th className="px-4 py-3">Peran (Role)</th>
                <th className="px-4 py-3">Divisi / Bidang</th>
                <th className="px-4 py-3">Tanggal Dibuat</th>
                {!isReadOnly && <th className="px-4 py-3 text-right">Aksi</th>}
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100 text-slate-700">
              {filteredUsers.map((u) => (
                <tr key={u.id} className="hover:bg-slate-50/80 transition-colors">
                  <td className="px-4 py-3 font-semibold text-slate-900">{u.name}</td>
                  <td className="px-4 py-3 text-slate-600 font-mono text-[11px]">{u.email}</td>
                  <td className="px-4 py-3">
                    <span
                      className={`inline-block px-2.5 py-0.5 rounded text-[10px] font-bold uppercase tracking-wider ${
                        u.role === 'super_admin'
                          ? 'bg-purple-100 text-purple-800'
                          : u.role === 'verifikator'
                          ? 'bg-emerald-100 text-emerald-800'
                          : u.role === 'pimpinan'
                          ? 'bg-amber-100 text-amber-800'
                          : 'bg-blue-100 text-blue-800'
                      }`}
                    >
                      {u.role.replace('_', ' ')}
                    </span>
                  </td>
                  <td className="px-4 py-3 capitalize text-slate-600">
                    {u.divisi ? u.divisi : '-'}
                  </td>
                  <td className="px-4 py-3 text-slate-400 text-[11px] tabular-nums">
                    {u.created_at.substring(0, 10)}
                  </td>
                  {!isReadOnly && (
                    <td className="px-4 py-3 text-right">
                      <div className="flex items-center justify-end gap-1.5">
                        <button
                          onClick={() => handleResetPassword(u)}
                          className="p-1.5 text-slate-500 hover:text-amber-600 hover:bg-amber-50 rounded"
                          title="Reset Password ke default 123456"
                        >
                          <KeyRound className="w-3.5 h-3.5" />
                        </button>
                        <button
                          onClick={() => handleOpenEdit(u)}
                          className="p-1.5 text-slate-500 hover:text-blue-600 hover:bg-blue-50 rounded"
                          title="Ubah Profil Pengguna"
                        >
                          <Edit2 className="w-3.5 h-3.5" />
                        </button>
                        {u.id !== 1 && (
                          <button
                            onClick={() => deleteUser(u.id)}
                            className="p-1.5 text-slate-500 hover:text-red-600 hover:bg-red-50 rounded"
                            title="Hapus Akun Pengguna"
                          >
                            <Trash2 className="w-3.5 h-3.5" />
                          </button>
                        )}
                      </div>
                    </td>
                  )}
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>

      {/* Add / Edit Modal */}
      {modalOpen && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-900/60 backdrop-blur-xs">
          <div className="bg-white rounded-2xl max-w-md w-full border border-slate-200 shadow-2xl overflow-hidden animate-in fade-in zoom-in-95 duration-150">
            <div className="h-1.5 w-full bg-[#004b87]" />
            <div className="p-6">
              <div className="flex items-center justify-between pb-3 border-b border-slate-100">
                <h3 className="text-base font-bold text-slate-900">
                  {editingUser ? 'Ubah Informasi Pengguna' : 'Tambah Pengguna Baru'}
                </h3>
                <button
                  onClick={() => setModalOpen(false)}
                  className="p-1 text-slate-400 hover:text-slate-700 rounded"
                >
                  <X className="w-5 h-5" />
                </button>
              </div>

              <form onSubmit={handleSave} className="mt-4 space-y-3.5 text-xs">
                <div>
                  <label className="block font-semibold text-slate-700 mb-1">Nama Lengkap</label>
                  <input
                    type="text"
                    value={name}
                    onChange={(e) => setName(e.target.value)}
                    required
                    className="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-hidden focus:ring-2 focus:ring-[#004b87]"
                  />
                </div>

                <div>
                  <label className="block font-semibold text-slate-700 mb-1">Alamat Email</label>
                  <input
                    type="email"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    required
                    className="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-hidden focus:ring-2 focus:ring-[#004b87]"
                  />
                </div>

                <div>
                  <label className="block font-semibold text-slate-700 mb-1">Peran Akses (Role)</label>
                  <select
                    value={role}
                    onChange={(e) => setRole(e.target.value as UserRole)}
                    className="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-hidden focus:ring-2 focus:ring-[#004b87]"
                  >
                    <option value="super_admin">Super Admin (Akses Penuh)</option>
                    <option value="verifikator">Verifikator (Verifikasi & Evaluasi)</option>
                    <option value="produsen_data">Produsen Data (Sekretariat / Inovasi / Litbang)</option>
                    <option value="pimpinan">Pimpinan (Kepala BRIDA - Baca & Feedback)</option>
                  </select>
                </div>

                {(role === 'produsen_data' || role === 'produsen') && (
                  <div>
                    <label className="block font-semibold text-slate-700 mb-1">Divisi Pengampu</label>
                    <select
                      value={divisi || 'sekretariat'}
                      onChange={(e) => setDivisi(e.target.value as any)}
                      className="w-full px-3 py-2 bg-slate-50 border border-slate-200 rounded-lg focus:outline-hidden focus:ring-2 focus:ring-[#004b87]"
                    >
                      <option value="sekretariat">Sekretariat BRIDA</option>
                      <option value="inovasi">Bidang Invensi & Inovasi</option>
                      <option value="litbang">Bidang Litbangjirap</option>
                    </select>
                  </div>
                )}

                <div className="pt-3 border-t border-slate-100 flex justify-end gap-2">
                  <button
                    type="button"
                    onClick={() => setModalOpen(false)}
                    className="px-4 py-2 border border-slate-200 text-slate-600 rounded-lg font-semibold"
                  >
                    Batal
                  </button>
                  <button
                    type="submit"
                    className="px-4 py-2 bg-[#004b87] text-white rounded-lg font-bold shadow-xs hover:bg-[#003865]"
                  >
                    Simpan Akun
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};
