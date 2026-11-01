import React, { useState } from 'react';
import { AppProvider, useApp } from './context/AppContext';
import { RoleSwitcherBar } from './components/layout/RoleSwitcherBar';
import { Header } from './components/layout/Header';
import { Footer } from './components/layout/Footer';
import { HeroSection } from './components/public/HeroSection';
import { CatalogSection } from './components/public/CatalogSection';
import { DatasetDetail } from './components/public/DatasetDetail';
import { StatisticsSection } from './components/public/StatisticsSection';
import { AboutSection } from './components/public/AboutSection';
import { DashboardOverview } from './components/dashboard/DashboardOverview';
import { SicakabPortal } from './components/sicakab/SicakabPortal';
import { LoginModal } from './components/auth/LoginModal';
import { GuideBookModal } from './components/modals/GuideBookModal';
import { ApiIntegrationModal } from './components/modals/ApiIntegrationModal';
import { DataPreviewModal } from './components/modals/DataPreviewModal';
import { CheckCircle2, AlertCircle } from 'lucide-react';

const MainApp: React.FC = () => {
  const {
    activeTab,
    setActiveTab,
    selectedDatasetId,
    setSelectedDatasetId,
    notification,
  } = useApp();

  const [loginModalOpen, setLoginModalOpen] = useState(false);
  const [guideModalOpen, setGuideModalOpen] = useState(false);
  const [apiModalOpen, setApiModalOpen] = useState(false);

  const [heroSearchQuery, setHeroSearchQuery] = useState('');
  const [heroCategoryFilter, setHeroCategoryFilter] = useState('Semua');

  const handleHeroSearch = (query: string) => {
    setHeroSearchQuery(query);
  };

  const handleHeroSelectCategory = (cat: string) => {
    setHeroCategoryFilter(cat);
  };

  const handleSelectDataset = (id: number) => {
    setSelectedDatasetId(id);
    setActiveTab('catalog');
  };

  const handleBackToCatalog = () => {
    setSelectedDatasetId(null);
  };

  return (
    <div className="min-h-screen flex flex-col bg-slate-50 text-slate-800">
      {/* Simulation Top Bar */}
      <RoleSwitcherBar />

      {/* Main Government Header */}
      <Header
        onOpenLogin={() => setLoginModalOpen(true)}
        onOpenGuide={() => setGuideModalOpen(true)}
        onOpenApi={() => setApiModalOpen(true)}
      />

      {/* Notification Toast */}
      {notification && (
        <div className="fixed bottom-6 right-6 z-50 animate-in fade-in slide-in-from-bottom-4 duration-200">
          <div className="bg-slate-900 text-white px-4 py-3 rounded-xl shadow-xl flex items-center gap-3 border border-slate-700 text-xs font-medium">
            <CheckCircle2 className="w-4 h-4 text-emerald-400 shrink-0" />
            <span>{notification}</span>
          </div>
        </div>
      )}

      {/* Main View Router */}
      <main className="flex-1">
        {activeTab === 'home' && (
          <>
            <HeroSection
              onSearch={handleHeroSearch}
              onSelectCategory={handleHeroSelectCategory}
            />
            {/* Featured Datasets Showcase on Home */}
            <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
              <CatalogSection
                initialCategory={heroCategoryFilter}
                initialSearch={heroSearchQuery}
                onSelectDataset={handleSelectDataset}
              />
            </div>
          </>
        )}

        {activeTab === 'catalog' && (
          <>
            {selectedDatasetId ? (
              <DatasetDetail datasetId={selectedDatasetId} onBack={handleBackToCatalog} />
            ) : (
              <CatalogSection
                initialCategory={heroCategoryFilter}
                initialSearch={heroSearchQuery}
                onSelectDataset={handleSelectDataset}
              />
            )}
          </>
        )}

        {activeTab === 'stats' && <StatisticsSection />}

        {activeTab === 'sicakab' && <SicakabPortal />}

        {activeTab === 'about' && <AboutSection />}

        {activeTab === 'dashboard' && <DashboardOverview />}
      </main>

      {/* Footer */}
      <Footer />

      {/* Global Modals */}
      <LoginModal isOpen={loginModalOpen} onClose={() => setLoginModalOpen(false)} />
      <GuideBookModal isOpen={guideModalOpen} onClose={() => setGuideModalOpen(false)} />
      <ApiIntegrationModal isOpen={apiModalOpen} onClose={() => setApiModalOpen(false)} />
      <DataPreviewModal />
    </div>
  );
};

export default function App() {
  return (
    <AppProvider>
      <MainApp />
    </AppProvider>
  );
}
