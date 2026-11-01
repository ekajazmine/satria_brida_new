import React, { createContext, useContext, useState, useEffect } from 'react';
import {
  User,
  Dataset,
  SicakabReport,
  SicakabTarget,
  DocumentDeadline,
  FeedbackItem,
  ActivityLog,
  DatasetStatus,
  UserRole,
} from '../types';
import {
  INITIAL_USERS,
  INITIAL_DATASETS,
  INITIAL_SICAKAB_REPORTS,
  INITIAL_SICAKAB_TARGETS,
  INITIAL_DEADLINES,
  INITIAL_FEEDBACKS,
  INITIAL_LOGS,
} from '../data/seedData';

interface PreviewModalState {
  isOpen: boolean;
  dataset?: Dataset;
  type?: 'csv' | 'pdf' | 'doc';
}

interface AppContextType {
  currentUser: User | null;
  users: User[];
  datasets: Dataset[];
  sicakabReports: SicakabReport[];
  sicakabTargets: SicakabTarget[];
  deadlines: DocumentDeadline[];
  feedbacks: FeedbackItem[];
  logs: ActivityLog[];
  notification: string | null;
  activeTab: string;
  selectedDatasetId: number | null;
  previewModal: PreviewModalState;
  
  // Navigation
  setActiveTab: (tab: string) => void;
  setSelectedDatasetId: (id: number | null) => void;
  openPreview: (dataset: Dataset, type?: 'csv' | 'pdf' | 'doc') => void;
  closePreview: () => void;
  notify: (msg: string) => void;
  
  // Auth
  login: (email: string) => boolean;
  logout: () => void;
  switchRole: (role: UserRole, divisi?: 'sekretariat' | 'inovasi' | 'litbang') => void;

  // Dataset actions
  addDataset: (dataset: Omit<Dataset, 'id' | 'created_at' | 'views_count' | 'downloads_count'>) => void;
  updateDataset: (id: number, updates: Partial<Dataset>) => void;
  deleteDataset: (id: number) => void;
  verifyDataset: (id: number, status: DatasetStatus, notes?: string) => void;

  // SICAKAB actions
  addSicakabReport: (report: Omit<SicakabReport, 'id'>) => void;
  updateSicakabReport: (id: number, updates: Partial<SicakabReport>) => void;
  deleteSicakabReport: (id: number) => void;
  evaluateSicakabReport: (id: number, hasil: string, rekomendasi: string, status: 'diverifikasi' | 'perlu_perbaikan') => void;
  submitTindakLanjut: (id: number, rencana: string, hasil: string) => void;

  // Target actions
  addSicakabTarget: (target: Omit<SicakabTarget, 'id'>) => void;
  deleteSicakabTarget: (id: number) => void;

  // Deadline actions
  addDeadline: (deadline: Omit<DocumentDeadline, 'id' | 'status'>) => void;
  deleteDeadline: (id: number) => void;

  // Feedback actions
  addFeedback: (datasetId: number, message: string) => void;
  replyFeedback: (feedbackId: number, replyText: string) => void;

  // User management
  addUser: (userData: Omit<User, 'id' | 'created_at'>) => void;
  updateUser: (id: number, updates: Partial<User>) => void;
  deleteUser: (id: number) => void;
}

const AppContext = createContext<AppContextType | undefined>(undefined);

export const AppProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  // Load from localStorage or seed
  const [users, setUsers] = useState<User[]>(() => {
    const saved = localStorage.getItem('sb_users');
    return saved ? JSON.parse(saved) : INITIAL_USERS;
  });

  const [currentUser, setCurrentUser] = useState<User | null>(() => {
    const saved = localStorage.getItem('sb_current_user');
    return saved ? JSON.parse(saved) : null; // Defaults to public guest
  });

  const [datasets, setDatasets] = useState<Dataset[]>(() => {
    const saved = localStorage.getItem('sb_datasets');
    return saved ? JSON.parse(saved) : INITIAL_DATASETS;
  });

  const [sicakabReports, setSicakabReports] = useState<SicakabReport[]>(() => {
    const saved = localStorage.getItem('sb_sicakab_reports');
    return saved ? JSON.parse(saved) : INITIAL_SICAKAB_REPORTS;
  });

  const [sicakabTargets, setSicakabTargets] = useState<SicakabTarget[]>(() => {
    const saved = localStorage.getItem('sb_sicakab_targets');
    return saved ? JSON.parse(saved) : INITIAL_SICAKAB_TARGETS;
  });

  const [deadlines, setDeadlines] = useState<DocumentDeadline[]>(() => {
    const saved = localStorage.getItem('sb_deadlines');
    return saved ? JSON.parse(saved) : INITIAL_DEADLINES;
  });

  const [feedbacks, setFeedbacks] = useState<FeedbackItem[]>(() => {
    const saved = localStorage.getItem('sb_feedbacks');
    return saved ? JSON.parse(saved) : INITIAL_FEEDBACKS;
  });

  const [logs, setLogs] = useState<ActivityLog[]>(() => {
    const saved = localStorage.getItem('sb_logs');
    return saved ? JSON.parse(saved) : INITIAL_LOGS;
  });

  const [notification, setNotification] = useState<string | null>(null);
  const [activeTab, setActiveTab] = useState<string>('home');
  const [selectedDatasetId, setSelectedDatasetId] = useState<number | null>(null);
  const [previewModal, setPreviewModal] = useState<PreviewModalState>({ isOpen: false });

  // Persistence
  useEffect(() => {
    localStorage.setItem('sb_users', JSON.stringify(users));
  }, [users]);
  useEffect(() => {
    localStorage.setItem('sb_current_user', JSON.stringify(currentUser));
  }, [currentUser]);
  useEffect(() => {
    localStorage.setItem('sb_datasets', JSON.stringify(datasets));
  }, [datasets]);
  useEffect(() => {
    localStorage.setItem('sb_sicakab_reports', JSON.stringify(sicakabReports));
  }, [sicakabReports]);
  useEffect(() => {
    localStorage.setItem('sb_sicakab_targets', JSON.stringify(sicakabTargets));
  }, [sicakabTargets]);
  useEffect(() => {
    localStorage.setItem('sb_deadlines', JSON.stringify(deadlines));
  }, [deadlines]);
  useEffect(() => {
    localStorage.setItem('sb_feedbacks', JSON.stringify(feedbacks));
  }, [feedbacks]);
  useEffect(() => {
    localStorage.setItem('sb_logs', JSON.stringify(logs));
  }, [logs]);

  const notify = (msg: string) => {
    setNotification(msg);
    setTimeout(() => {
      setNotification((curr) => (curr === msg ? null : curr));
    }, 4000);
  };

  const logActivity = (action: string, target: string) => {
    const newLog: ActivityLog = {
      id: Date.now(),
      user_name: currentUser?.name || 'Tamu Publik',
      action,
      target,
      timestamp: new Date().toISOString().replace('T', ' ').substring(0, 19),
      ip_address: '10.15.22.100',
    };
    setLogs((prev) => [newLog, ...prev]);
  };

  const login = (email: string) => {
    const user = users.find((u) => u.email.toLowerCase() === email.toLowerCase());
    if (user) {
      setCurrentUser(user);
      logActivity('LOGIN', `User ${user.email} masuk ke sistem`);
      notify(`Selamat datang, ${user.name} (${user.role.toUpperCase()})`);
      setActiveTab('dashboard');
      return true;
    }
    return false;
  };

  const logout = () => {
    if (currentUser) {
      logActivity('LOGOUT', `User ${currentUser.email} keluar dari sistem`);
    }
    setCurrentUser(null);
    notify('Anda telah keluar dari akun.');
    setActiveTab('home');
  };

  const switchRole = (role: UserRole, divisi?: 'sekretariat' | 'inovasi' | 'litbang') => {
    if (role === 'publik') {
      logout();
      return;
    }
    const matching = users.find(
      (u) => u.role === role && (!divisi || u.divisi === divisi)
    ) || {
      id: 99,
      name: `Simulasi ${role.toUpperCase()}`,
      email: `${role}@satria.local`,
      role,
      divisi: divisi || null,
      created_at: new Date().toISOString(),
    };
    setCurrentUser(matching);
    notify(`Beralih ke peran: ${matching.name} [${matching.role.toUpperCase()}]`);
    setActiveTab('dashboard');
  };

  const openPreview = (dataset: Dataset, type: 'csv' | 'pdf' | 'doc' = 'csv') => {
    setPreviewModal({ isOpen: true, dataset, type });
    // Increment view counter
    setDatasets((prev) =>
      prev.map((d) => (d.id === dataset.id ? { ...d, views_count: d.views_count + 1 } : d))
    );
  };

  const closePreview = () => {
    setPreviewModal({ isOpen: false });
  };

  const addDataset = (datasetData: Omit<Dataset, 'id' | 'created_at' | 'views_count' | 'downloads_count'>) => {
    const newId = Math.max(0, ...datasets.map((d) => d.id)) + 1;
    const newDataset: Dataset = {
      ...datasetData,
      id: newId,
      created_at: new Date().toISOString().replace('T', ' ').substring(0, 19),
      views_count: 0,
      downloads_count: 0,
      preview_data: datasetData.preview_data || {
        columns: ['No', 'Kolom 1', 'Kolom 2', 'Nilai'],
        rows: [
          [1, 'Data A', 'Keterangan A', 100],
          [2, 'Data B', 'Keterangan B', 250],
        ],
      },
    };
    setDatasets((prev) => [newDataset, ...prev]);
    logActivity('TAMBAH_DATASET', `Menambahkan dataset: ${newDataset.title}`);
    notify(`Dataset "${newDataset.title}" berhasil diajukan.`);
  };

  const updateDataset = (id: number, updates: Partial<Dataset>) => {
    setDatasets((prev) =>
      prev.map((d) => (d.id === id ? { ...d, ...updates, updated_at: new Date().toISOString() } : d))
    );
    logActivity('UPDATE_DATASET', `Memperbarui dataset ID ${id}`);
    notify('Perubahan dataset berhasil disimpan.');
  };

  const deleteDataset = (id: number) => {
    const target = datasets.find((d) => d.id === id);
    setDatasets((prev) => prev.filter((d) => d.id !== id));
    logActivity('HAPUS_DATASET', `Menghapus dataset: ${target?.title || id}`);
    notify('Dataset berhasil dihapus.');
  };

  const verifyDataset = (id: number, status: DatasetStatus, notes?: string) => {
    setDatasets((prev) =>
      prev.map((d) => (d.id === id ? { ...d, status, updated_at: new Date().toISOString() } : d))
    );
    const target = datasets.find((d) => d.id === id);
    if (notes && target) {
      addFeedback(id, `[Verifikator Catatan]: ${notes}`);
    }
    logActivity('VERIFIKASI', `Status dataset ${target?.title} diubah menjadi: ${status}`);
    notify(`Status dataset berhasil diubah menjadi "${status}".`);
  };

  const addSicakabReport = (reportData: Omit<SicakabReport, 'id'>) => {
    const newId = Math.max(0, ...sicakabReports.map((r) => r.id)) + 1;
    const newReport: SicakabReport = { ...reportData, id: newId };
    setSicakabReports((prev) => [newReport, ...prev]);
    logActivity('INPUT_SICAKAB', `Menginput capaian kinerja: ${newReport.indikator_kinerja}`);
    notify('Laporan capaian kinerja SICAKAB berhasil dikirim.');
  };

  const updateSicakabReport = (id: number, updates: Partial<SicakabReport>) => {
    setSicakabReports((prev) => prev.map((r) => (r.id === id ? { ...r, ...updates } : r)));
    logActivity('UPDATE_SICAKAB', `Memperbarui laporan SICAKAB ID ${id}`);
    notify('Laporan SICAKAB berhasil diperbarui.');
  };

  const deleteSicakabReport = (id: number) => {
    setSicakabReports((prev) => prev.filter((r) => r.id !== id));
    logActivity('HAPUS_SICAKAB', `Menghapus laporan SICAKAB ID ${id}`);
    notify('Laporan SICAKAB berhasil dihapus.');
  };

  const evaluateSicakabReport = (
    id: number,
    hasil: string,
    rekomendasi: string,
    status: 'diverifikasi' | 'perlu_perbaikan'
  ) => {
    setSicakabReports((prev) =>
      prev.map((r) =>
        r.id === id
          ? {
              ...r,
              status,
              evaluasi_hasil: hasil,
              evaluasi_rekomendasi: rekomendasi,
              evaluasi_by: currentUser?.name || 'Tim Verifikator',
              evaluasi_at: new Date().toISOString().replace('T', ' ').substring(0, 19),
            }
          : r
      )
    );
    logActivity('EVALUASI_SICAKAB', `Evaluasi SICAKAB ID ${id} (${status})`);
    notify(`Evaluasi berhasil disimpan dengan status "${status}".`);
  };

  const submitTindakLanjut = (id: number, rencana: string, hasil: string) => {
    setSicakabReports((prev) =>
      prev.map((r) =>
        r.id === id
          ? {
              ...r,
              tindak_lanjut_rencana: rencana,
              tindak_lanjut_hasil: hasil,
              status: 'menunggu_evaluasi',
            }
          : r
      )
    );
    logActivity('TINDAK_LANJUT_SICAKAB', `Mengirim tindak lanjut SICAKAB ID ${id}`);
    notify('Tindak lanjut berhasil dikirim ke verifikator.');
  };

  const addSicakabTarget = (targetData: Omit<SicakabTarget, 'id'>) => {
    const newId = Math.max(0, ...sicakabTargets.map((t) => t.id)) + 1;
    setSicakabTargets((prev) => [...prev, { ...targetData, id: newId }]);
    notify('Target kinerja baru berhasil ditetapkan.');
  };

  const deleteSicakabTarget = (id: number) => {
    setSicakabTargets((prev) => prev.filter((t) => t.id !== id));
    notify('Target kinerja berhasil dihapus.');
  };

  const addDeadline = (data: Omit<DocumentDeadline, 'id' | 'status'>) => {
    const newId = Math.max(0, ...deadlines.map((d) => d.id)) + 1;
    setDeadlines((prev) => [...prev, { ...data, id: newId, status: 'aktif' }]);
    notify('Tenggat waktu baru berhasil diumumkan.');
  };

  const deleteDeadline = (id: number) => {
    setDeadlines((prev) => prev.filter((d) => d.id !== id));
    notify('Tenggat berhasil dihapus.');
  };

  const addFeedback = (datasetId: number, message: string) => {
    const targetDataset = datasets.find((d) => d.id === datasetId);
    const newFeedback: FeedbackItem = {
      id: Date.now(),
      dataset_id: datasetId,
      dataset_title: targetDataset?.title || `Dataset #${datasetId}`,
      user_id: currentUser?.id || 0,
      user_name: currentUser?.name || 'Tamu Publik',
      user_role: currentUser?.role || 'publik',
      message,
      created_at: new Date().toISOString().replace('T', ' ').substring(0, 19),
      is_read: false,
    };
    setFeedbacks((prev) => [newFeedback, ...prev]);
    notify('Pesan masukan berhasil dikirim.');
  };

  const replyFeedback = (feedbackId: number, replyText: string) => {
    setFeedbacks((prev) =>
      prev.map((f) =>
        f.id === feedbackId
          ? {
              ...f,
              reply: replyText,
              reply_by: currentUser?.name || 'Admin',
              reply_at: new Date().toISOString().replace('T', ' ').substring(0, 19),
              is_read: true,
            }
          : f
      )
    );
    notify('Balasan berhasil dikirim.');
  };

  const addUser = (userData: Omit<User, 'id' | 'created_at'>) => {
    const newId = Math.max(0, ...users.map((u) => u.id)) + 1;
    setUsers((prev) => [
      ...prev,
      {
        ...userData,
        id: newId,
        created_at: new Date().toISOString().replace('T', ' ').substring(0, 19),
      },
    ]);
    notify(`Pengguna "${userData.name}" berhasil ditambahkan.`);
  };

  const updateUser = (id: number, updates: Partial<User>) => {
    setUsers((prev) => prev.map((u) => (u.id === id ? { ...u, ...updates } : u)));
    notify('Informasi pengguna berhasil diperbarui.');
  };

  const deleteUser = (id: number) => {
    setUsers((prev) => prev.filter((u) => u.id !== id));
    notify('Pengguna berhasil dinonaktifkan.');
  };

  return (
    <AppContext.Provider
      value={{
        currentUser,
        users,
        datasets,
        sicakabReports,
        sicakabTargets,
        deadlines,
        feedbacks,
        logs,
        notification,
        activeTab,
        selectedDatasetId,
        previewModal,
        setActiveTab,
        setSelectedDatasetId,
        openPreview,
        closePreview,
        notify,
        login,
        logout,
        switchRole,
        addDataset,
        updateDataset,
        deleteDataset,
        verifyDataset,
        addSicakabReport,
        updateSicakabReport,
        deleteSicakabReport,
        evaluateSicakabReport,
        submitTindakLanjut,
        addSicakabTarget,
        deleteSicakabTarget,
        addDeadline,
        deleteDeadline,
        addFeedback,
        replyFeedback,
        addUser,
        updateUser,
        deleteUser,
      }}
    >
      {children}
    </AppContext.Provider>
  );
};

export const useApp = () => {
  const context = useContext(AppContext);
  if (!context) throw new Error('useApp must be used within AppProvider');
  return context;
};
