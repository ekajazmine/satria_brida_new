-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Aug 28, 2026 at 12:05 PM
-- Server version: 10.4.34-MariaDB-1:10.4.34+maria~ubu2004
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `satria_brida`
--

-- --------------------------------------------------------

--
-- Table structure for table `datasets`
--

CREATE TABLE `datasets` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `category` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `agency` varchar(150) DEFAULT NULL,
  `researcher` varchar(150) DEFAULT NULL,
  `location` varchar(150) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `metadata_path` varchar(255) DEFAULT NULL,
  `pdf_path` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `target_divisi` enum('sekretariat','inovasi','litbang') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(30) DEFAULT 'pending',
  `category_id` int(11) DEFAULT NULL,
  `jenis_data` varchar(50) DEFAULT NULL,
  `tahun_data` int(11) DEFAULT NULL,
  `instansi` varchar(150) DEFAULT NULL,
  `frekuensi_update` varchar(50) DEFAULT NULL,
  `tanggal_update` date DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `metric_type` varchar(50) DEFAULT NULL,
  `metric_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `datasets`
--

INSERT INTO `datasets` (`id`, `title`, `category`, `description`, `year`, `agency`, `researcher`, `location`, `file_path`, `metadata_path`, `pdf_path`, `user_id`, `target_divisi`, `created_at`, `updated_at`, `status`, `category_id`, `jenis_data`, `tahun_data`, `instansi`, `frekuensi_update`, `tanggal_update`, `deskripsi`, `metric_type`, `metric_value`) VALUES
(4, 'Policy Paper', 'Litbangjirap', 'Data penelitian yang berkaitan dengan kebijakan daerah', 2025, 'BRIDA Jawa Timur', 'LITBANGJIRAP', 'Jawa Timur', '16._riset_kebijakan_1773695760.csv', '1783924580_BRIDA-LITBANGJIRAP-03-2025_RISET_KEBIJAKAN.doc', '1787127420_BRIDA-LITBANGJIRAP-03-2025_RISET_KEBIJAKAN.pdf', 10, NULL, '2026-03-16 21:08:01', '2026-08-20 07:43:17', 'approved', NULL, 'Dataset Statistik', 2025, 'BRIDA Jawa Timur', 'Tahunan', NULL, 'Data penelitian yang berkaitan dengan kebijakan daerah', NULL, NULL),
(5, 'Sosialisasi dan Diseminasi', 'Invensi Inovasi', 'Data kegiatan sosialisasi dan diseminasi hasil riset dan inovasi', 2025, 'BRIDA Jawa Timur', 'Invensi dan Inovasi', 'Jawa Timur', '1787128052_DATASET-BRIDA-INVENSIINOVASI-02-2025.csv', '1787128052_BRIDA-INVENSIINOVASI-02-2025_SOSIALISASI_DAN_DISEMINASI.doc', '1787128052_BRIDA-INVENSIINOVASI-02-2025_SOSIALISASI_DAN_DISEMINASI.pdf', 8, NULL, '2026-03-16 21:08:08', NULL, 'published', NULL, 'Dataset Statistik', 2025, 'BRIDA Jawa Timur', 'Tahunan', NULL, 'Data kegiatan sosialisasi dan diseminasi hasil riset dan inovasi', 'kegiatan', 1),
(7, 'Apresiasi Riset dan Inovasi', 'Invensi Inovasi', 'Data penghargaan atau apresiasi terhadap kegiatan riset dan inovasi', 2025, 'BRIDA Jawa Timur', 'BRIDA Jatim', 'Jawa Timur', '2._apresiasi_riset_dan_inovasi_1773696144.csv', NULL, NULL, 8, NULL, '2026-03-16 21:08:20', NULL, 'published', NULL, 'Dataset Statistik', 2025, 'BRIDA Jawa Timur', 'Tahunan', NULL, 'Data penghargaan atau apresiasi terhadap kegiatan riset dan inovasi', NULL, NULL),
(9, 'Perangkat Lunak', 'Invensi Inovasi', 'Data perangkat lunak yang dihasilkan dari kegiatan riset dan inovasi', 2025, 'BRIDA Jawa Timur', 'Invensi dan Inovasi', 'Surabaya, Jawa Timur', '1787130429_DATASET-BRIDA-INVENSIINOVASI-07-2025.csv', '1787130429_BRIDA-INVENSIINOVASI-07-2025_PERANGKAT_LUNAK.doc', '1787130430_BRIDA-INVENSIINOVASI-07-2025_PERANGKAT_LUNAK.pdf', 8, NULL, '2026-03-16 21:08:33', '2026-08-20 07:43:25', 'approved', NULL, 'Dataset Statistik', 2025, 'BRIDA Jawa Timur', 'Tahunan', NULL, 'Data perangkat lunak yang dihasilkan dari kegiatan riset dan inovasi', 'perangkat_lunak', 2),
(11, 'Jumlah Peneliti Berdasarkan Jenis Kelamin', 'Invensi Inovasi', 'Data jumlah peneliti berdasarkan jenis kelamin', 2025, 'BRIDA Jawa Timur', 'Sub Bagian Umum dan Kepegawaian', 'Jawa Timur', '9._jumlah_peneliti_di_jawa_timu_1773696188.csv', '1783923947_BRIDA-KEPEGAWAIAN-01-2025_JUMLAH_PENELITI_BERDASARKAN_JENIS_KELAMIN.doc', '1787125618_BRIDA-KEPEGAWAIAN-01-2025_JUMLAH_PENELITI_BERDASARKAN_JENIS_KELAMIN.pdf', 6, NULL, '2026-03-16 21:08:59', NULL, 'published', NULL, 'Dataset Statistik', 2025, 'BRIDA Jawa Timur', 'Tahunan', NULL, 'Data jumlah peneliti berdasarkan jenis kelamin', 'peneliti', 298),
(15, 'Hak Kekayaan Intelektual', 'Invensi Inovasi', 'Data HKI yang dihasilkan dari kegiatan riset dan inovasi', 2025, 'BRIDA Jawa Timur', 'Invensi dan Inovasi', 'Jawa Timur', '1784164972_DATASET-BRIDA-INVENSIINOVASI-05-2025.csv', '1783923795_BRIDA-INVENSIINOVASI-05-2025_HAK_KEKAYAAN_INTELEKTUAL.doc', '1787130092_BRIDA-INVENSIINOVASI-04-2025_HAK_KEKAYAAN_INTELEKTUAL.pdf', 8, NULL, '2026-03-16 21:23:42', NULL, 'published', NULL, 'Dataset Statistik', 2025, 'BRIDA Jawa Timur', 'Tahunan', NULL, 'Data HKI yang dihasilkan dari kegiatan riset dan inovasi', 'hki', 30),
(16, 'Jumlah Peneliti Berdasarkan Jenjang Jabatan', 'Sekretariat', 'Dataset Jumlah Peneliti Berdasarkan Jenjang Jabatan merupakan kumpulan data yang memuat informasi mengenai jumlah sumber daya manusia peneliti yang diklasifikasikan berdasarkan jenjang jabatan fungsionalnya. Dataset ini bertujuan untuk memberikan gambaran mengenai komposisi dan distribusi peneliti pada setiap tingkat jabatan fungsional di lingkungan Badan Riset dan Inovasi Daerah Provinsi Jawa Timur.\r\nInformasi dalam dataset ini mencakup jenjang jabatan fungsional peneliti serta jumlah peneliti pada masing-masing jenjang jabatan, seperti Peneliti Ahli Pertama, Peneliti Ahli Muda, Peneliti Ahli Madya, dan Peneliti Ahli Utama. Data tersebut dapat digunakan sebagai dasar dalam perencanaan kebutuhan sumber daya manusia, pengembangan kapasitas peneliti, serta penguatan ekosistem riset dan inovasi di daerah.\r\nDengan adanya dataset ini, diharapkan pengelolaan data sumber daya manusia bidang riset dapat dilakukan secara lebih terstruktur dan transparan, serta dapat mendukung perencanaan dan pengambilan keputusan yang berkaitan dengan pengembangan kapasitas penelitian di lingkungan Pemerintah Provinsi Jawa Timur.', 2025, 'BRIDA Jatim', 'Sub Bagian Umum dan Kepegawaian', 'Jawa Timur', '1784164934_DATASET-BRIDA-KEPEGAWAIAN-02-2025.csv', '1783924085_BRIDA-KEPEGAWAIAN-02-2025_JUMLAH_PENELITI_BERDASARKAN_PANGKAT_GOLONGAN.doc', '1787127027_BRIDA-KEPEGAWAIAN-02-2025_JUMLAH_PENELITI_BERDASARKAN_JENJANG_JABATAN.pdf', 6, NULL, '2026-07-13 06:28:05', NULL, 'waiting_for_verification', NULL, 'Tahunan', 2025, 'BRIDA Jatim', 'Tahunan', '2026-01-15', 'Dataset Jumlah Peneliti Berdasarkan Jenjang Jabatan merupakan kumpulan data yang memuat informasi mengenai jumlah sumber daya manusia peneliti yang diklasifikasikan berdasarkan jenjang jabatan fungsionalnya. Dataset ini bertujuan untuk memberikan gambaran mengenai komposisi dan distribusi peneliti pada setiap tingkat jabatan fungsional di lingkungan Badan Riset dan Inovasi Daerah Provinsi Jawa Timur.\r\nInformasi dalam dataset ini mencakup jenjang jabatan fungsional peneliti serta jumlah peneliti pada masing-masing jenjang jabatan, seperti Peneliti Ahli Pertama, Peneliti Ahli Muda, Peneliti Ahli Madya, dan Peneliti Ahli Utama. Data tersebut dapat digunakan sebagai dasar dalam perencanaan kebutuhan sumber daya manusia, pengembangan kapasitas peneliti, serta penguatan ekosistem riset dan inovasi di daerah.\r\nDengan adanya dataset ini, diharapkan pengelolaan data sumber daya manusia bidang riset dapat dilakukan secara lebih terstruktur dan transparan, serta dapat mendukung perencanaan dan pengambilan keputusan yang berkaitan dengan pengembangan kapasitas penelitian di lingkungan Pemerintah Provinsi Jawa Timur.', NULL, NULL),
(19, 'Policy Brief', 'Litbangjirap', 'Dataset Naskah Kebijakan merupakan kumpulan data yang memuat informasi mengenai dokumen kajian atau rekomendasi kebijakan yang dihasilkan dari kegiatan riset, analisis, atau kajian strategis yang dilakukan oleh Badan Riset dan Inovasi Daerah maupun pihak terkait. Dataset ini bertujuan untuk menyediakan informasi yang terstruktur mengenai berbagai naskah kebijakan yang dapat digunakan sebagai referensi dalam proses perumusan kebijakan, pengambilan keputusan, serta penyusunan program pembangunan daerah.\r\nInformasi yang terdapat dalam dataset ini meliputi judul naskah kebijakan yang menggambarkan topik atau isu strategis yang dikaji serta jenis naskah yang menunjukkan bentuk dokumen kebijakan, seperti policy brief, policy paper, atau rekomendasi kebijakan. Dengan adanya dataset ini, diharapkan pengelolaan dan pemanfaatan dokumen kebijakan dapat dilakukan secara lebih sistematis, transparan, dan mudah diakses oleh pemangku kepentingan yang membutuhkan.\r\nDataset Naskah Kebijakan juga mendukung penguatan tata kelola pengetahuan serta optimalisasi pemanfaatan hasil riset dan inovasi dalam proses penyusunan kebijakan berbasis bukti (evidence-based policy) di lingkungan pemerintah daerah.', 2025, 'BRIDA Jatim', 'LITBANGJIRAP', 'Jawa Timur', '1784166093_DATASET-BRIDA-LITBANGJIRAP-02-2025.csv', '1783924540_BRIDA-LITBANGJIRAP-02-2025_NASKAH_KEBIJAKAN.doc', '1787127353_BRIDA-LITBANGJIRAP-02-2025_NASKAH_KEBIJAKAN.pdf', 10, NULL, '2026-07-13 06:35:40', NULL, 'waiting_for_verification', NULL, 'Tahunan', 2025, 'BRIDA Jatim', 'Tahunan', '2026-01-15', 'Dataset Naskah Kebijakan merupakan kumpulan data yang memuat informasi mengenai dokumen kajian atau rekomendasi kebijakan yang dihasilkan dari kegiatan riset, analisis, atau kajian strategis yang dilakukan oleh Badan Riset dan Inovasi Daerah maupun pihak terkait. Dataset ini bertujuan untuk menyediakan informasi yang terstruktur mengenai berbagai naskah kebijakan yang dapat digunakan sebagai referensi dalam proses perumusan kebijakan, pengambilan keputusan, serta penyusunan program pembangunan daerah.\r\nInformasi yang terdapat dalam dataset ini meliputi judul naskah kebijakan yang menggambarkan topik atau isu strategis yang dikaji serta jenis naskah yang menunjukkan bentuk dokumen kebijakan, seperti policy brief, policy paper, atau rekomendasi kebijakan. Dengan adanya dataset ini, diharapkan pengelolaan dan pemanfaatan dokumen kebijakan dapat dilakukan secara lebih sistematis, transparan, dan mudah diakses oleh pemangku kepentingan yang membutuhkan.\r\nDataset Naskah Kebijakan juga mendukung penguatan tata kelola pengetahuan serta optimalisasi pemanfaatan hasil riset dan inovasi dalam proses penyusunan kebijakan berbasis bukti (evidence-based policy) di lingkungan pemerintah daerah.', 'kebijakan', 10),
(20, 'Daftar Hasil Riset Yang Dilakukan', 'Litbangjirap', 'Dataset Daftar Hasil Riset yang Dilakukan merupakan kumpulan data yang memuat informasi mengenai kegiatan penelitian atau kajian yang telah dilaksanakan oleh Badan Riset dan Inovasi Daerah Provinsi Jawa Timur maupun hasil kolaborasi dengan perangkat daerah, perguruan tinggi, lembaga penelitian, serta mitra terkait lainnya. Dataset ini bertujuan untuk mendokumentasikan berbagai kegiatan riset yang telah dilakukan sehingga dapat menjadi sumber informasi dan referensi dalam pengembangan kebijakan maupun perencanaan program pembangunan daerah.\r\nDataset ini memuat informasi dasar terkait hasil riset, seperti judul riset, tahun pelaksanaan, pelaksana kegiatan, serta ringkasan hasil penelitian. Informasi tersebut disusun secara terstruktur agar memudahkan proses penelusuran, pengelolaan, dan pemanfaatan data oleh pemangku kepentingan.\r\nDengan adanya dataset ini, diharapkan pengelolaan data hasil penelitian dapat dilakukan secara lebih sistematis, transparan, dan terdokumentasi dengan baik. Selain itu, dataset ini juga mendukung penguatan tata kelola data riset dan inovasi serta mendorong pemanfaatan hasil penelitian sebagai dasar dalam pengambilan keputusan dan penyusunan kebijakan berbasis bukti di lingkungan Pemerintah Provinsi Jawa Timur.', 2025, 'BRIDA Jatim', 'LITBANGJIRAP', 'Jawa Timur', '1784166071_DATASET-BRIDA-LITBANGJIRAP-01-2025.csv', '1783924653_BRIDA-LITBANGJIRAP-01-2025_DAFTAR_HASIL_RISET_YANG_DILAKUKAN.doc', '1787127309_BRIDA-LITBANGJIRAP-01-2025_Daftar_Hasil_Riset_Yang_Dilakukan.pdf', 10, NULL, '2026-07-13 06:37:33', NULL, 'waiting_for_verification', NULL, 'Tahunan', 2025, 'BRIDA Jatim', 'Tahunan', '2026-01-15', 'Dataset Daftar Hasil Riset yang Dilakukan merupakan kumpulan data yang memuat informasi mengenai kegiatan penelitian atau kajian yang telah dilaksanakan oleh Badan Riset dan Inovasi Daerah Provinsi Jawa Timur maupun hasil kolaborasi dengan perangkat daerah, perguruan tinggi, lembaga penelitian, serta mitra terkait lainnya. Dataset ini bertujuan untuk mendokumentasikan berbagai kegiatan riset yang telah dilakukan sehingga dapat menjadi sumber informasi dan referensi dalam pengembangan kebijakan maupun perencanaan program pembangunan daerah.\r\nDataset ini memuat informasi dasar terkait hasil riset, seperti judul riset, tahun pelaksanaan, pelaksana kegiatan, serta ringkasan hasil penelitian. Informasi tersebut disusun secara terstruktur agar memudahkan proses penelusuran, pengelolaan, dan pemanfaatan data oleh pemangku kepentingan.\r\nDengan adanya dataset ini, diharapkan pengelolaan data hasil penelitian dapat dilakukan secara lebih sistematis, transparan, dan terdokumentasi dengan baik. Selain itu, dataset ini juga mendukung penguatan tata kelola data riset dan inovasi serta mendorong pemanfaatan hasil penelitian sebagai dasar dalam pengambilan keputusan dan penyusunan kebijakan berbasis bukti di lingkungan Pemerintah Provinsi Jawa Timur.', 'riset', 27),
(21, 'Indeks Inovasi Daerah', 'Invensi Inovasi', 'Dataset Indeks Inovasi Daerah merupakan kumpulan data yang memuat informasi mengenai hasil pengukuran tingkat inovasi pada pemerintah daerah berdasarkan indikator-indikator yang telah ditetapkan dalam penilaian Indeks Inovasi Daerah. Dataset ini bertujuan untuk memberikan gambaran mengenai kinerja dan perkembangan inovasi yang dilakukan oleh pemerintah daerah dalam rangka meningkatkan kualitas pelayanan publik, tata kelola pemerintahan, serta daya saing daerah.\r\nInformasi yang terdapat dalam dataset ini mencakup data terkait nilai indeks inovasi, kategori atau predikat inovasi daerah, serta informasi wilayah dan tahun penilaian. Data tersebut digunakan untuk memantau perkembangan inovasi daerah dari waktu ke waktu serta menjadi dasar dalam perencanaan, evaluasi, dan pengambilan kebijakan terkait pengembangan inovasi di daerah.\r\nDengan adanya dataset ini, diharapkan pemantauan dan pengelolaan data inovasi daerah dapat dilakukan secara lebih sistematis, transparan, dan terukur. Selain itu, dataset ini juga mendukung upaya peningkatan budaya inovasi di lingkungan pemerintah daerah serta mendorong terciptanya pelayanan publik yang lebih efektif, efisien, dan berkualitas.', 2025, 'BRIDA Jatim', 'Invensi dan Inovasi', 'Surabaya, Jawa Timur', '1787130327_DATASET-BRIDA-INVENSIINOVASI-06-2025.csv', '1787130327_BRIDA-INVENSIINOVASI-06-2025_INDEKS_INOVASI_DAERAH.doc', '1787130327_BRIDA-INVENSIINOVASI-06-2025_INDEKS_INOVASI_DAERAH.pdf', 8, NULL, '2026-07-13 06:39:00', NULL, 'waiting_for_verification', NULL, 'Tahunan', 2025, 'BRIDA Jatim', 'Tahunan', '2026-01-15', 'Dataset Indeks Inovasi Daerah merupakan kumpulan data yang memuat informasi mengenai hasil pengukuran tingkat inovasi pada pemerintah daerah berdasarkan indikator-indikator yang telah ditetapkan dalam penilaian Indeks Inovasi Daerah. Dataset ini bertujuan untuk memberikan gambaran mengenai kinerja dan perkembangan inovasi yang dilakukan oleh pemerintah daerah dalam rangka meningkatkan kualitas pelayanan publik, tata kelola pemerintahan, serta daya saing daerah.\r\nInformasi yang terdapat dalam dataset ini mencakup data terkait nilai indeks inovasi, kategori atau predikat inovasi daerah, serta informasi wilayah dan tahun penilaian. Data tersebut digunakan untuk memantau perkembangan inovasi daerah dari waktu ke waktu serta menjadi dasar dalam perencanaan, evaluasi, dan pengambilan kebijakan terkait pengembangan inovasi di daerah.\r\nDengan adanya dataset ini, diharapkan pemantauan dan pengelolaan data inovasi daerah dapat dilakukan secara lebih sistematis, transparan, dan terukur. Selain itu, dataset ini juga mendukung upaya peningkatan budaya inovasi di lingkungan pemerintah daerah serta mendorong terciptanya pelayanan publik yang lebih efektif, efisien, dan berkualitas.', NULL, NULL),
(22, 'Daftar Publikasi Ilmiah', 'Litbangjirap', 'Dataset Publikasi Jurnal merupakan kumpulan data yang memuat informasi mengenai karya ilmiah hasil penelitian yang telah dipublikasikan dalam jurnal ilmiah. Dataset ini bertujuan untuk mendokumentasikan serta menyediakan informasi terkait hasil penelitian yang telah dipublikasikan sehingga dapat dimanfaatkan sebagai sumber referensi ilmiah, bahan pengembangan penelitian lanjutan, serta pendukung penyusunan kebijakan berbasis bukti.\r\nInformasi yang terdapat dalam dataset ini mencakup data terkait judul artikel, nama penulis, nama jurnal, tahun publikasi, serta informasi lain yang berkaitan dengan publikasi ilmiah. Data tersebut disusun secara terstruktur untuk memudahkan proses pengelolaan, pencarian, dan pemanfaatan karya ilmiah oleh peneliti, akademisi, maupun pemangku kepentingan lainnya.\r\nDengan adanya dataset ini, diharapkan pengelolaan dan dokumentasi publikasi ilmiah dapat dilakukan secara lebih sistematis dan mudah diakses. Selain itu, dataset ini juga mendukung penguatan diseminasi hasil penelitian serta peningkatan pemanfaatan karya ilmiah dalam pengembangan ilmu pengetahuan, teknologi, dan kebijakan di lingkungan Pemerintah Provinsi Jawa Timur.', 2025, 'BRIDA Jatim', 'Invensi dan Inovasi', 'Jawa Timur', '1787130770_DATASET-BRIDA-INVENSIINOVASI-09-2025.csv', '1787130770_BRIDA-INVENSIINOVASI-09-2025_Daftar_Publikasi_Ilmiah.doc', '1787130770_BRIDA-INVENSIINOVASI-09-2025_Daftar_Publikasi_Ilmiah.pdf', 8, NULL, '2026-07-13 06:40:04', NULL, 'waiting_for_verification', NULL, 'Tahunan', 2025, 'BRIDA Jatim', 'Tahunan', '2026-01-15', 'Dataset Publikasi Jurnal merupakan kumpulan data yang memuat informasi mengenai karya ilmiah hasil penelitian yang telah dipublikasikan dalam jurnal ilmiah. Dataset ini bertujuan untuk mendokumentasikan serta menyediakan informasi terkait hasil penelitian yang telah dipublikasikan sehingga dapat dimanfaatkan sebagai sumber referensi ilmiah, bahan pengembangan penelitian lanjutan, serta pendukung penyusunan kebijakan berbasis bukti.\r\nInformasi yang terdapat dalam dataset ini mencakup data terkait judul artikel, nama penulis, nama jurnal, tahun publikasi, serta informasi lain yang berkaitan dengan publikasi ilmiah. Data tersebut disusun secara terstruktur untuk memudahkan proses pengelolaan, pencarian, dan pemanfaatan karya ilmiah oleh peneliti, akademisi, maupun pemangku kepentingan lainnya.\r\nDengan adanya dataset ini, diharapkan pengelolaan dan dokumentasi publikasi ilmiah dapat dilakukan secara lebih sistematis dan mudah diakses. Selain itu, dataset ini juga mendukung penguatan diseminasi hasil penelitian serta peningkatan pemanfaatan karya ilmiah dalam pengembangan ilmu pengetahuan, teknologi, dan kebijakan di lingkungan Pemerintah Provinsi Jawa Timur.', 'publikasi', 8),
(26, 'Perjanjian Kerjasama', 'Sekretariat', 'Dataset Perjanjian Kerja Sama memuat informasi mengenai kerja sama yang dilakukan oleh Badan Riset dan Inovasi Daerah (BRIDA) Provinsi Jawa Timur dengan berbagai mitra, seperti perguruan tinggi, lembaga penelitian, perangkat daerah, instansi pemerintah, maupun pihak swasta dalam bidang riset dan inovasi. Data dalam dataset ini mencakup informasi terkait nama mitra kerja sama, jenis kerja sama, ruang lingkup kegiatan, periode pelaksanaan, serta status pelaksanaan kerja sama. Dataset ini bertujuan untuk mendokumentasikan dan memantau pelaksanaan kolaborasi riset dan inovasi guna mendukung pengembangan ilmu pengetahuan, teknologi, dan inovasi daerah di Provinsi Jawa Timur.', 2025, 'BRIDA Jatim - Sungram', 'Tim Kerja Penyusunan Program dan Anggaran', 'Surabaya, Jawa Timur', '1787127206_DATASET-BRIDA-SUNGRAM-02-2025.csv', '1787127206_BRIDA-SUNGRAM-02-2025_Perjanjian_Kerjasama.doc', '1787127206_BRIDA-SUNGRAM-02-2025_Perjanjian_Kerjasama.pdf', 6, NULL, '2026-07-13 06:46:59', '2026-07-13 08:05:00', 'approved', NULL, 'Tahunan', 2025, 'BRIDA Jatim - Sungram', 'Tahunan', '2026-01-15', 'Dataset Perjanjian Kerja Sama memuat informasi mengenai kerja sama yang dilakukan oleh Badan Riset dan Inovasi Daerah (BRIDA) Provinsi Jawa Timur dengan berbagai mitra, seperti perguruan tinggi, lembaga penelitian, perangkat daerah, instansi pemerintah, maupun pihak swasta dalam bidang riset dan inovasi. Data dalam dataset ini mencakup informasi terkait nama mitra kerja sama, jenis kerja sama, ruang lingkup kegiatan, periode pelaksanaan, serta status pelaksanaan kerja sama. Dataset ini bertujuan untuk mendokumentasikan dan memantau pelaksanaan kolaborasi riset dan inovasi guna mendukung pengembangan ilmu pengetahuan, teknologi, dan inovasi daerah di Provinsi Jawa Timur.', 'kegiatan', 2),
(27, 'Data Analis Kebijakan BRIDA Jawa Timur', 'Sekretariat', '---', 2026, 'BRIDA Jatim', 'Sub Bagian Umum dan Kepegawaian', 'Surabaya, Jawa Timur', '1784098739_DATASET-BRIDA-KEPEGAWAIAN-03-2026.csv', '1784098739_BRIDA-KEPEGAWAIAN-03-2026_DATA_ANALIS_KEBIJAKAN_BRIDA_PROVINSI_JAWA_TIMUR_TAHUN_2026.doc', '1787119578_BRIDA-KEPEGAWAIAN-03-2026_DATA_ANALIS_KEBIJAKAN_BRIDA_PROVINSI_JAWA_TIMUR_TAHUN_2026.pdf', 6, NULL, '2026-07-15 06:58:59', '2026-07-29 08:38:15', 'waiting_for_revision', NULL, 'Tahunan', 2026, 'BRIDA Jatim', 'Tahunan', '2026-07-15', '---', NULL, NULL),
(29, 'Anggaran Riset Jawa Timur', 'Sekretariat', 'Dataset ini berisi informasi mengenai alokasi anggaran kegiatan riset dan inovasi yang dilaksanakan oleh BRIDA Provinsi Jawa Timur. Data mencakup tahun anggaran, program dan kegiatan, sumber pendanaan, serta jumlah anggaran yang dialokasikan. Dataset ini digunakan untuk memantau dukungan pendanaan terhadap pengembangan riset dan inovasi daerah', 2025, 'BRIDA Jatim', 'Tim Kerja Penyusunan Program dan Anggaran', 'Surabaya, Jawa Timur', '1787125374_DATASET-BRIDA-SUNGRAM-01-2025.csv', '1787125374_BRIDA-SUNGRAM-01-2025_ANGGARAN_RISET.doc', '1787125374_BRIDA-SUNGRAM-01-2025_ANGGARAN_RISET.pdf', 6, NULL, '2026-07-16 01:44:40', '2026-07-29 08:37:59', 'approved', NULL, 'Tahunan', 2025, 'BRIDA Jatim', 'Tahunan', '2026-01-15', 'Dataset ini berisi informasi mengenai alokasi anggaran kegiatan riset dan inovasi yang dilaksanakan oleh BRIDA Provinsi Jawa Timur. Data mencakup tahun anggaran, program dan kegiatan, sumber pendanaan, serta jumlah anggaran yang dialokasikan. Dataset ini digunakan untuk memantau dukungan pendanaan terhadap pengembangan riset dan inovasi daerah', NULL, NULL),
(35, 'Data Analis Kebijakan BRIDA Jawa Timur', 'Sekretariat', 'Dataset Data Analis Kebijakan BRIDA Jawa Timur Tahun 2026 merupakan kumpulan data yang memuat informasi mengenai sumber daya manusia jabatan fungsional Analis Kebijakan di lingkungan Badan Riset dan Inovasi Daerah (BRIDA) Provinsi Jawa Timur. Dataset ini disusun sebagai bagian dari upaya pengelolaan satu data riset dan inovasi daerah guna mendukung perumusan kebijakan berbasis bukti (evidence-based policy).\r\nData yang disajikan mencakup identitas pegawai, jenjang jabatan fungsional, unit kerja penempatan, kualifikasi pendidikan, kompetensi, serta informasi pendukung lainnya yang relevan dengan pelaksanaan tugas dan fungsi analis kebijakan. Selain itu, dataset ini juga dapat memuat informasi terkait sebaran, kebutuhan, dan pengembangan kapasitas analis kebijakan di masing-masing perangkat daerah.\r\nDataset ini digunakan untuk mendukung proses perencanaan, monitoring, evaluasi, serta pengambilan keputusan strategis di bidang riset dan inovasi daerah, khususnya dalam penguatan kapasitas kelembagaan dan sumber daya manusia. Dengan adanya dataset ini, diharapkan tercipta integrasi data yang akurat, mutakhir, dan dapat dipertanggungjawabkan sebagai dasar penyusunan kebijakan di lingkungan Pemerintah Provinsi Jawa Timur.', 2025, 'Sekretariat - Badan Riset dan Inovasi Daerah Provinsi Jawa Timur', '', '', '1787119818_DATASET-BRIDA-KEPEGAWAIAN-03-2026.csv', '1787119818_BRIDA-KEPEGAWAIAN-03-2026_DATA_ANALIS_KEBIJAKAN_BRIDA_PROVINSI_JAWA_TIMUR_TAHUN_2026.doc', '1787119818_BRIDA-KEPEGAWAIAN-03-2026_DATA_ANALIS_KEBIJAKAN_BRIDA_PROVINSI_JAWA_TIMUR_TAHUN_2026.pdf', 1, NULL, '2026-08-19 06:10:18', NULL, 'waiting_for_verification', NULL, 'Tahunan', 2025, 'Sekretariat - Badan Riset dan Inovasi Daerah Provinsi Jawa Timur', 'Tahunan', '2025-12-31', 'Dataset Data Analis Kebijakan BRIDA Jawa Timur Tahun 2026 merupakan kumpulan data yang memuat informasi mengenai sumber daya manusia jabatan fungsional Analis Kebijakan di lingkungan Badan Riset dan Inovasi Daerah (BRIDA) Provinsi Jawa Timur. Dataset ini disusun sebagai bagian dari upaya pengelolaan satu data riset dan inovasi daerah guna mendukung perumusan kebijakan berbasis bukti (evidence-based policy).\r\nData yang disajikan mencakup identitas pegawai, jenjang jabatan fungsional, unit kerja penempatan, kualifikasi pendidikan, kompetensi, serta informasi pendukung lainnya yang relevan dengan pelaksanaan tugas dan fungsi analis kebijakan. Selain itu, dataset ini juga dapat memuat informasi terkait sebaran, kebutuhan, dan pengembangan kapasitas analis kebijakan di masing-masing perangkat daerah.\r\nDataset ini digunakan untuk mendukung proses perencanaan, monitoring, evaluasi, serta pengambilan keputusan strategis di bidang riset dan inovasi daerah, khususnya dalam penguatan kapasitas kelembagaan dan sumber daya manusia. Dengan adanya dataset ini, diharapkan tercipta integrasi data yang akurat, mutakhir, dan dapat dipertanggungjawabkan sebagai dasar penyusunan kebijakan di lingkungan Pemerintah Provinsi Jawa Timur.', NULL, NULL),
(36, 'Daftar Inovasi Daerah Dengan Kematangan Tinggi', 'Invensi Inovasi', 'Dataset ini berisi kumpulan data inovasi daerah yang diusulkan oleh Organisasi Perangkat Daerah (OPD) untuk mengikuti Innovative Government Award. Data mencakup informasi terkait nama inovasi, instansi pengusul, serta aspek pendukung lainnya yang menggambarkan karakteristik dan keunggulan inovasi yang diajukan.\r\nTujuan penyusunan dataset ini adalah untuk mendokumentasikan, memantau, serta mengevaluasi perkembangan inovasi daerah yang berpartisipasi dalam IGA. Dataset ini juga dapat digunakan sebagai bahan analisis dalam mengukur tingkat inovasi daerah, mendukung pengambilan kebijakan, serta mendorong peningkatan kualitas inovasi di lingkungan pemerintah daerah.', 2025, 'Badan Riset dan Inovasi Daerah Provinsi Jawa Timur', '', '', '1787127877_DATASET-BRIDA-INVENSIINOVASI-01-2025.csv', '1787127877_BRIDA-INVENSIINOVASI-01-2025_Daftar_Inovasi_Daerah_Dengan_Kematangan_Tinggi.doc', '1787127877_BRIDA-INVENSIINOVASI-01-2025_Daftar_Inovasi_Daerah_Dengan_Kematangan_Tinggi.pdf', 1, NULL, '2026-08-19 08:24:37', NULL, 'waiting_for_verification', NULL, 'Tahunan', 2025, 'Badan Riset dan Inovasi Daerah Provinsi Jawa Timur', '', '2026-03-28', 'Dataset ini berisi kumpulan data inovasi daerah yang diusulkan oleh Organisasi Perangkat Daerah (OPD) untuk mengikuti Innovative Government Award. Data mencakup informasi terkait nama inovasi, instansi pengusul, serta aspek pendukung lainnya yang menggambarkan karakteristik dan keunggulan inovasi yang diajukan.\r\nTujuan penyusunan dataset ini adalah untuk mendokumentasikan, memantau, serta mengevaluasi perkembangan inovasi daerah yang berpartisipasi dalam IGA. Dataset ini juga dapat digunakan sebagai bahan analisis dalam mengukur tingkat inovasi daerah, mendukung pengambilan kebijakan, serta mendorong peningkatan kualitas inovasi di lingkungan pemerintah daerah.', NULL, NULL),
(37, 'Daftar Inovasi Daerah', 'Invensi Inovasi', 'Dataset Inovasi Daerah merupakan kumpulan data yang memuat informasi terkait berbagai bentuk inovasi yang dihasilkan dan dikembangkan oleh perangkat daerah, instansi pemerintah, maupun pemangku kepentingan lainnya di tingkat daerah. Dataset ini bertujuan untuk mendokumentasikan, menginventarisasi, serta menyediakan informasi yang komprehensif mengenai inovasi yang telah diterapkan dalam rangka peningkatan kinerja penyelenggaraan pemerintahan daerah, pelayanan publik, dan pembangunan daerah.\r\nData yang disajikan dalam dataset ini mencakup informasi penting seperti nama inovasi, perangkat daerah pengusul, latar belakang dan tujuan inovasi, bentuk inovasi, tahapan implementasi, tahun pelaksanaan, serta capaian atau dampak yang dihasilkan. Selain itu, dataset ini juga dapat memuat klasifikasi inovasi berdasarkan urusan pemerintahan, sektor pembangunan, maupun kategori tertentu seperti inovasi digital, tata kelola pemerintahan, dan pelayanan publik.\r\nDataset Inovasi Daerah berfungsi sebagai sumber data strategis dalam mendukung pengambilan kebijakan berbasis data (evidence-based policy), evaluasi kinerja inovasi daerah, serta sebagai referensi dalam pengusulan dan penilaian ajang penghargaan inovasi seperti Innovative Government Award (IGA). Dataset ini juga mendukung implementasi prinsip Satu Data Indonesia dengan menjamin standar data, metadata, serta interoperabilitas antar sistem informasi.', 2025, 'Badan Riset dan Inovasi Daerah Provinsi Jawa Timur', 'Invensi dan Inovasi', 'Jawa Timur', '1787128422_DATASET-BRIDA-INVENSIINOVASI-03-2025.csv', '1787128422_BRIDA-INVENSIINOVASI-03-2025_Daftar_Inovasi_Daerah.doc', '1787128422_BRIDA-INVENSIINOVASI-03-2025_Daftar_Inovasi_Daerah.pdf', 1, NULL, '2026-08-19 08:33:42', NULL, 'waiting_for_verification', NULL, 'Tahunan', 2025, 'Badan Riset dan Inovasi Daerah Provinsi Jawa Timur', 'Tahunan', '2026-01-15', 'Dataset Inovasi Daerah merupakan kumpulan data yang memuat informasi terkait berbagai bentuk inovasi yang dihasilkan dan dikembangkan oleh perangkat daerah, instansi pemerintah, maupun pemangku kepentingan lainnya di tingkat daerah. Dataset ini bertujuan untuk mendokumentasikan, menginventarisasi, serta menyediakan informasi yang komprehensif mengenai inovasi yang telah diterapkan dalam rangka peningkatan kinerja penyelenggaraan pemerintahan daerah, pelayanan publik, dan pembangunan daerah.\r\nData yang disajikan dalam dataset ini mencakup informasi penting seperti nama inovasi, perangkat daerah pengusul, latar belakang dan tujuan inovasi, bentuk inovasi, tahapan implementasi, tahun pelaksanaan, serta capaian atau dampak yang dihasilkan. Selain itu, dataset ini juga dapat memuat klasifikasi inovasi berdasarkan urusan pemerintahan, sektor pembangunan, maupun kategori tertentu seperti inovasi digital, tata kelola pemerintahan, dan pelayanan publik.\r\nDataset Inovasi Daerah berfungsi sebagai sumber data strategis dalam mendukung pengambilan kebijakan berbasis data (evidence-based policy), evaluasi kinerja inovasi daerah, serta sebagai referensi dalam pengusulan dan penilaian ajang penghargaan inovasi seperti Innovative Government Award (IGA). Dataset ini juga mendukung implementasi prinsip Satu Data Indonesia dengan menjamin standar data, metadata, serta interoperabilitas antar sistem informasi.', NULL, NULL),
(38, 'Daftar Hasil Riset dan Inovasi Yang Daftarkan HKI', 'Invensi Inovasi', 'Dataset Daftar Hasil Riset dan Inovasi Yang Daftarkan HKI merupakan kumpulan data yang memuat informasi mengenai berbagai bentuk kekayaan intelektual yang dihasilkan dari kegiatan riset, pengembangan, dan inovasi. Dataset ini bertujuan untuk mendokumentasikan serta menyediakan informasi terkait karya atau produk inovasi yang telah memperoleh perlindungan hukum melalui pendaftaran hak kekayaan intelektual.\r\nInformasi yang terdapat dalam dataset ini mencakup data terkait judul atau nama karya, jenis hak kekayaan intelektual, pemilik atau pemegang hak, serta tahun atau status pendaftaran. Data tersebut disusun secara terstruktur untuk memudahkan proses pengelolaan, pemantauan, dan pemanfaatan informasi terkait kekayaan intelektual yang dihasilkan.\r\nDengan adanya dataset ini, diharapkan pengelolaan data hak kekayaan intelektual dapat dilakukan secara lebih sistematis dan terdokumentasi dengan baik. Selain itu, dataset ini juga mendukung upaya perlindungan hasil riset dan inovasi serta mendorong peningkatan produktivitas inovasi di lingkungan Badan Riset dan Inovasi Daerah Provinsi Jawa Timur.', 2025, 'Badan Riset dan Inovasi Daerah Provinsi Jawa Timur', '', '', '1787130240_DATASET-BRIDA-INVENSIINOVASI-05-2025.csv', '1787130240_BRIDA-INVENSIINOVASI-05-2025_Daftar_Hasil_Riset_dan_Inovasi_Yang_Daftarkan_HKI.doc', '1787130240_BRIDA-INVENSIINOVASI-05-2025_Daftar_Hasil_Riset_dan_Inovasi_Yang_Daftarkan_HKI.pdf', 1, NULL, '2026-08-19 09:04:00', NULL, 'waiting_for_verification', NULL, 'Tahunan', 2025, 'Badan Riset dan Inovasi Daerah Provinsi Jawa Timur', 'Tahunan', '2026-01-15', 'Dataset Daftar Hasil Riset dan Inovasi Yang Daftarkan HKI merupakan kumpulan data yang memuat informasi mengenai berbagai bentuk kekayaan intelektual yang dihasilkan dari kegiatan riset, pengembangan, dan inovasi. Dataset ini bertujuan untuk mendokumentasikan serta menyediakan informasi terkait karya atau produk inovasi yang telah memperoleh perlindungan hukum melalui pendaftaran hak kekayaan intelektual.\r\nInformasi yang terdapat dalam dataset ini mencakup data terkait judul atau nama karya, jenis hak kekayaan intelektual, pemilik atau pemegang hak, serta tahun atau status pendaftaran. Data tersebut disusun secara terstruktur untuk memudahkan proses pengelolaan, pemantauan, dan pemanfaatan informasi terkait kekayaan intelektual yang dihasilkan.\r\nDengan adanya dataset ini, diharapkan pengelolaan data hak kekayaan intelektual dapat dilakukan secara lebih sistematis dan terdokumentasi dengan baik. Selain itu, dataset ini juga mendukung upaya perlindungan hasil riset dan inovasi serta mendorong peningkatan produktivitas inovasi di lingkungan Badan Riset dan Inovasi Daerah Provinsi Jawa Timur.', NULL, NULL),
(39, 'Daftar Publikasi pada Jurnal Ilmiah', 'Litbangjirap', 'Dataset Daftar Publikasi pada Jurnal Ilmiah merupakan kumpulan data yang memuat informasi mengenai berbagai karya ilmiah yang dihasilkan dari kegiatan penelitian, pengkajian, dan pengembangan yang dilakukan oleh Badan Riset dan Inovasi Daerah Provinsi Jawa Timur maupun hasil kolaborasi dengan perguruan tinggi, lembaga penelitian, dan pemangku kepentingan lainnya. Dataset ini bertujuan untuk mendokumentasikan serta menyediakan akses informasi terhadap hasil-hasil penelitian yang telah dipublikasikan maupun disimpan dalam repositori ilmiah.\r\nInformasi yang terdapat dalam dataset ini mencakup data terkait judul publikasi, penulis, tahun publikasi, jenis publikasi ilmiah, serta tautan atau lokasi repositori dokumen. Data tersebut disusun secara terstruktur untuk memudahkan proses pencarian, pengelolaan, serta pemanfaatan karya ilmiah oleh peneliti, akademisi, maupun pemangku kepentingan lainnya.\r\nDengan adanya dataset ini, diharapkan pengelolaan dan diseminasi hasil penelitian dapat dilakukan secara lebih sistematis, transparan, dan mudah diakses. Selain itu, dataset ini juga mendukung penguatan pengelolaan pengetahuan (knowledge management) serta mendorong pemanfaatan hasil riset sebagai dasar dalam penyusunan kebijakan dan pengambilan keputusan berbasis bukti di lingkungan Pemerintah Provinsi Jawa Timur.', 2025, 'Badan Riset dan Inovasi Daerah Provinsi Jawa Timur', '', '', '1787130621_DATASET-BRIDA-INVENSIINOVASI-09-2025.csv', '1787130621_BRIDA-INVENSIINOVASI-09-2025_Daftar_Publikasi_Ilmiah.doc', '1787130621_BRIDA-INVENSIINOVASI-08-2025_Daftar_Publikasi_pada_Jurnal_Ilmiah.pdf', 1, NULL, '2026-08-19 09:10:21', NULL, 'waiting_for_verification', NULL, 'Tahunan', 2025, 'Badan Riset dan Inovasi Daerah Provinsi Jawa Timur', 'Tahunan', '2026-01-15', 'Dataset Daftar Publikasi pada Jurnal Ilmiah merupakan kumpulan data yang memuat informasi mengenai berbagai karya ilmiah yang dihasilkan dari kegiatan penelitian, pengkajian, dan pengembangan yang dilakukan oleh Badan Riset dan Inovasi Daerah Provinsi Jawa Timur maupun hasil kolaborasi dengan perguruan tinggi, lembaga penelitian, dan pemangku kepentingan lainnya. Dataset ini bertujuan untuk mendokumentasikan serta menyediakan akses informasi terhadap hasil-hasil penelitian yang telah dipublikasikan maupun disimpan dalam repositori ilmiah.\r\nInformasi yang terdapat dalam dataset ini mencakup data terkait judul publikasi, penulis, tahun publikasi, jenis publikasi ilmiah, serta tautan atau lokasi repositori dokumen. Data tersebut disusun secara terstruktur untuk memudahkan proses pencarian, pengelolaan, serta pemanfaatan karya ilmiah oleh peneliti, akademisi, maupun pemangku kepentingan lainnya.\r\nDengan adanya dataset ini, diharapkan pengelolaan dan diseminasi hasil penelitian dapat dilakukan secara lebih sistematis, transparan, dan mudah diakses. Selain itu, dataset ini juga mendukung penguatan pengelolaan pengetahuan (knowledge management) serta mendorong pemanfaatan hasil riset sebagai dasar dalam penyusunan kebijakan dan pengambilan keputusan berbasis bukti di lingkungan Pemerintah Provinsi Jawa Timur.', NULL, NULL),
(40, 'Daftar Repositori Ilmiah', 'Invensi Inovasi', 'Dataset Daftar Repositori Ilmiah merupakan kumpulan data yang memuat informasi mengenai berbagai karya ilmiah yang dihasilkan dari kegiatan penelitian, pengkajian, dan pengembangan yang dilakukan oleh Badan Riset dan Inovasi Daerah Provinsi Jawa Timur maupun hasil kolaborasi dengan perguruan tinggi, lembaga penelitian, dan pemangku kepentingan lainnya. Dataset ini bertujuan untuk mendokumentasikan serta menyediakan akses informasi terhadap hasil-hasil penelitian yang telah dipublikasikan maupun disimpan dalam repositori ilmiah.\r\nInformasi yang terdapat dalam dataset ini mencakup data terkait judul publikasi, penulis, tahun publikasi, jenis publikasi ilmiah, serta tautan atau lokasi repositori dokumen. Data tersebut disusun secara terstruktur untuk memudahkan proses pencarian, pengelolaan, serta pemanfaatan karya ilmiah oleh peneliti, akademisi, maupun pemangku kepentingan lainnya.\r\nDengan adanya dataset ini, diharapkan pengelolaan dan diseminasi hasil penelitian dapat dilakukan secara lebih sistematis, transparan, dan mudah diakses. Selain itu, dataset ini juga mendukung penguatan pengelolaan pengetahuan (knowledge management) serta mendorong pemanfaatan hasil riset sebagai dasar dalam penyusunan kebijakan dan pengambilan keputusan berbasis bukti di lingkungan Pemerintah Provinsi Jawa Timur.', 2025, 'Badan Riset dan Inovasi Daerah Provinsi Jawa Timur', '', '', '1787130962_DATASET-BRIDA-INVENSIINOVASI-10-2025.csv', '1787130962_BRIDA-INVENSIINOVASI-10-2025_Daftar_Repositori_Ilmiah.doc', '1787130962_BRIDA-INVENSIINOVASI-10-2025_Daftar_Repositori_Ilmiah.pdf', 1, NULL, '2026-08-19 09:16:02', NULL, 'waiting_for_verification', NULL, 'Tahunan', 2025, 'Badan Riset dan Inovasi Daerah Provinsi Jawa Timur', 'Tahunan', '2026-01-15', 'Dataset Daftar Repositori Ilmiah merupakan kumpulan data yang memuat informasi mengenai berbagai karya ilmiah yang dihasilkan dari kegiatan penelitian, pengkajian, dan pengembangan yang dilakukan oleh Badan Riset dan Inovasi Daerah Provinsi Jawa Timur maupun hasil kolaborasi dengan perguruan tinggi, lembaga penelitian, dan pemangku kepentingan lainnya. Dataset ini bertujuan untuk mendokumentasikan serta menyediakan akses informasi terhadap hasil-hasil penelitian yang telah dipublikasikan maupun disimpan dalam repositori ilmiah.\r\nInformasi yang terdapat dalam dataset ini mencakup data terkait judul publikasi, penulis, tahun publikasi, jenis publikasi ilmiah, serta tautan atau lokasi repositori dokumen. Data tersebut disusun secara terstruktur untuk memudahkan proses pencarian, pengelolaan, serta pemanfaatan karya ilmiah oleh peneliti, akademisi, maupun pemangku kepentingan lainnya.\r\nDengan adanya dataset ini, diharapkan pengelolaan dan diseminasi hasil penelitian dapat dilakukan secara lebih sistematis, transparan, dan mudah diakses. Selain itu, dataset ini juga mendukung penguatan pengelolaan pengetahuan (knowledge management) serta mendorong pemanfaatan hasil riset sebagai dasar dalam penyusunan kebijakan dan pengambilan keputusan berbasis bukti di lingkungan Pemerintah Provinsi Jawa Timur.', NULL, NULL),
(41, 'Daftar Inovasi yang dikirim dalam IGA', 'Invensi Inovasi', '', 2025, 'Invensi dan Inovasi, Badan Riset dan Inovasi Daerah Provinsi Jawa Timur', '', '', '', '', '', 1, NULL, '2026-08-19 10:34:15', NULL, 'waiting_for_verification', NULL, 'Tahunan', 2025, 'Invensi dan Inovasi, Badan Riset dan Inovasi Daerah Provinsi Jawa Timur', 'Tahunan', '2026-01-15', '', NULL, NULL),
(43, 'Daftar Rekomendasi Kebijakan yang Dimanfaatkan', 'Litbangjirap', '', 0, '', '', '', '', '', '', 1, NULL, '2026-08-20 07:36:14', NULL, 'waiting_for_verification', NULL, 'Tahunan', NULL, '', '', NULL, '', NULL, NULL),
(44, 'Daftar Replikasi Inovasi BRIDA', 'Invensi Inovasi', '', 0, '', '', '', '', '', '', 1, NULL, '2026-08-20 07:37:55', NULL, 'waiting_for_verification', NULL, 'Tahunan', NULL, '', '', NULL, '', NULL, NULL),
(45, 'Anak Magang', 'Sekretariat', 'Jumlah Anak Magang, cuma dataset contoh untuk mencoba', 2026, 'BRIDA Jatim - Sungram', '', '', '', '', '', 1, 'sekretariat', '2026-08-24 03:50:48', NULL, 'waiting_for_verification', NULL, 'Bulanan', 2026, 'BRIDA Jatim - Sungram', 'Bulanan', '2026-08-31', 'Jumlah Anak Magang, cuma dataset contoh untuk mencoba', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dataset_docs`
--

CREATE TABLE `dataset_docs` (
  `id` int(11) NOT NULL,
  `dataset_id` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dataset_docs`
--

INSERT INTO `dataset_docs` (`id`, `dataset_id`, `file_path`, `created_at`) VALUES
(1, 15, '1783923795_BRIDA-INVENSIINOVASI-05-2025_HAK_KEKAYAAN_INTELEKTUAL.doc', '2026-07-13 06:23:15'),
(2, 11, '1783923947_BRIDA-KEPEGAWAIAN-01-2025_JUMLAH_PENELITI_BERDASARKAN_JENIS_KELAMIN.doc', '2026-07-13 06:25:47'),
(3, 16, '1783924085_BRIDA-KEPEGAWAIAN-02-2025_JUMLAH_PENELITI_BERDASARKAN_PANGKAT_GOLONGAN.doc', '2026-07-13 06:28:05'),
(8, 19, '1783924540_BRIDA-LITBANGJIRAP-02-2025_NASKAH_KEBIJAKAN.doc', '2026-07-13 06:35:40'),
(9, 4, '1783924580_BRIDA-LITBANGJIRAP-03-2025_RISET_KEBIJAKAN.doc', '2026-07-13 06:36:20'),
(10, 20, '1783924653_BRIDA-LITBANGJIRAP-01-2025_DAFTAR_HASIL_RISET_YANG_DILAKUKAN.doc', '2026-07-13 06:37:33'),
(17, 27, '1784098739_BRIDA-KEPEGAWAIAN-03-2026_DATA_ANALIS_KEBIJAKAN_BRIDA_PROVINSI_JAWA_TIMUR_TAHUN_2026.doc', '2026-07-15 06:58:59'),
(20, 35, '1787119818_BRIDA-KEPEGAWAIAN-03-2026_DATA_ANALIS_KEBIJAKAN_BRIDA_PROVINSI_JAWA_TIMUR_TAHUN_2026.doc', '2026-08-19 06:10:18'),
(21, 29, '1787125374_BRIDA-SUNGRAM-01-2025_ANGGARAN_RISET.doc', '2026-08-19 07:42:54'),
(22, 26, '1787127206_BRIDA-SUNGRAM-02-2025_Perjanjian_Kerjasama.doc', '2026-08-19 08:13:26'),
(23, 36, '1787127877_BRIDA-INVENSIINOVASI-01-2025_Daftar_Inovasi_Daerah_Dengan_Kematangan_Tinggi.doc', '2026-08-19 08:24:37'),
(24, 5, '1787128052_BRIDA-INVENSIINOVASI-02-2025_SOSIALISASI_DAN_DISEMINASI.doc', '2026-08-19 08:27:32'),
(25, 37, '1787128422_BRIDA-INVENSIINOVASI-03-2025_Daftar_Inovasi_Daerah.doc', '2026-08-19 08:33:42'),
(26, 38, '1787130240_BRIDA-INVENSIINOVASI-05-2025_Daftar_Hasil_Riset_dan_Inovasi_Yang_Daftarkan_HKI.doc', '2026-08-19 09:04:00'),
(27, 21, '1787130327_BRIDA-INVENSIINOVASI-06-2025_INDEKS_INOVASI_DAERAH.doc', '2026-08-19 09:05:27'),
(28, 9, '1787130429_BRIDA-INVENSIINOVASI-07-2025_PERANGKAT_LUNAK.doc', '2026-08-19 09:07:10'),
(29, 39, '1787130621_BRIDA-INVENSIINOVASI-09-2025_Daftar_Publikasi_Ilmiah.doc', '2026-08-19 09:10:21'),
(30, 22, '1787130770_BRIDA-INVENSIINOVASI-09-2025_Daftar_Publikasi_Ilmiah.doc', '2026-08-19 09:12:50'),
(31, 40, '1787130962_BRIDA-INVENSIINOVASI-10-2025_Daftar_Repositori_Ilmiah.doc', '2026-08-19 09:16:02');

-- --------------------------------------------------------

--
-- Table structure for table `dataset_files`
--

CREATE TABLE `dataset_files` (
  `id` int(11) NOT NULL,
  `dataset_id` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dataset_files`
--

INSERT INTO `dataset_files` (`id`, `dataset_id`, `file_path`, `created_at`) VALUES
(4, 4, '16._riset_kebijakan_1773695760.csv', '2026-07-02 04:46:59'),
(7, 7, '2._apresiasi_riset_dan_inovasi_1773696144.csv', '2026-07-02 04:46:59'),
(10, 11, '9._jumlah_peneliti_di_jawa_timu_1773696188.csv', '2026-07-02 04:46:59'),
(16, 27, '1784098739_DATASET-BRIDA-KEPEGAWAIAN-03-2026.csv', '2026-07-15 06:58:59'),
(19, 16, '1784164934_DATASET-BRIDA-KEPEGAWAIAN-02-2025.csv', '2026-07-16 01:22:14'),
(20, 15, '1784164972_DATASET-BRIDA-INVENSIINOVASI-05-2025.csv', '2026-07-16 01:22:52'),
(28, 20, '1784166071_DATASET-BRIDA-LITBANGJIRAP-01-2025.csv', '2026-07-16 01:41:11'),
(29, 19, '1784166093_DATASET-BRIDA-LITBANGJIRAP-02-2025.csv', '2026-07-16 01:41:33'),
(34, 35, '1787119818_DATASET-BRIDA-KEPEGAWAIAN-03-2026.csv', '2026-08-19 06:10:18'),
(35, 29, '1787125374_DATASET-BRIDA-SUNGRAM-01-2025.csv', '2026-08-19 07:42:54'),
(36, 26, '1787127206_DATASET-BRIDA-SUNGRAM-02-2025.csv', '2026-08-19 08:13:26'),
(37, 36, '1787127877_DATASET-BRIDA-INVENSIINOVASI-01-2025.csv', '2026-08-19 08:24:37'),
(38, 5, '1787128052_DATASET-BRIDA-INVENSIINOVASI-02-2025.csv', '2026-08-19 08:27:32'),
(39, 37, '1787128422_DATASET-BRIDA-INVENSIINOVASI-03-2025.csv', '2026-08-19 08:33:42'),
(40, 38, '1787130240_DATASET-BRIDA-INVENSIINOVASI-05-2025.csv', '2026-08-19 09:04:00'),
(41, 21, '1787130327_DATASET-BRIDA-INVENSIINOVASI-06-2025.csv', '2026-08-19 09:05:27'),
(42, 9, '1787130429_DATASET-BRIDA-INVENSIINOVASI-07-2025.csv', '2026-08-19 09:07:10'),
(43, 39, '1787130621_DATASET-BRIDA-INVENSIINOVASI-09-2025.csv', '2026-08-19 09:10:21'),
(44, 22, '1787130770_DATASET-BRIDA-INVENSIINOVASI-09-2025.csv', '2026-08-19 09:12:50'),
(45, 40, '1787130962_DATASET-BRIDA-INVENSIINOVASI-10-2025.csv', '2026-08-19 09:16:02');

-- --------------------------------------------------------

--
-- Table structure for table `dataset_metadata`
--

CREATE TABLE `dataset_metadata` (
  `id` int(11) NOT NULL,
  `dataset_id` int(11) NOT NULL,
  `nama_field` varchar(150) NOT NULL,
  `nilai_field` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dataset_metadata`
--

INSERT INTO `dataset_metadata` (`id`, `dataset_id`, `nama_field`, `nilai_field`) VALUES
(52, 4, 'judul_dataset', 'Riset Kebijakan'),
(53, 4, 'deskripsi_dataset', 'Data penelitian yang berkaitan dengan kebijakan daerah'),
(54, 4, 'kategori', 'Riset Kebijakan'),
(55, 4, 'instansi', 'BRIDA Jawa Timur'),
(56, 4, 'peneliti', 'BRIDA Jatim'),
(57, 4, 'jenis_data', 'Dataset Statistik'),
(58, 4, 'tahun_data', '2024'),
(59, 4, 'lokasi', 'Jawa Timur'),
(60, 4, 'sumber_data', 'BRIDA Jatim'),
(61, 4, 'metode_pengumpulan', 'Kompilasi Data'),
(62, 4, 'format_data', 'XLSX'),
(63, 4, 'bahasa', 'Indonesia'),
(64, 4, 'kata_kunci', 'riset kebijakan'),
(65, 4, 'status_publikasi', 'published'),
(66, 4, 'tanggal_publikasi', '2024-01-01'),
(67, 4, 'versi_dataset', '1.0'),
(68, 4, 'kontak_email', 'brida@jatim.go.id'),
(69, 5, 'judul_dataset', 'Sosialisasi dan Diseminasi'),
(70, 5, 'deskripsi_dataset', 'Data kegiatan sosialisasi dan diseminasi hasil riset dan inovasi'),
(71, 5, 'kategori', 'Riset dan Inovasi'),
(72, 5, 'instansi', 'BRIDA Jawa Timur'),
(73, 5, 'peneliti', 'BRIDA Jatim'),
(74, 5, 'jenis_data', 'Dataset Statistik'),
(75, 5, 'tahun_data', '2024'),
(76, 5, 'lokasi', 'Jawa Timur'),
(77, 5, 'sumber_data', 'BRIDA Jatim'),
(78, 5, 'metode_pengumpulan', 'Kompilasi Data'),
(79, 5, 'format_data', 'XLSX'),
(80, 5, 'bahasa', 'Indonesia'),
(81, 5, 'kata_kunci', 'sosialisasi dan diseminasi'),
(82, 5, 'status_publikasi', 'published'),
(83, 5, 'tanggal_publikasi', '2024-01-01'),
(84, 5, 'versi_dataset', '1.0'),
(85, 5, 'kontak_email', 'brida@jatim.go.id'),
(103, 7, 'judul_dataset', 'Apresiasi Riset dan Inovasi'),
(104, 7, 'deskripsi_dataset', 'Data penghargaan atau apresiasi terhadap kegiatan riset dan inovasi'),
(105, 7, 'kategori', 'Riset dan Inovasi'),
(106, 7, 'instansi', 'BRIDA Jawa Timur'),
(107, 7, 'peneliti', 'BRIDA Jatim'),
(108, 7, 'jenis_data', 'Dataset Statistik'),
(109, 7, 'tahun_data', '2024'),
(110, 7, 'lokasi', 'Jawa Timur'),
(111, 7, 'sumber_data', 'BRIDA Jatim'),
(112, 7, 'metode_pengumpulan', 'Kompilasi Data'),
(113, 7, 'format_data', 'XLSX'),
(114, 7, 'bahasa', 'Indonesia'),
(115, 7, 'kata_kunci', 'apresiasi riset dan inovasi'),
(116, 7, 'status_publikasi', 'published'),
(117, 7, 'tanggal_publikasi', '2024-01-01'),
(118, 7, 'versi_dataset', '1.0'),
(119, 7, 'kontak_email', 'brida@jatim.go.id'),
(137, 9, 'judul_dataset', 'Perangkat Lunak'),
(138, 9, 'deskripsi_dataset', 'Data perangkat lunak yang dihasilkan dari kegiatan riset dan inovasi'),
(139, 9, 'kategori', 'Riset dan Inovasi'),
(140, 9, 'instansi', 'BRIDA Jawa Timur'),
(141, 9, 'peneliti', 'BRIDA Jatim'),
(142, 9, 'jenis_data', 'Dataset Statistik'),
(143, 9, 'tahun_data', '2024'),
(144, 9, 'lokasi', 'Jawa Timur'),
(145, 9, 'sumber_data', 'BRIDA Jatim'),
(146, 9, 'metode_pengumpulan', 'Kompilasi Data'),
(147, 9, 'format_data', 'XLSX'),
(148, 9, 'bahasa', 'Indonesia'),
(149, 9, 'kata_kunci', 'perangkat lunak'),
(150, 9, 'status_publikasi', 'published'),
(151, 9, 'tanggal_publikasi', '2024-01-01'),
(152, 9, 'versi_dataset', '1.0'),
(153, 9, 'kontak_email', 'brida@jatim.go.id'),
(171, 11, 'judul_dataset', 'Jumlah Peneliti Berdasarkan Jenis Kelamin'),
(172, 11, 'deskripsi_dataset', 'Data jumlah peneliti berdasarkan jenis kelamin'),
(173, 11, 'kategori', 'Riset'),
(174, 11, 'instansi', 'BRIDA Jawa Timur'),
(175, 11, 'peneliti', 'BRIDA Jatim'),
(176, 11, 'jenis_data', 'Dataset Statistik'),
(177, 11, 'tahun_data', '2024'),
(178, 11, 'lokasi', 'Jawa Timur'),
(179, 11, 'sumber_data', 'BRIDA Jatim'),
(180, 11, 'metode_pengumpulan', 'Kompilasi Data'),
(181, 11, 'format_data', 'XLSX'),
(182, 11, 'bahasa', 'Indonesia'),
(183, 11, 'kata_kunci', 'jumlah peneliti berdasarkan jenis kelamin'),
(184, 11, 'status_publikasi', 'published'),
(185, 11, 'tanggal_publikasi', '2024-01-01'),
(186, 11, 'versi_dataset', '1.0'),
(187, 11, 'kontak_email', 'brida@jatim.go.id'),
(239, 15, 'judul_dataset', 'Hak Kekayaan Intelektual'),
(240, 15, 'deskripsi_dataset', 'Data HKI yang dihasilkan dari kegiatan riset dan inovasi'),
(241, 15, 'kategori', 'Riset dan Inovasi'),
(242, 15, 'instansi', 'BRIDA Jawa Timur'),
(243, 15, 'peneliti', 'BRIDA Jatim'),
(244, 15, 'jenis_data', 'Dataset Statistik'),
(245, 15, 'tahun_data', '2024'),
(246, 15, 'lokasi', 'Jawa Timur'),
(247, 15, 'sumber_data', 'BRIDA Jatim'),
(248, 15, 'metode_pengumpulan', 'Kompilasi Data'),
(249, 15, 'format_data', 'XLSX'),
(250, 15, 'bahasa', 'Indonesia'),
(251, 15, 'kata_kunci', 'hak kekayaan intelektual'),
(252, 15, 'status_publikasi', 'published'),
(253, 15, 'tanggal_publikasi', '2024-01-01'),
(254, 15, 'versi_dataset', '1.0'),
(255, 15, 'kontak_email', 'brida@jatim.go.id'),
(256, 16, 'Instansi_Produsen', 'BRIDA Jatim'),
(257, 16, 'Penanggung_Jawab', 'BRIDA Jatim'),
(258, 16, 'Sumber_Data', 'BRIDA Jatim'),
(259, 16, 'Cakupan_Wilayah', 'BRIDA Jatim'),
(260, 16, 'Satuan_Data', ''),
(261, 16, 'Keterangan_Tambahan', ''),
(274, 19, 'Instansi_Produsen', 'BRIDA Jatim'),
(275, 19, 'Penanggung_Jawab', 'BRIDA Jatim'),
(276, 19, 'Sumber_Data', 'BRIDA Jatim'),
(277, 19, 'Cakupan_Wilayah', 'BRIDA Jatim'),
(278, 19, 'Satuan_Data', ''),
(279, 19, 'Keterangan_Tambahan', ''),
(280, 20, 'Instansi_Produsen', 'BRIDA Jatim'),
(281, 20, 'Penanggung_Jawab', 'BRIDA Jatim'),
(282, 20, 'Sumber_Data', 'BRIDA Jatim'),
(283, 20, 'Cakupan_Wilayah', 'BRIDA Jatim'),
(284, 20, 'Satuan_Data', ''),
(285, 20, 'Keterangan_Tambahan', ''),
(286, 21, 'Instansi_Produsen', 'BRIDA Jatim'),
(287, 21, 'Penanggung_Jawab', 'BRIDA Jatim'),
(288, 21, 'Sumber_Data', 'BRIDA Jatim'),
(289, 21, 'Cakupan_Wilayah', 'BRIDA Jatim'),
(290, 21, 'Satuan_Data', ''),
(291, 21, 'Keterangan_Tambahan', ''),
(292, 22, 'Instansi_Produsen', ''),
(293, 22, 'Penanggung_Jawab', ''),
(294, 22, 'Sumber_Data', ''),
(295, 22, 'Cakupan_Wilayah', ''),
(296, 22, 'Satuan_Data', ''),
(297, 22, 'Keterangan_Tambahan', ''),
(316, 26, 'Instansi_Produsen', 'BRIDA Jatim'),
(317, 26, 'Penanggung_Jawab', 'BRIDA Jatim'),
(318, 26, 'Sumber_Data', 'BRIDA Jatim'),
(319, 26, 'Cakupan_Wilayah', 'BRIDA Jatim'),
(320, 26, 'Satuan_Data', ''),
(321, 26, 'Keterangan_Tambahan', ''),
(322, 27, 'Instansi_Produsen', 'BRIDA Jatim'),
(323, 27, 'Penanggung_Jawab', 'BRIDA Jatim'),
(324, 27, 'Sumber_Data', 'BRIDA Jatim'),
(325, 27, 'Cakupan_Wilayah', 'Jawa Timur'),
(326, 27, 'Satuan_Data', 'Jumlah'),
(327, 27, 'Keterangan_Tambahan', ''),
(334, 29, 'Instansi_Produsen', 'BRIDA Jatim'),
(335, 29, 'Penanggung_Jawab', 'BRIDA Jatim'),
(336, 29, 'Sumber_Data', 'BRIDA Jatim'),
(337, 29, 'Cakupan_Wilayah', 'Jawa Timur'),
(338, 29, 'Satuan_Data', ''),
(339, 29, 'Keterangan_Tambahan', ''),
(370, 35, 'Instansi_Produsen', 'Sekretariat'),
(371, 35, 'Penanggung_Jawab', 'Dicky Bayu Nur Rachman, S.I.P.'),
(372, 35, 'Sumber_Data', 'Sekretariat - Badan Riset dan Inovasi Daerah Provinsi Jawa Timur'),
(373, 35, 'Cakupan_Wilayah', 'Jawa Timur'),
(374, 35, 'Satuan_Data', 'Orang'),
(375, 35, 'Keterangan_Tambahan', ''),
(376, 36, 'Instansi_Produsen', 'Badan Riset dan Inovasi Daerah Provinsi Jawa Timur'),
(377, 36, 'Penanggung_Jawab', 'Invensi dan Inovasi'),
(378, 36, 'Sumber_Data', 'BSKDN Kementerian Dalam Negeri Republik Indonesia'),
(379, 36, 'Cakupan_Wilayah', 'Jawa Timur'),
(380, 36, 'Satuan_Data', 'Jumlah'),
(381, 36, 'Keterangan_Tambahan', ''),
(382, 37, 'Instansi_Produsen', 'Badan Riset dan Inovasi Daerah Provinsi Jawa Timur'),
(383, 37, 'Penanggung_Jawab', 'Invensi dan Inovasi'),
(384, 37, 'Sumber_Data', 'BSKDN Kementerian Dalam Negeri '),
(385, 37, 'Cakupan_Wilayah', 'Jawa Timur'),
(386, 37, 'Satuan_Data', 'Jumlah'),
(387, 37, 'Keterangan_Tambahan', ''),
(388, 38, 'Instansi_Produsen', 'Badan Riset dan Inovasi Daerah Provinsi Jawa Timur'),
(389, 38, 'Penanggung_Jawab', 'Invensi dan Inovasi'),
(390, 38, 'Sumber_Data', 'Invensi dan Inovasi, Badan Riset dan Inovasi Daerah Provinsi Jawa Timur'),
(391, 38, 'Cakupan_Wilayah', 'Jawa Timur'),
(392, 38, 'Satuan_Data', 'Jumlah'),
(393, 38, 'Keterangan_Tambahan', ''),
(394, 39, 'Instansi_Produsen', 'Badan Riset dan Inovasi Daerah Provinsi Jawa Timur'),
(395, 39, 'Penanggung_Jawab', 'Invensi dan Inovasi'),
(396, 39, 'Sumber_Data', 'Invensi dan Inovasi, Badan Riset dan Inovasi Daerah Provinsi Jawa Timur'),
(397, 39, 'Cakupan_Wilayah', 'Jawa Timur'),
(398, 39, 'Satuan_Data', 'Dokumen'),
(399, 39, 'Keterangan_Tambahan', ''),
(400, 40, 'Instansi_Produsen', 'Badan Riset dan Inovasi Daerah Provinsi Jawa Timur'),
(401, 40, 'Penanggung_Jawab', 'Invensi dan Inovasi'),
(402, 40, 'Sumber_Data', 'Invensi dan Inovasi, Badan Riset dan Inovasi Daerah Provinsi Jawa Timur'),
(403, 40, 'Cakupan_Wilayah', 'Jawa Timur'),
(404, 40, 'Satuan_Data', 'Dokumen'),
(405, 40, 'Keterangan_Tambahan', ''),
(406, 41, 'Instansi_Produsen', 'Badan Riset dan Inovasi Daerah Provinsi Jawa Timur'),
(407, 41, 'Penanggung_Jawab', 'Invensi dan Inovasi'),
(408, 41, 'Sumber_Data', 'Invensi dan Inovasi, Badan Riset dan Inovasi Daerah Provinsi Jawa Timur'),
(409, 41, 'Cakupan_Wilayah', 'Jawa Timur'),
(410, 41, 'Satuan_Data', 'Jumlah'),
(411, 41, 'Keterangan_Tambahan', ''),
(418, 43, 'Instansi_Produsen', 'Badan Riset dan Inovasi Daerah Provinsi Jawa Timur'),
(419, 43, 'Penanggung_Jawab', ''),
(420, 43, 'Sumber_Data', ''),
(421, 43, 'Cakupan_Wilayah', ''),
(422, 43, 'Satuan_Data', ''),
(423, 43, 'Keterangan_Tambahan', ''),
(424, 44, 'Instansi_Produsen', 'Badan Riset dan Inovasi Daerah Provinsi Jawa Timur'),
(425, 44, 'Penanggung_Jawab', ''),
(426, 44, 'Sumber_Data', ''),
(427, 44, 'Cakupan_Wilayah', ''),
(428, 44, 'Satuan_Data', ''),
(429, 44, 'Keterangan_Tambahan', ''),
(430, 45, 'Instansi_Produsen', ''),
(431, 45, 'Penanggung_Jawab', ''),
(432, 45, 'Sumber_Data', ''),
(433, 45, 'Cakupan_Wilayah', ''),
(434, 45, 'Satuan_Data', ''),
(435, 45, 'Keterangan_Tambahan', '');

-- --------------------------------------------------------

--
-- Table structure for table `dataset_metrics`
--

CREATE TABLE `dataset_metrics` (
  `id` int(11) NOT NULL,
  `dataset_id` int(11) NOT NULL,
  `metric_type` varchar(50) NOT NULL,
  `metric_value` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dataset_metrics`
--

INSERT INTO `dataset_metrics` (`id`, `dataset_id`, `metric_type`, `metric_value`) VALUES
(58, 11, 'peneliti', 298),
(59, 20, 'riset', 27),
(60, 19, 'kebijakan', 10),
(61, 15, 'hki', 30),
(62, 9, 'perangkat_lunak', 2),
(66, 37, 'inovasi', 653),
(67, 22, 'publikasi', 8),
(68, 45, 'anak_magang', 76);

-- --------------------------------------------------------

--
-- Table structure for table `dataset_notification_reads`
--

CREATE TABLE `dataset_notification_reads` (
  `id` int(11) NOT NULL,
  `dataset_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seen_updated_at` datetime NOT NULL,
  `read_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dataset_notification_reads`
--

INSERT INTO `dataset_notification_reads` (`id`, `dataset_id`, `user_id`, `seen_updated_at`, `read_at`) VALUES
(3, 27, 6, '2026-07-29 15:38:15', '2026-08-11 07:30:30'),
(4, 29, 6, '2026-07-29 15:37:59', '2026-08-11 07:30:30'),
(5, 26, 6, '2026-07-13 15:05:00', '2026-08-11 07:30:30'),
(6, 4, 10, '2026-08-20 07:43:17', '2026-08-26 03:43:41');

-- --------------------------------------------------------

--
-- Table structure for table `dataset_pdfs`
--

CREATE TABLE `dataset_pdfs` (
  `id` int(11) NOT NULL,
  `dataset_id` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dataset_pdfs`
--

INSERT INTO `dataset_pdfs` (`id`, `dataset_id`, `file_path`, `created_at`) VALUES
(1, 27, '1787119578_BRIDA-KEPEGAWAIAN-03-2026_DATA_ANALIS_KEBIJAKAN_BRIDA_PROVINSI_JAWA_TIMUR_TAHUN_2026.pdf', '2026-08-19 06:06:18'),
(2, 35, '1787119818_BRIDA-KEPEGAWAIAN-03-2026_DATA_ANALIS_KEBIJAKAN_BRIDA_PROVINSI_JAWA_TIMUR_TAHUN_2026.pdf', '2026-08-19 06:10:18'),
(3, 29, '1787125374_BRIDA-SUNGRAM-01-2025_ANGGARAN_RISET.pdf', '2026-08-19 07:42:54'),
(4, 11, '1787125618_BRIDA-KEPEGAWAIAN-01-2025_JUMLAH_PENELITI_BERDASARKAN_JENIS_KELAMIN.pdf', '2026-08-19 07:46:58'),
(5, 16, '1787127027_BRIDA-KEPEGAWAIAN-02-2025_JUMLAH_PENELITI_BERDASARKAN_JENJANG_JABATAN.pdf', '2026-08-19 08:10:27'),
(6, 26, '1787127206_BRIDA-SUNGRAM-02-2025_Perjanjian_Kerjasama.pdf', '2026-08-19 08:13:26'),
(7, 20, '1787127309_BRIDA-LITBANGJIRAP-01-2025_Daftar_Hasil_Riset_Yang_Dilakukan.pdf', '2026-08-19 08:15:09'),
(8, 19, '1787127353_BRIDA-LITBANGJIRAP-02-2025_NASKAH_KEBIJAKAN.pdf', '2026-08-19 08:15:53'),
(9, 4, '1787127420_BRIDA-LITBANGJIRAP-03-2025_RISET_KEBIJAKAN.pdf', '2026-08-19 08:17:00'),
(10, 36, '1787127877_BRIDA-INVENSIINOVASI-01-2025_Daftar_Inovasi_Daerah_Dengan_Kematangan_Tinggi.pdf', '2026-08-19 08:24:37'),
(11, 5, '1787128052_BRIDA-INVENSIINOVASI-02-2025_SOSIALISASI_DAN_DISEMINASI.pdf', '2026-08-19 08:27:32'),
(12, 37, '1787128422_BRIDA-INVENSIINOVASI-03-2025_Daftar_Inovasi_Daerah.pdf', '2026-08-19 08:33:42'),
(13, 15, '1787130092_BRIDA-INVENSIINOVASI-04-2025_HAK_KEKAYAAN_INTELEKTUAL.pdf', '2026-08-19 09:01:32'),
(14, 38, '1787130240_BRIDA-INVENSIINOVASI-05-2025_Daftar_Hasil_Riset_dan_Inovasi_Yang_Daftarkan_HKI.pdf', '2026-08-19 09:04:00'),
(15, 21, '1787130327_BRIDA-INVENSIINOVASI-06-2025_INDEKS_INOVASI_DAERAH.pdf', '2026-08-19 09:05:27'),
(16, 9, '1787130430_BRIDA-INVENSIINOVASI-07-2025_PERANGKAT_LUNAK.pdf', '2026-08-19 09:07:10'),
(17, 39, '1787130621_BRIDA-INVENSIINOVASI-08-2025_Daftar_Publikasi_pada_Jurnal_Ilmiah.pdf', '2026-08-19 09:10:21'),
(18, 22, '1787130770_BRIDA-INVENSIINOVASI-09-2025_Daftar_Publikasi_Ilmiah.pdf', '2026-08-19 09:12:50'),
(19, 40, '1787130962_BRIDA-INVENSIINOVASI-10-2025_Daftar_Repositori_Ilmiah.pdf', '2026-08-19 09:16:02');

-- --------------------------------------------------------

--
-- Table structure for table `dataset_revisions`
--

CREATE TABLE `dataset_revisions` (
  `id` int(11) NOT NULL,
  `dataset_id` int(11) NOT NULL,
  `requested_by` int(11) DEFAULT NULL,
  `note` text NOT NULL,
  `deadline_at` datetime DEFAULT NULL,
  `status` enum('not_revised_yet','waiting_for_verification','approved') NOT NULL DEFAULT 'not_revised_yet',
  `submitted_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dataset_revisions`
--

INSERT INTO `dataset_revisions` (`id`, `dataset_id`, `requested_by`, `note`, `deadline_at`, `status`, `submitted_at`, `created_at`, `updated_at`) VALUES
(2, 27, 1, 'tolong revisi', '2026-07-31 23:59:00', 'not_revised_yet', NULL, '2026-07-29 08:38:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `deadline_notification_reads`
--

CREATE TABLE `deadline_notification_reads` (
  `id` int(11) NOT NULL,
  `deadline_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `read_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_deadlines`
--

CREATE TABLE `document_deadlines` (
  `id` int(11) NOT NULL,
  `nama_event` varchar(150) NOT NULL DEFAULT 'Tenggat Dokumen',
  `dataset_id` int(11) DEFAULT NULL,
  `deadline_at` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `document_deadlines`
--

INSERT INTO `document_deadlines` (`id`, `nama_event`, `dataset_id`, `deadline_at`, `created_by`, `created_at`, `updated_at`, `start_at`) VALUES
(3, 'Pelaporan Capaian Kinerja TW I', NULL, '2026-08-26 23:59:00', 1, '2026-08-19 10:35:46', '2026-08-20 02:20:11', '2026-08-24 00:00:00'),
(4, 'Pelaporan Capaian Kinerja TW II', NULL, '2026-08-31 23:59:00', 1, '2026-08-19 10:36:11', '2026-08-20 02:20:24', '2026-08-26 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL,
  `dataset_id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `recipient_role` enum('super_admin','verifikator','produsen_data') NOT NULL,
  `divisi` enum('sekretariat','inovasi','litbang') DEFAULT NULL,
  `message` text NOT NULL,
  `status` enum('belum_dibaca','sudah_dibaca') NOT NULL DEFAULT 'belum_dibaca',
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `reply_message` text DEFAULT NULL,
  `reply_by` int(11) DEFAULT NULL,
  `reply_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback_responses`
--

CREATE TABLE `feedback_responses` (
  `id` int(11) NOT NULL,
  `feedback_id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hki`
--

CREATE TABLE `hki` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `owner` varchar(150) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inovasi`
--

CREATE TABLE `inovasi` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_dataset`
--

CREATE TABLE `kategori_dataset` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(150) NOT NULL,
  `deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_dataset`
--

INSERT INTO `kategori_dataset` (`id`, `nama_kategori`, `deskripsi`) VALUES
(1, 'Riset dan Inovasi', 'Import metadata'),
(2, 'Riset', 'Import metadata'),
(3, 'Riset Kebijakan', 'Import metadata'),
(4, 'Inovasi Daerah', 'Import metadata'),
(5, 'Invensi Inovasi', ''),
(6, 'Litbangjirap', ''),
(7, 'Sekretariat', '');

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan`
--

CREATE TABLE `kegiatan` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `date` date DEFAULT NULL,
  `location` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(100) NOT NULL,
  `details` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `action`, `details`, `created_at`) VALUES
(1, 1, 'login', 'admin@satria.local', '2026-03-16 21:05:04'),
(2, 1, 'login', 'admin@satria.local', '2026-03-16 21:05:39'),
(3, 1, 'dataset_update', '1', '2026-03-16 21:14:59'),
(4, 1, 'dataset_update', '2', '2026-03-16 21:15:14'),
(5, 1, 'dataset_update', '3', '2026-03-16 21:15:28'),
(6, 1, 'dataset_update', '4', '2026-03-16 21:16:00'),
(7, 1, 'dataset_update', '5', '2026-03-16 21:16:25'),
(8, 1, 'dataset_update', '6', '2026-03-16 21:17:11'),
(9, 1, 'dataset_update', '14', '2026-03-16 21:17:40'),
(10, 1, 'dataset_delete', '13', '2026-03-16 21:17:52'),
(11, 1, 'dataset_update', '9', '2026-03-16 21:19:23'),
(12, 1, 'dataset_update', '1', '2026-03-16 21:19:35'),
(13, 1, 'dataset_update', '2', '2026-03-16 21:19:55'),
(14, 1, 'dataset_update', '9', '2026-03-16 21:20:18'),
(15, 1, 'dataset_update', '8', '2026-03-16 21:20:41'),
(16, 1, 'dataset_update', '8', '2026-03-16 21:21:04'),
(17, 1, 'dataset_update', '7', '2026-03-16 21:22:24'),
(18, 1, 'dataset_update', '11', '2026-03-16 21:23:08'),
(19, 1, 'dataset_update', '11', '2026-03-16 21:23:20'),
(20, 1, 'dataset_update', '15', '2026-03-16 21:24:06'),
(21, 1, 'dataset_update', '15', '2026-03-16 21:24:33'),
(22, 1, 'logout', '', '2026-03-16 21:56:55'),
(23, 1, 'login', 'admin@satria.local', '2026-03-16 21:59:09'),
(24, 1, 'user_reset_password', '2', '2026-03-16 22:05:00'),
(25, 1, 'user_delete', '2', '2026-03-16 22:05:05'),
(26, 1, 'logout', '', '2026-03-16 22:12:01'),
(27, 1, 'login', 'admin@satria.local', '2026-03-16 22:13:33'),
(28, 1, 'logout', '', '2026-03-16 22:15:32'),
(29, NULL, 'login', 'produsen@brida.local', '2026-03-16 22:19:24'),
(30, 1, 'login', 'admin@satria.local', '2026-07-02 04:49:37'),
(31, 1, 'user_create', 'pimpin@satria.local', '2026-07-02 06:03:10'),
(32, 1, 'login', 'admin@satria.local', '2026-07-13 01:36:55'),
(33, 1, 'logout', '', '2026-07-13 02:01:25'),
(34, 1, 'login', 'admin@satria.local', '2026-07-13 02:01:38'),
(35, 1, 'logout', '', '2026-07-13 03:03:04'),
(36, NULL, 'login', 'produsen.inovasi2@satria.local', '2026-07-13 03:03:11'),
(37, NULL, 'login', 'produsen.inovasi2@satria.local', '2026-07-13 03:04:11'),
(38, NULL, 'login', 'produsen.inovasi2@satria.local', '2026-07-13 03:04:15'),
(39, 1, 'login', 'admin@satria.local', '2026-07-13 03:05:43'),
(40, 1, 'logout', '', '2026-07-13 03:05:50'),
(41, NULL, 'login', 'produsen.inovasi2@satria.local', '2026-07-13 03:05:55'),
(42, NULL, 'logout', '', '2026-07-13 03:09:07'),
(43, 1, 'login', 'admin@satria.local', '2026-07-13 03:09:11'),
(44, 1, 'logout', '', '2026-07-13 03:17:08'),
(45, 1, 'login', 'admin@satria.local', '2026-07-13 03:17:17'),
(46, 1, 'logout', '', '2026-07-13 03:19:41'),
(47, NULL, 'login', 'produsen.sekretariat2@satria.local', '2026-07-13 03:19:45'),
(48, NULL, 'logout', '', '2026-07-13 03:19:56'),
(49, NULL, 'login', 'produsen.sekretariat2@satria.local', '2026-07-13 03:26:12'),
(50, NULL, 'logout', '', '2026-07-13 03:30:15'),
(51, 1, 'login', 'admin@satria.local', '2026-07-13 03:30:21'),
(52, 1, 'logout', '', '2026-07-13 03:30:59'),
(53, 10, 'login', 'produsen.litbang1@satria.local', '2026-07-13 03:31:05'),
(54, 10, 'logout', '', '2026-07-13 03:37:17'),
(55, 1, 'login', 'admin@satria.local', '2026-07-13 03:37:22'),
(56, 1, 'logout', '', '2026-07-13 03:38:27'),
(57, NULL, 'login', 'produsen.inovasi2@satria.local', '2026-07-13 03:38:32'),
(58, NULL, 'logout', '', '2026-07-13 04:12:44'),
(59, 1, 'login', 'admin@satria.local', '2026-07-13 04:12:49'),
(60, 1, 'dataset_update', '15', '2026-07-13 06:23:15'),
(61, 1, 'dataset_update', '15', '2026-07-13 06:23:53'),
(62, 1, 'dataset_update', '11', '2026-07-13 06:25:47'),
(63, 1, 'dataset_create', 'Jumlah Peneliti Berdasarkan Jenjang Jabatan', '2026-07-13 06:28:05'),
(64, 1, 'dataset_create', 'Data Analis Kebijakan BRIDA Jawa Timur', '2026-07-13 06:30:04'),
(65, 1, 'dataset_update', '5', '2026-07-13 06:31:13'),
(66, 1, 'dataset_create', 'Publikasi Ilmiah dan Repositori Ilmiah', '2026-07-13 06:33:07'),
(67, 1, 'dataset_update', '9', '2026-07-13 06:34:05'),
(68, 1, 'dataset_create', 'Naskah Kebijakan', '2026-07-13 06:35:40'),
(69, 1, 'dataset_update', '4', '2026-07-13 06:36:20'),
(70, 1, 'dataset_create', 'Daftar Hasil Riset Yang Dilakukan', '2026-07-13 06:37:33'),
(71, 1, 'dataset_create', 'Indeks Inovasi Daerah', '2026-07-13 06:39:00'),
(72, 1, 'dataset_create', 'Publikasi Jurnal', '2026-07-13 06:40:04'),
(73, 1, 'dataset_create', 'Inovasi Daerah', '2026-07-13 06:41:19'),
(74, 1, 'dataset_create', 'Inovasi yang Dikirim Dalam Innovative Government Award', '2026-07-13 06:42:55'),
(75, 1, 'dataset_create', 'Anggaran Riset', '2026-07-13 06:45:03'),
(76, 1, 'dataset_create', 'Perjanjian Kerjasama', '2026-07-13 06:46:59'),
(77, 1, 'logout', '', '2026-07-13 07:35:59'),
(78, 1, 'login', 'admin@satria.local', '2026-07-13 08:04:35'),
(79, 1, 'dataset_approve', 'dataset:26\nDisetujui oleh verifikator', '2026-07-13 08:05:00'),
(80, 1, 'logout', '', '2026-07-13 08:13:10'),
(81, 5, 'login', 'verifikator@satria.local', '2026-07-13 08:13:16'),
(82, 5, 'logout', '', '2026-07-13 08:22:36'),
(83, 5, 'login', 'verifikator@satria.local', '2026-07-13 08:22:42'),
(84, 5, 'logout', '', '2026-07-13 08:22:46'),
(85, 1, 'login', 'admin@satria.local', '2026-07-13 08:22:51'),
(86, 1, 'login', 'admin@satria.local', '2026-07-14 00:41:09'),
(87, 1, 'login', 'admin@satria.local', '2026-07-15 02:43:46'),
(88, 1, 'login', 'admin@satria.local', '2026-07-15 02:52:33'),
(89, 1, 'dataset_create', 'Data Analis Kebijakan BRIDA Jawa Timur', '2026-07-15 06:58:59'),
(90, 1, 'logout', '', '2026-07-15 07:01:21'),
(91, 1, 'login', 'admin@satria.local', '2026-07-15 07:01:38'),
(92, 1, 'dataset_delete', '17', '2026-07-15 07:20:07'),
(93, 1, 'login', 'admin@satria.local', '2026-07-16 00:45:49'),
(94, 1, 'dataset_create', 'Anggaran Riset', '2026-07-16 00:47:40'),
(95, 1, 'dataset_delete', '28', '2026-07-16 01:18:04'),
(96, 1, 'dataset_update', '25', '2026-07-16 01:18:21'),
(97, 1, 'dataset_update', '16', '2026-07-16 01:22:14'),
(98, 1, 'dataset_update', '15', '2026-07-16 01:22:52'),
(99, 1, 'dataset_update', '21', '2026-07-16 01:23:16'),
(100, 1, 'dataset_update', '23', '2026-07-16 01:23:38'),
(101, 1, 'dataset_update', '24', '2026-07-16 01:24:22'),
(102, 1, 'dataset_update', '9', '2026-07-16 01:25:04'),
(103, 1, 'dataset_update', '18', '2026-07-16 01:27:06'),
(104, 1, 'dataset_update', '22', '2026-07-16 01:40:06'),
(105, 1, 'dataset_update', '5', '2026-07-16 01:40:46'),
(106, 1, 'dataset_update', '20', '2026-07-16 01:41:11'),
(107, 1, 'dataset_update', '19', '2026-07-16 01:41:33'),
(108, 1, 'dataset_delete', '10', '2026-07-16 01:41:53'),
(109, 1, 'dataset_create', 'Anggaran Riset Jawa Timur', '2026-07-16 01:44:40'),
(110, 1, 'login', 'admin@satria.local', '2026-07-16 03:18:26'),
(111, 1, 'dataset_create', 'Anggaran Riset', '2026-07-16 03:19:31'),
(112, 1, 'dataset_create', 'Data Fiktif Percobaan', '2026-07-16 03:34:49'),
(113, 1, 'dataset_create', 'Data Fiktif Percobaan', '2026-07-16 03:35:37'),
(114, 1, 'logout', '', '2026-07-16 03:41:32'),
(115, 1, 'login', 'admin@satria.local', '2026-07-16 03:45:23'),
(116, 1, 'dataset_delete_theme', 'Sekretariat\nAnggaran Riset\n30,25', '2026-07-16 03:47:13'),
(117, 1, 'dataset_delete_theme', 'Sekretariat\nData Fiktif Percobaan\n32,31', '2026-07-16 03:47:21'),
(118, 1, 'dataset_delete_theme', 'Invensi Inovasi\nPublikasi Ilmiah dan Repositori Ilmiah\n18', '2026-07-16 03:47:48'),
(119, 1, 'dataset_update', '22', '2026-07-16 03:48:04'),
(120, 1, 'dataset_update', '19', '2026-07-16 03:48:44'),
(121, 1, 'dataset_update', '4', '2026-07-16 03:49:07'),
(122, 1, 'dataset_update', '4', '2026-07-16 03:49:58'),
(123, 1, 'dataset_update', '4', '2026-07-16 03:50:08'),
(124, 1, 'dataset_delete_theme', 'Lainnya\nAnggaran Riset Jawa Timur\n6', '2026-07-16 03:50:28'),
(125, 1, 'dataset_update', '7', '2026-07-16 03:50:42'),
(126, 1, 'dataset_delete_theme', 'Lainnya\nIndeks Inovasi Daerah Jawa Timur\n14', '2026-07-16 03:50:48'),
(127, 1, 'dataset_delete_theme', 'Lainnya\nJumlah Peneliti Berdasarkan Jabatan\n12', '2026-07-16 03:50:53'),
(128, 1, 'dataset_delete_theme', 'Lainnya\nPerjanjian Kerja\n1', '2026-07-16 03:51:03'),
(129, 1, 'dataset_delete_theme', 'Lainnya\nRepositori Ilmiah\n3', '2026-07-16 03:51:16'),
(130, 1, 'dataset_delete_theme', 'Lainnya\nPublikasi Ilmiah\n2', '2026-07-16 03:51:25'),
(131, 1, 'dataset_update', '26', '2026-07-16 03:51:37'),
(132, 1, 'dataset_delete_theme', 'Lainnya\nPublikasi pada Jurnal Ilmiah\n8', '2026-07-16 03:51:44'),
(133, 1, 'logout', '', '2026-07-16 03:55:45'),
(134, 1, 'login', 'admin@satria.local', '2026-07-16 04:01:11'),
(135, 1, 'login', 'admin@satria.local', '2026-07-16 06:28:41'),
(136, 1, 'logout', '', '2026-07-16 06:46:03'),
(137, 1, 'login', 'admin@satria.local', '2026-07-16 06:48:26'),
(138, 1, 'logout', '', '2026-07-16 07:33:01'),
(139, 1, 'login', 'admin@satria.local', '2026-07-16 07:36:33'),
(140, 1, 'login', 'admin@satria.local', '2026-07-20 01:39:19'),
(141, 1, 'logout', '', '2026-07-20 04:54:08'),
(142, 1, 'login', 'admin@satria.local', '2026-07-20 04:54:51'),
(143, 1, 'dataset_create', 'Hak Kekayaan Intelektual', '2026-07-20 04:55:55'),
(144, 1, 'logout', '', '2026-07-20 04:56:01'),
(145, 1, 'login', 'admin@satria.local', '2026-07-20 04:56:10'),
(146, 1, 'dataset_delete', '33', '2026-07-20 04:56:21'),
(147, 1, 'logout', '', '2026-07-20 04:56:54'),
(148, 1, 'login', 'admin@satria.local', '2026-07-20 05:07:17'),
(149, 1, 'logout', '', '2026-07-20 05:39:34'),
(150, 1, 'login', 'admin@satria.local', '2026-07-20 05:43:15'),
(151, 1, 'logout', '', '2026-07-20 05:56:53'),
(152, 1, 'login', 'admin@satria.local', '2026-07-20 05:59:52'),
(153, 1, 'logout', '', '2026-07-20 06:03:56'),
(154, 1, 'login', 'admin@satria.local', '2026-07-20 06:11:23'),
(155, 1, 'logout', '', '2026-07-20 06:13:00'),
(156, 1, 'login', 'admin@satria.local', '2026-07-20 06:34:52'),
(157, 1, 'logout', '', '2026-07-20 06:35:52'),
(158, 1, 'login', 'admin@satria.local', '2026-07-20 06:42:41'),
(159, 1, 'logout', '', '2026-07-20 07:08:14'),
(160, 1, 'login', 'admin@satria.local', '2026-07-20 07:08:50'),
(161, 1, 'logout', '', '2026-07-20 07:09:21'),
(162, 1, 'login', 'admin@satria.local', '2026-07-20 07:11:53'),
(163, 1, 'logout', '', '2026-07-20 07:12:07'),
(164, 1, 'login', 'admin@satria.local', '2026-07-20 07:29:24'),
(165, 1, 'dataset_update', '23', '2026-07-20 07:29:49'),
(166, 1, 'dataset_update', '24', '2026-07-20 07:30:14'),
(167, 1, 'logout', '', '2026-07-20 07:30:55'),
(168, 1, 'login', 'admin@satria.local', '2026-07-20 07:51:43'),
(169, 1, 'login', 'admin@satria.local', '2026-07-21 00:49:15'),
(170, 1, 'logout', '', '2026-07-21 04:25:48'),
(171, 1, 'login', 'admin@satria.local', '2026-07-21 04:25:51'),
(172, 1, 'login', 'admin@satria.local', '2026-07-21 04:56:04'),
(173, 1, 'logout', '', '2026-07-21 05:01:04'),
(174, 1, 'login', 'admin@satria.local', '2026-07-21 05:01:07'),
(175, 1, 'logout', '', '2026-07-21 06:33:31'),
(176, 1, 'login', 'admin@satria.local', '2026-07-21 06:33:36'),
(177, 1, 'login', 'admin@satria.local', '2026-07-22 02:20:18'),
(178, 1, 'user_delete', '3', '2026-07-22 02:20:46'),
(179, 1, 'user_delete', '7', '2026-07-22 02:22:29'),
(180, 1, 'user_delete', '9', '2026-07-22 02:22:33'),
(181, 1, 'user_delete', '11', '2026-07-22 02:22:36'),
(182, 1, 'user_update', '10', '2026-07-22 02:22:51'),
(183, 1, 'user_update', '8', '2026-07-22 02:23:18'),
(184, 1, 'user_update', '8', '2026-07-22 02:23:25'),
(185, 1, 'user_update', '10', '2026-07-22 02:28:16'),
(186, 1, 'user_update', '6', '2026-07-22 02:28:41'),
(187, 1, 'logout', '', '2026-07-22 02:33:16'),
(188, 1, 'login', 'admin@satria.local', '2026-07-22 02:33:19'),
(189, 1, 'logout', '', '2026-07-22 02:50:41'),
(190, 5, 'login', 'verifikator@satria.local', '2026-07-22 02:50:48'),
(191, 5, 'logout', '', '2026-07-22 02:50:57'),
(192, 10, 'login', 'litbang@satria.local', '2026-07-22 02:51:07'),
(193, 10, 'logout', '', '2026-07-22 03:06:38'),
(194, 1, 'login', 'admin@satria.local', '2026-07-22 03:06:41'),
(195, 1, 'logout', '', '2026-07-22 03:13:11'),
(196, 6, 'login', 'sekretariat@satria.local', '2026-07-22 03:13:17'),
(197, 6, 'logout', '', '2026-07-22 03:13:52'),
(198, 1, 'login', 'admin@satria.local', '2026-07-22 03:13:55'),
(199, 1, 'logout', '', '2026-07-22 03:14:14'),
(200, 6, 'login', 'sekretariat@satria.local', '2026-07-22 03:14:20'),
(201, 6, 'logout', '', '2026-07-22 03:15:18'),
(202, 1, 'login', 'admin@satria.local', '2026-07-22 03:15:21'),
(203, 1, 'login', 'admin@satria.local', '2026-07-22 03:25:24'),
(204, 1, 'logout', '', '2026-07-22 03:41:20'),
(205, 8, 'login', 'inovasi@satria.local', '2026-07-22 03:42:03'),
(206, 8, 'logout', '', '2026-07-22 04:12:44'),
(207, 1, 'login', 'admin@satria.local', '2026-07-22 04:12:47'),
(208, 1, 'logout', '', '2026-07-22 04:24:18'),
(209, 8, 'login', 'inovasi@satria.local', '2026-07-22 04:24:25'),
(210, 8, 'logout', '', '2026-07-22 04:26:09'),
(211, 1, 'login', 'admin@satria.local', '2026-07-22 04:26:13'),
(212, 1, 'logout', '', '2026-07-22 04:27:14'),
(213, 8, 'login', 'inovasi@satria.local', '2026-07-22 04:27:25'),
(214, 8, 'logout', '', '2026-07-22 04:30:51'),
(215, 1, 'login', 'admin@satria.local', '2026-07-22 04:30:55'),
(216, 1, 'logout', '', '2026-07-22 04:31:17'),
(217, 8, 'login', 'inovasi@satria.local', '2026-07-22 04:31:24'),
(218, 1, 'login', 'admin@satria.local', '2026-07-23 00:15:34'),
(219, 1, 'logout', '', '2026-07-23 00:16:53'),
(220, 8, 'login', 'inovasi@satria.local', '2026-07-23 00:17:01'),
(221, 8, 'logout', '', '2026-07-23 00:20:17'),
(222, 1, 'login', 'admin@satria.local', '2026-07-23 00:20:31'),
(223, 1, 'logout', '', '2026-07-23 00:26:52'),
(224, 1, 'login', 'admin@satria.local', '2026-07-23 00:28:48'),
(225, 1, 'login', 'admin@satria.local', '2026-07-23 00:28:49'),
(226, 1, 'logout', '', '2026-07-23 00:51:33'),
(227, 8, 'login', 'inovasi@satria.local', '2026-07-23 00:51:44'),
(228, 8, 'logout', '', '2026-07-23 00:52:08'),
(229, 1, 'login', 'admin@satria.local', '2026-07-23 01:28:36'),
(230, 1, 'logout', '', '2026-07-23 03:50:54'),
(231, 1, 'login', 'admin@satria.local', '2026-07-23 03:50:57'),
(232, 1, 'logout', '', '2026-07-23 06:13:09'),
(233, 1, 'login', 'admin@satria.local', '2026-07-23 07:04:33'),
(234, 1, 'logout', '', '2026-07-23 07:10:57'),
(235, 1, 'login', 'admin@satria.local', '2026-07-23 07:11:01'),
(236, 1, 'logout', '', '2026-07-23 07:14:14'),
(237, 8, 'login', 'inovasi@satria.local', '2026-07-23 07:14:22'),
(238, 8, 'logout', '', '2026-07-23 07:14:54'),
(239, 1, 'login', 'admin@satria.local', '2026-07-23 07:14:58'),
(240, 1, 'logout', '', '2026-07-23 07:15:11'),
(241, 8, 'login', 'inovasi@satria.local', '2026-07-23 07:15:17'),
(242, 8, 'logout', '', '2026-07-23 07:18:06'),
(243, 1, 'login', 'admin@satria.local', '2026-07-23 07:18:09'),
(244, 1, 'logout', '', '2026-07-23 07:51:46'),
(245, 6, 'login', 'sekretariat@satria.local', '2026-07-23 07:51:54'),
(246, 6, 'logout', '', '2026-07-23 08:04:13'),
(247, 1, 'login', 'admin@satria.local', '2026-07-23 08:04:17'),
(248, 1, 'logout', '', '2026-07-23 08:04:42'),
(249, 8, 'login', 'inovasi@satria.local', '2026-07-23 08:04:47'),
(250, 1, 'login', 'admin@satria.local', '2026-07-28 02:02:36'),
(251, 1, 'logout', '', '2026-07-28 02:39:56'),
(252, 1, 'login', 'admin@satria.local', '2026-07-28 02:40:12'),
(253, 1, 'logout', '', '2026-07-28 06:22:35'),
(254, 1, 'login', 'admin@satria.local', '2026-07-28 06:33:27'),
(255, 1, 'logout', '', '2026-07-28 06:34:24'),
(256, 1, 'login', 'admin@satria.local', '2026-07-28 06:42:30'),
(257, 1, 'logout', '', '2026-07-28 06:54:42'),
(258, 1, 'login', 'admin@satria.local', '2026-07-28 06:55:15'),
(259, 1, 'logout', '', '2026-07-28 06:59:03'),
(260, 1, 'login', 'admin@satria.local', '2026-07-28 06:59:06'),
(261, 1, 'login', 'admin@satria.local', '2026-07-28 16:47:20'),
(262, 1, 'login', 'admin@satria.local', '2026-07-28 16:50:18'),
(263, 1, 'login', 'admin@satria.local', '2026-07-29 02:03:27'),
(264, 1, 'logout', '', '2026-07-29 02:04:44'),
(265, 1, 'login', 'admin@satria.local', '2026-07-29 02:04:54'),
(266, 1, 'logout', '', '2026-07-29 02:05:12'),
(267, 6, 'login', 'sekretariat@satria.local', '2026-07-29 02:05:22'),
(268, 6, 'logout', '', '2026-07-29 02:09:44'),
(269, 1, 'login', 'admin@satria.local', '2026-07-29 02:09:49'),
(270, 1, 'logout', '', '2026-07-29 02:10:36'),
(271, 6, 'login', 'sekretariat@satria.local', '2026-07-29 02:10:44'),
(272, 6, 'logout', '', '2026-07-29 02:13:18'),
(273, 8, 'login', 'inovasi@satria.local', '2026-07-29 02:13:29'),
(274, 8, 'logout', '', '2026-07-29 02:25:36'),
(275, 8, 'login', 'inovasi@satria.local', '2026-07-29 02:25:41'),
(276, 8, 'logout', '', '2026-07-29 02:25:45'),
(277, 8, 'login', 'inovasi@satria.local', '2026-07-29 02:26:45'),
(278, 8, 'logout', '', '2026-07-29 03:01:24'),
(279, 1, 'login', 'admin@satria.local', '2026-07-29 03:01:32'),
(280, 1, 'logout', '', '2026-07-29 03:03:16'),
(281, 6, 'login', 'sekretariat@satria.local', '2026-07-29 03:03:25'),
(282, 6, 'logout', '', '2026-07-29 03:07:03'),
(283, 1, 'login', 'admin@satria.local', '2026-07-29 03:07:08'),
(284, 1, 'logout', '', '2026-07-29 03:07:59'),
(285, 6, 'login', 'sekretariat@satria.local', '2026-07-29 03:08:05'),
(286, 6, 'dataset_create', 'Dokumen Percobaan', '2026-07-29 03:10:21'),
(287, 6, 'logout', '', '2026-07-29 03:10:36'),
(288, 1, 'login', 'admin@satria.local', '2026-07-29 03:10:44'),
(289, 1, 'dataset_revise', 'dataset:34\nKehidupan Bagi J', '2026-07-29 03:11:45'),
(290, 1, 'logout', '', '2026-07-29 03:11:49'),
(291, 6, 'login', 'sekretariat@satria.local', '2026-07-29 03:11:55'),
(292, 6, 'dataset_submit_revision', 'dataset:34', '2026-07-29 03:12:23'),
(293, 6, 'logout', '', '2026-07-29 03:12:39'),
(294, 1, 'login', 'admin@satria.local', '2026-07-29 03:12:44'),
(295, 1, 'dataset_approve', 'dataset:34\nDisetujui oleh verifikator', '2026-07-29 03:13:01'),
(296, 1, 'logout', '', '2026-07-29 03:15:25'),
(297, 6, 'login', 'sekretariat@satria.local', '2026-07-29 03:15:32'),
(298, 6, 'logout', '', '2026-07-29 03:41:31'),
(299, 4, 'login', 'pimpinan@satria.local', '2026-07-29 03:41:45'),
(300, 4, 'logout', '', '2026-07-29 03:51:11'),
(301, 4, 'login', 'pimpinan@satria.local', '2026-07-29 03:51:15'),
(302, 4, 'logout', '', '2026-07-29 04:56:05'),
(303, 6, 'login', 'sekretariat@satria.local', '2026-07-29 04:56:10'),
(304, 6, 'logout', '', '2026-07-29 06:08:58'),
(305, 1, 'login', 'admin@satria.local', '2026-07-29 06:09:03'),
(306, 1, 'logout', '', '2026-07-29 07:27:55'),
(307, 1, 'login', 'admin@satria.local', '2026-07-29 07:59:07'),
(308, 1, 'logout', '', '2026-07-29 07:59:53'),
(309, 1, 'login', 'admin@satria.local', '2026-07-29 08:01:10'),
(310, 1, 'logout', '', '2026-07-29 08:06:57'),
(311, 6, 'login', 'sekretariat@satria.local', '2026-07-29 08:07:02'),
(312, 6, 'logout', '', '2026-07-29 08:09:03'),
(313, 1, 'login', 'admin@satria.local', '2026-07-29 08:09:10'),
(314, 1, 'logout', '', '2026-07-29 08:09:21'),
(315, 5, 'login', 'verifikator@satria.local', '2026-07-29 08:09:26'),
(316, 5, 'logout', '', '2026-07-29 08:10:32'),
(317, 4, 'login', 'pimpinan@satria.local', '2026-07-29 08:10:37'),
(318, 4, 'feedback_send', 'dataset:23\nOwi', '2026-07-29 08:11:25'),
(319, 4, 'logout', '', '2026-07-29 08:11:31'),
(320, 1, 'login', 'admin@satria.local', '2026-07-29 08:11:50'),
(321, 1, 'logout', '', '2026-07-29 08:13:31'),
(322, 5, 'login', 'verifikator@satria.local', '2026-07-29 08:21:33'),
(323, 5, 'logout', '', '2026-07-29 08:31:19'),
(324, 1, 'login', 'admin@satria.local', '2026-07-29 08:32:10'),
(325, 1, 'logout', '', '2026-07-29 08:33:12'),
(326, 1, 'login', 'admin@satria.local', '2026-07-29 08:36:48'),
(327, 1, 'dataset_approve', 'dataset:29\nDisetujui oleh verifikator', '2026-07-29 08:37:59'),
(328, 1, 'dataset_revise', 'dataset:27\ntolong revisi', '2026-07-29 08:38:15'),
(329, 1, 'logout', '', '2026-07-29 08:38:51'),
(330, 1, 'login', 'admin@satria.local', '2026-07-29 08:39:40'),
(331, 1, 'logout', '', '2026-07-29 08:42:36'),
(332, 6, 'login', 'sekretariat@satria.local', '2026-07-29 08:42:45'),
(333, 6, 'logout', '', '2026-07-29 08:43:22'),
(334, 1, 'login', 'admin@satria.local', '2026-08-04 01:48:32'),
(335, 1, 'user_reset_password', '10', '2026-08-04 01:49:11'),
(336, 1, 'logout', '', '2026-08-04 01:50:43'),
(337, 10, 'login', 'litbang@satria.local', '2026-08-04 01:50:52'),
(338, 10, 'logout', '', '2026-08-04 01:51:02'),
(339, 10, 'login', 'litbang@satria.local', '2026-08-04 01:51:28'),
(340, 10, 'logout', '', '2026-08-04 01:51:34'),
(341, 1, 'login', 'admin@satria.local', '2026-08-04 01:51:51'),
(342, 1, 'user_reset_password', '10', '2026-08-04 01:52:12'),
(343, 1, 'login', 'admin@satria.local', '2026-08-04 03:21:53'),
(344, 1, 'login', 'admin@satria.local', '2026-08-04 05:51:47'),
(345, 1, 'logout', '', '2026-08-04 06:01:04'),
(346, 10, 'login', 'litbang@satria.local', '2026-08-04 06:01:27'),
(347, 1, 'login', 'admin@satria.local', '2026-08-10 00:55:22'),
(348, 1, 'user_reset_password', '10', '2026-08-10 06:10:13'),
(349, 1, 'user_reset_password', '8', '2026-08-10 06:10:36'),
(350, 1, 'user_reset_password', '6', '2026-08-10 06:10:52'),
(351, 1, 'user_reset_password', '5', '2026-08-10 06:11:07'),
(352, 1, 'user_reset_password', '4', '2026-08-10 06:11:24'),
(353, 1, 'user_reset_password', '1', '2026-08-10 06:11:38'),
(354, 1, 'logout', '', '2026-08-10 08:19:34'),
(355, 1, 'login', 'admin@satria.local', '2026-08-10 08:30:59'),
(356, 1, 'login', 'admin@satria.local', '2026-08-11 01:38:02'),
(357, 1, 'logout', '', '2026-08-11 01:42:36'),
(358, 4, 'login', 'pimpinan@satria.local', '2026-08-11 01:42:45'),
(359, 4, 'logout', '', '2026-08-11 02:13:12'),
(360, 1, 'login', 'admin@satria.local', '2026-08-11 02:13:18'),
(361, 1, 'logout', '', '2026-08-11 02:15:22'),
(362, 4, 'login', 'pimpinan@satria.local', '2026-08-11 02:15:30'),
(363, 4, 'logout', '', '2026-08-11 03:03:56'),
(364, 4, 'login', 'pimpinan@satria.local', '2026-08-11 03:04:03'),
(365, 4, 'logout', '', '2026-08-11 03:04:07'),
(366, 1, 'login', 'admin@satria.local', '2026-08-11 03:04:16'),
(367, 1, 'logout', '', '2026-08-11 03:08:59'),
(368, NULL, 'contact_message', 'From: Ramadhani Ahmad <ramadhani.ahmad.contact@gmail.com>\nSubject: Mencoba Fitur\nMessage: asdfasdfasdf', '2026-08-11 03:22:58'),
(369, 1, 'login', 'admin@satria.local', '2026-08-11 03:23:04'),
(370, 1, 'login', 'admin@satria.local', '2026-08-11 07:29:58'),
(371, 1, 'logout', '', '2026-08-11 07:30:18'),
(372, 6, 'login', 'sekretariat@satria.local', '2026-08-11 07:30:29'),
(373, 6, 'logout', '', '2026-08-11 07:31:06'),
(374, 1, 'login', 'admin@satria.local', '2026-08-11 07:31:12'),
(375, 1, 'logout', '', '2026-08-11 07:39:50'),
(376, 6, 'login', 'sekretariat@satria.local', '2026-08-11 07:40:00'),
(377, 6, 'logout', '', '2026-08-11 07:40:16'),
(378, 6, 'login', 'sekretariat@satria.local', '2026-08-11 07:42:31'),
(379, 6, 'logout', '', '2026-08-11 07:42:39'),
(380, 1, 'login', 'admin@satria.local', '2026-08-11 07:42:45'),
(381, 1, 'logout', '', '2026-08-11 07:52:03'),
(382, 6, 'login', 'sekretariat@satria.local', '2026-08-11 07:53:44'),
(383, 6, 'logout', '', '2026-08-11 07:53:54'),
(384, 1, 'login', 'admin@satria.local', '2026-08-11 07:54:00'),
(385, 1, 'logout', '', '2026-08-11 07:55:22'),
(386, 6, 'login', 'sekretariat@satria.local', '2026-08-11 07:55:30'),
(387, 6, 'logout', '', '2026-08-11 07:57:06'),
(388, 1, 'login', 'admin@satria.local', '2026-08-11 07:57:12'),
(389, 1, 'logout', '', '2026-08-11 07:58:15'),
(390, 6, 'login', 'sekretariat@satria.local', '2026-08-11 07:58:25'),
(391, 6, 'logout', '', '2026-08-11 08:17:20'),
(392, 1, 'login', 'admin@satria.local', '2026-08-11 08:17:25'),
(393, 1, 'logout', '', '2026-08-11 08:28:41'),
(394, 6, 'login', 'sekretariat@satria.local', '2026-08-11 08:28:50'),
(395, 6, 'logout', '', '2026-08-11 08:30:00'),
(396, 1, 'login', 'admin@satria.local', '2026-08-11 08:30:07'),
(397, 1, 'logout', '', '2026-08-11 08:30:58'),
(398, 6, 'login', 'sekretariat@satria.local', '2026-08-11 08:31:04'),
(399, 6, 'login', 'sekretariat@satria.local', '2026-08-12 01:18:04'),
(400, 6, 'logout', '', '2026-08-12 02:32:01'),
(401, 6, 'login', 'sekretariat@satria.local', '2026-08-12 02:32:06'),
(402, 6, 'logout', '', '2026-08-12 02:38:29'),
(403, 1, 'login', 'admin@satria.local', '2026-08-12 02:38:46'),
(404, 1, 'logout', '', '2026-08-12 02:54:20'),
(405, 1, 'login', 'admin@satria.local', '2026-08-12 02:54:37'),
(406, 1, 'logout', '', '2026-08-12 02:54:49'),
(407, 10, 'login', 'litbang@satria.local', '2026-08-12 02:54:53'),
(408, 10, 'logout', '', '2026-08-12 02:56:07'),
(409, 6, 'login', 'sekretariat@satria.local', '2026-08-12 02:56:17'),
(410, 6, 'logout', '', '2026-08-12 02:58:11'),
(411, 1, 'login', 'admin@satria.local', '2026-08-12 02:58:18'),
(412, 1, 'login', 'admin@satria.local', '2026-08-13 01:28:21'),
(413, 1, 'logout', '', '2026-08-13 01:44:15'),
(414, 6, 'login', 'sekretariat@satria.local', '2026-08-13 01:44:23'),
(415, 6, 'logout', '', '2026-08-13 01:45:51'),
(416, 1, 'login', 'admin@satria.local', '2026-08-13 01:45:55'),
(417, 1, 'logout', '', '2026-08-13 02:23:00'),
(418, 4, 'login', 'pimpinan@satria.local', '2026-08-13 02:23:08'),
(419, 4, 'logout', '', '2026-08-13 02:26:11'),
(420, 1, 'login', 'admin@satria.local', '2026-08-13 02:26:19'),
(421, 1, 'user_create', 'adminep@satria.local', '2026-08-13 02:27:45'),
(422, 1, 'logout', '', '2026-08-13 02:27:53'),
(423, NULL, 'login', 'adminep@satria.local', '2026-08-13 02:28:04'),
(424, NULL, 'user_reset_password', '12', '2026-08-13 02:29:02'),
(425, NULL, 'user_reset_password', '12', '2026-08-13 02:29:19'),
(427, 1, 'login', 'admin@satria.local', '2026-08-19 02:55:06'),
(428, 1, 'logout', '', '2026-08-19 03:24:48'),
(429, 10, 'login', 'litbang@satria.local', '2026-08-19 03:24:57'),
(430, 10, 'logout', '', '2026-08-19 03:25:13'),
(431, 10, 'login', 'litbang@satria.local', '2026-08-19 03:25:19'),
(432, 10, 'logout', '', '2026-08-19 03:33:13'),
(433, 6, 'login', 'sekretariat@satria.local', '2026-08-19 03:33:21'),
(434, 6, 'logout', '', '2026-08-19 03:43:26'),
(435, 1, 'login', 'admin@satria.local', '2026-08-19 03:43:31'),
(436, 1, 'logout', '', '2026-08-19 03:44:37'),
(437, 10, 'login', 'litbang@satria.local', '2026-08-19 03:44:42'),
(438, 10, 'logout', '', '2026-08-19 03:47:56'),
(439, 1, 'login', 'admin@satria.local', '2026-08-19 03:48:00'),
(440, 1, 'logout', '', '2026-08-19 03:48:15'),
(441, 1, 'login', 'admin@satria.local', '2026-08-19 03:48:18'),
(442, 1, 'logout', '', '2026-08-19 03:48:30'),
(443, 4, 'login', 'pimpinan@satria.local', '2026-08-19 03:48:38'),
(444, 4, 'logout', '', '2026-08-19 03:50:25'),
(445, 10, 'login', 'litbang@satria.local', '2026-08-19 03:50:33'),
(446, 10, 'logout', '', '2026-08-19 03:52:07'),
(447, 5, 'login', 'verifikator@satria.local', '2026-08-19 03:52:14'),
(448, 5, 'logout', '', '2026-08-19 03:58:40'),
(449, 1, 'login', 'admin@satria.local', '2026-08-19 03:59:33'),
(450, 1, 'logout', '', '2026-08-19 04:08:48'),
(451, 8, 'login', 'inovasi@satria.local', '2026-08-19 04:11:23'),
(452, 8, 'logout', '', '2026-08-19 04:11:56'),
(453, 1, 'login', 'admin@satria.local', '2026-08-19 04:12:01'),
(454, 1, 'user_create', 'magang@satria.local', '2026-08-19 04:12:40'),
(455, 1, 'logout', '', '2026-08-19 04:19:40'),
(456, 4, 'login', 'pimpinan@satria.local', '2026-08-19 04:19:47'),
(457, 4, 'logout', '', '2026-08-19 04:23:20'),
(458, 1, 'login', 'admin@satria.local', '2026-08-19 04:23:24'),
(459, 1, 'logout', '', '2026-08-19 04:46:55'),
(460, 4, 'login', 'pimpinan@satria.local', '2026-08-19 04:47:01'),
(461, 4, 'logout', '', '2026-08-19 04:47:27'),
(462, 1, 'login', 'admin@satria.local', '2026-08-19 04:47:32'),
(463, 1, 'logout', '', '2026-08-19 04:47:42'),
(464, 4, 'login', 'pimpinan@satria.local', '2026-08-19 04:54:17'),
(465, 4, 'logout', '', '2026-08-19 06:02:59'),
(466, 1, 'login', 'admin@satria.local', '2026-08-19 06:03:28'),
(467, 1, 'login', 'admin@satria.local', '2026-08-19 06:03:48'),
(468, 1, 'dataset_update', '27', '2026-08-19 06:06:18'),
(469, 1, 'dataset_create', 'Data Analis Kebijakan BRIDA Jawa Timur', '2026-08-19 06:10:18'),
(470, 1, 'login', 'admin@satria.local', '2026-08-19 07:13:04'),
(471, 1, 'login', 'admin@satria.local', '2026-08-19 07:23:42'),
(472, 1, 'login', 'admin@satria.local', '2026-08-19 07:27:12'),
(473, 1, 'dataset_update', '29', '2026-08-19 07:42:54'),
(474, 1, 'dataset_update', '29', '2026-08-19 07:44:25'),
(475, 1, 'dataset_update', '27', '2026-08-19 07:45:36'),
(476, 1, 'dataset_delete_theme', 'Sekretariat\nDokumen Percobaan\n34', '2026-08-19 07:45:44'),
(477, 1, 'dataset_update', '11', '2026-08-19 07:46:58'),
(478, 8, 'login', 'inovasi@satria.local', '2026-08-19 08:03:44'),
(479, 1, 'dataset_update', '16', '2026-08-19 08:10:27'),
(480, 1, 'dataset_update', '11', '2026-08-19 08:11:09'),
(481, 1, 'dataset_update', '26', '2026-08-19 08:13:26'),
(482, 1, 'dataset_update', '20', '2026-08-19 08:15:09'),
(483, 1, 'dataset_update', '19', '2026-08-19 08:15:53'),
(484, 1, 'dataset_update', '4', '2026-08-19 08:17:00'),
(485, 1, 'dataset_create', 'Daftar Inovasi Daerah Dengan Kematangan Tinggi', '2026-08-19 08:24:37'),
(486, 1, 'dataset_update', '5', '2026-08-19 08:27:32'),
(487, 1, 'dataset_create', 'Daftar Inovasi Daerah', '2026-08-19 08:33:42'),
(488, 1, 'dataset_update', '15', '2026-08-19 09:01:32'),
(489, 1, 'dataset_create', 'Daftar Hasil Riset dan Inovasi Yang Daftarkan HKI', '2026-08-19 09:04:00'),
(490, 1, 'dataset_update', '21', '2026-08-19 09:05:27'),
(491, 1, 'dataset_update', '9', '2026-08-19 09:07:10'),
(492, 1, 'dataset_create', 'Daftar Publikasi pada Jurnal Ilmiah', '2026-08-19 09:10:21'),
(493, 1, 'dataset_update', '22', '2026-08-19 09:12:50'),
(494, 1, 'dataset_create', 'Repositori Ilmiah', '2026-08-19 09:16:02'),
(495, 1, 'dataset_delete_theme', 'Invensi Inovasi\nInovasi yang Dikirim Dalam Innovative Government Award\n24', '2026-08-19 09:18:37'),
(496, 1, 'dataset_update', '22', '2026-08-19 09:19:58'),
(497, 1, 'dataset_update', '22', '2026-08-19 09:20:10'),
(498, 1, 'dataset_update', '40', '2026-08-19 09:20:23'),
(499, 1, 'dataset_delete_theme', 'Invensi Inovasi\nInovasi Daerah\n23', '2026-08-19 09:21:07'),
(500, 1, 'user_reset_password', '10', '2026-08-19 09:47:39'),
(501, 1, 'user_reset_password', '8', '2026-08-19 09:50:20'),
(502, 1, 'user_reset_password', '6', '2026-08-19 09:51:14'),
(503, 1, 'login', 'admin@satria.local', '2026-08-19 10:29:45'),
(504, 1, 'login', 'admin@satria.local', '2026-08-19 10:32:25'),
(505, 1, 'dataset_create', 'Daftar Inovasi yang dikirim dalam IGA', '2026-08-19 10:34:15'),
(506, 1, 'login', 'admin@satria.local', '2026-08-19 10:40:41'),
(507, 1, 'guidebook_update', 'Guidebook SATRIA BRIDA.pdf', '2026-08-19 10:47:06'),
(508, 1, 'logout', '', '2026-08-19 10:47:11'),
(509, 1, 'login', 'admin@satria.local', '2026-08-19 10:47:30'),
(510, 1, 'login', 'admin@satria.local', '2026-08-20 01:49:20'),
(511, 1, 'login', 'admin@satria.local', '2026-08-20 01:50:26'),
(512, 1, 'logout', '', '2026-08-20 01:57:13'),
(513, 1, 'login', 'admin@satria.local', '2026-08-20 01:58:41'),
(514, 1, 'login', 'admin@satria.local', '2026-08-20 01:59:37'),
(515, 1, 'dataset_update', '37', '2026-08-20 02:01:08'),
(516, 1, 'logout', '', '2026-08-20 02:17:24'),
(517, 6, 'login', 'sekretariat@satria.local', '2026-08-20 02:17:34'),
(518, 6, 'logout', '', '2026-08-20 02:19:16'),
(519, 1, 'login', 'admin@satria.local', '2026-08-20 02:19:30'),
(520, 1, 'signature_update', 'Dicky Bayu Nur Rachman, S.I.P.', '2026-08-20 02:27:46'),
(521, 1, 'signature_update', 'Dicky Bayu Nur Rachman, S.I.P., Ramadhani Ahmad S.Kom.', '2026-08-20 02:29:04'),
(522, 1, 'signature_update', 'Dicky Bayu Nur Rachman, S.I.P., Ramadhani Ahmad, Magangan', '2026-08-20 02:29:29'),
(523, 1, 'signature_update', 'Dicky Bayu Nur Rachman, S.I.P., Ramadhani Ahmad, Magangan', '2026-08-20 02:29:38'),
(524, 1, 'signature_update', 'Dicky Bayu Nur Rachman, S.I.P., Ramadhani Ahmad, Magangan, Ga tau siapa dia pokoknya lah', '2026-08-20 02:30:56'),
(525, 1, 'signature_update', 'Dicky Bayu Nur Rachman, S.I.P., Ramadhani Ahmad, Magangan, Ga tau siapa dia pokoknya lah', '2026-08-20 02:39:31'),
(526, 1, 'signature_update', 'Dicky Bayu Nur Rachman, S.I.P., Ramadhani Ahmad, Magang, Ga tau siapa dia pokoknya lah', '2026-08-20 02:51:13'),
(527, 1, 'logout', '', '2026-08-20 02:54:52'),
(528, 6, 'login', 'sekretariat@satria.local', '2026-08-20 02:55:31'),
(529, 6, 'logout', '', '2026-08-20 02:56:51'),
(530, 1, 'login', 'admin@satria.local', '2026-08-20 02:57:03'),
(531, 1, 'logout', '', '2026-08-20 02:58:25'),
(532, 6, 'login', 'sekretariat@satria.local', '2026-08-20 02:58:49'),
(533, 1, 'logout', '', '2026-08-20 03:55:39'),
(534, 6, 'login', 'sekretariat@satria.local', '2026-08-20 03:56:49'),
(535, 1, 'login', 'admin@satria.local', '2026-08-20 05:57:30'),
(536, 6, 'login', 'sekretariat@satria.local', '2026-08-20 06:41:19'),
(537, 6, 'dataset_create', 'Anggaran Riset Jawa Timur', '2026-08-20 06:45:11'),
(538, 6, 'dataset_delete', '42', '2026-08-20 06:45:57'),
(539, 1, 'logout', '', '2026-08-20 06:48:59'),
(540, 8, 'login', 'inovasi@satria.local', '2026-08-20 06:49:57'),
(541, 8, 'logout', '', '2026-08-20 06:54:05'),
(542, 6, 'logout', '', '2026-08-20 06:59:08'),
(543, 1, 'login', 'admin@satria.local', '2026-08-20 06:59:27'),
(544, 1, 'login', 'admin@satria.local', '2026-08-20 07:03:13'),
(545, 8, 'login', 'inovasi@satria.local', '2026-08-20 07:03:29'),
(546, 1, 'logout', '', '2026-08-20 07:05:27'),
(547, 1, 'login', 'admin@satria.local', '2026-08-20 07:05:42'),
(548, 1, 'logout', '', '2026-08-20 07:20:04'),
(549, 10, 'login', 'litbang@satria.local', '2026-08-20 07:20:25'),
(550, 1, 'dataset_update', '22', '2026-08-20 07:29:16'),
(551, 1, 'dataset_create', 'Daftar Rekomendasi Kebijakan yang Dimanfaatkan', '2026-08-20 07:36:14'),
(552, 1, 'dataset_create', 'Daftar Replikasi Inovasi BRIDA', '2026-08-20 07:37:55'),
(553, 1, 'dataset_update', '39', '2026-08-20 07:39:43'),
(554, 1, 'logout', '', '2026-08-20 07:40:59'),
(555, 1, 'login', 'admin@satria.local', '2026-08-20 07:41:52'),
(556, 1, 'logout', '', '2026-08-20 07:42:36'),
(557, 5, 'login', 'verifikator@satria.local', '2026-08-20 07:43:03'),
(558, 5, 'dataset_approve', 'dataset:4\nDisetujui oleh verifikator', '2026-08-20 07:43:17'),
(559, 5, 'dataset_approve', 'dataset:9\nDisetujui oleh verifikator', '2026-08-20 07:43:25'),
(560, 5, 'logout', '', '2026-08-20 07:43:28'),
(561, 1, 'login', 'admin@satria.local', '2026-08-24 01:36:05'),
(562, 1, 'login', 'admin@satria.local', '2026-08-24 03:15:17'),
(563, 1, 'dataset_create', 'Anak Magang', '2026-08-24 03:50:48'),
(564, 1, 'logout', '', '2026-08-24 05:52:55'),
(565, 4, 'login', 'pimpinan@satria.local', '2026-08-24 05:53:03'),
(566, 4, 'logout', '', '2026-08-24 05:53:22'),
(567, 1, 'login', 'admin@satria.local', '2026-08-24 11:30:39'),
(568, 1, 'logout', '', '2026-08-24 11:30:57'),
(569, 1, 'login', 'admin@satria.local', '2026-08-24 11:30:59'),
(570, 1, 'login', 'admin@satria.local', '2026-08-26 01:10:36'),
(571, 1, 'logout', '', '2026-08-26 03:39:46'),
(572, 1, 'login', 'admin@satria.local', '2026-08-26 03:43:26'),
(573, 10, 'login', 'litbang@satria.local', '2026-08-26 03:43:41'),
(574, 10, 'logout', '', '2026-08-26 03:47:12'),
(575, 1, 'logout', '', '2026-08-26 03:48:57'),
(576, 1, 'login', 'admin@satria.local', '2026-08-26 03:49:36'),
(577, 1, 'logout', '', '2026-08-26 03:54:13'),
(578, 1, 'login', 'admin@satria.local', '2026-08-26 03:54:44'),
(579, 1, 'login', 'admin@satria.local', '2026-08-27 02:02:51'),
(580, 1, 'login', 'admin@satria.local', '2026-08-27 02:17:48'),
(581, 1, 'signature_update', 'Dicky Bayu Nur Rachman, S.I.P., Ramadhani Ahmad, Magang, Ga tau siapa dia pokoknya lah; Sekretariat: Dr. Cicilia Rita Juliana Martin, SKM. MM; Invensi dan Inovasi: ; Penelitian, Pengembangan, Pengkajian, Penerapan: ', '2026-08-27 02:19:28'),
(582, 1, 'signature_update', 'Dicky Bayu Nur Rachman, S.I.P., Ramadhani Ahmad, Magang, Ga tau siapa dia pokoknya lah; Sekretariat: Dr. Cicilia Rita Juliana Martin, SKM. MM; Invensi dan Inovasi: ROSAN DASTIMI, S.Sos., M.M.; Penelitian, Pengembangan, Pengkajian, Penerapan: ', '2026-08-27 02:28:29'),
(583, 1, 'signature_update', 'Dicky Bayu Nur Rachman, S.I.P., Ramadhani Ahmad, Magang, Ga tau siapa dia pokoknya lah; Sekretariat: Dr. Cicilia Rita Juliana Martin, SKM. MM; Invensi dan Inovasi: ROSAN DASTIMI, S.Sos., M.M.; Penelitian, Pengembangan, Pengkajian, Penerapan: Dr. Ir. Wiwik Heny Winarsih, M.Si.', '2026-08-27 02:31:21'),
(584, 1, 'signature_update', 'Dicky Bayu Nur Rachman, S.I.P., Dr. KH. Ramadhani Ahmad, S.Kom., M.Kom., LC., MA, Magang, Ga tau siapa dia pokoknya lah; Sekretariat: Dr. Cicilia Rita Juliana Martin, SKM. MM; Invensi dan Inovasi: ROSAN DASTIMI, S.Sos., M.M.; Penelitian, Pengembangan, Pengkajian, Penerapan: ', '2026-08-27 02:31:33'),
(585, 1, 'signature_update', 'Dicky Bayu Nur Rachman, S.I.P., Dr. KH. Ramadhani Ahmad, S.Kom., M.Kom., LC., MA., Mahasiswa, Magang, Ga tau siapa dia pokoknya lah; Sekretariat: Dr. Cicilia Rita Juliana Martin, SKM. MM; Invensi dan Inovasi: ROSAN DASTIMI, S.Sos., M.M.; Penelitian, Pengembangan, Pengkajian, Penerapan: ', '2026-08-27 02:35:53');

-- --------------------------------------------------------

--
-- Table structure for table `metadata`
--

CREATE TABLE `metadata` (
  `id` int(11) NOT NULL,
  `dataset_id` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `metadata_schema`
--

CREATE TABLE `metadata_schema` (
  `id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `nama_field` varchar(150) NOT NULL,
  `tipe_field` varchar(50) DEFAULT 'text'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `metadata_schema`
--

INSERT INTO `metadata_schema` (`id`, `kategori_id`, `nama_field`, `tipe_field`) VALUES
(1, 1, 'judul_dataset', 'text'),
(2, 1, 'deskripsi_dataset', 'text'),
(3, 1, 'kategori', 'text'),
(4, 1, 'instansi', 'text'),
(5, 1, 'peneliti', 'text'),
(6, 1, 'jenis_data', 'text'),
(7, 1, 'tahun_data', 'text'),
(8, 1, 'lokasi', 'text'),
(9, 1, 'sumber_data', 'text'),
(10, 1, 'metode_pengumpulan', 'text'),
(11, 1, 'format_data', 'text'),
(12, 1, 'bahasa', 'text'),
(13, 1, 'kata_kunci', 'text'),
(14, 1, 'status_publikasi', 'text'),
(15, 1, 'tanggal_publikasi', 'text'),
(16, 1, 'versi_dataset', 'text'),
(17, 1, 'kontak_email', 'text'),
(18, 2, 'judul_dataset', 'text'),
(19, 2, 'deskripsi_dataset', 'text'),
(20, 2, 'kategori', 'text'),
(21, 2, 'instansi', 'text'),
(22, 2, 'peneliti', 'text'),
(23, 2, 'jenis_data', 'text'),
(24, 2, 'tahun_data', 'text'),
(25, 2, 'lokasi', 'text'),
(26, 2, 'sumber_data', 'text'),
(27, 2, 'metode_pengumpulan', 'text'),
(28, 2, 'format_data', 'text'),
(29, 2, 'bahasa', 'text'),
(30, 2, 'kata_kunci', 'text'),
(31, 2, 'status_publikasi', 'text'),
(32, 2, 'tanggal_publikasi', 'text'),
(33, 2, 'versi_dataset', 'text'),
(34, 2, 'kontak_email', 'text'),
(35, 3, 'judul_dataset', 'text'),
(36, 3, 'deskripsi_dataset', 'text'),
(37, 3, 'kategori', 'text'),
(38, 3, 'instansi', 'text'),
(39, 3, 'peneliti', 'text'),
(40, 3, 'jenis_data', 'text'),
(41, 3, 'tahun_data', 'text'),
(42, 3, 'lokasi', 'text'),
(43, 3, 'sumber_data', 'text'),
(44, 3, 'metode_pengumpulan', 'text'),
(45, 3, 'format_data', 'text'),
(46, 3, 'bahasa', 'text'),
(47, 3, 'kata_kunci', 'text'),
(48, 3, 'status_publikasi', 'text'),
(49, 3, 'tanggal_publikasi', 'text'),
(50, 3, 'versi_dataset', 'text'),
(51, 3, 'kontak_email', 'text'),
(52, 4, 'judul_dataset', 'text'),
(53, 4, 'deskripsi_dataset', 'text'),
(54, 4, 'kategori', 'text'),
(55, 4, 'instansi', 'text'),
(56, 4, 'peneliti', 'text'),
(57, 4, 'jenis_data', 'text'),
(58, 4, 'tahun_data', 'text'),
(59, 4, 'lokasi', 'text'),
(60, 4, 'sumber_data', 'text'),
(61, 4, 'metode_pengumpulan', 'text'),
(62, 4, 'format_data', 'text'),
(63, 4, 'bahasa', 'text'),
(64, 4, 'kata_kunci', 'text'),
(65, 4, 'status_publikasi', 'text'),
(66, 4, 'tanggal_publikasi', 'text'),
(67, 4, 'versi_dataset', 'text'),
(68, 4, 'kontak_email', 'text');

-- --------------------------------------------------------

--
-- Table structure for table `peneliti`
--

CREATE TABLE `peneliti` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `institution` varchar(150) DEFAULT NULL,
  `field` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `publikasi`
--

CREATE TABLE `publikasi` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `journal` varchar(150) DEFAULT NULL,
  `authors` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `repositori`
--

CREATE TABLE `repositori` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sicakab_dropdown_items`
--

CREATE TABLE `sicakab_dropdown_items` (
  `id` int(11) NOT NULL,
  `level` tinyint(1) NOT NULL COMMENT '1=Bagian,2=Sub Bagian,3=Program/Kegiatan/Sub Kegiatan,4=Indikator Kinerja',
  `parent_id` int(11) DEFAULT NULL,
  `item_key` varchar(100) DEFAULT NULL,
  `label` varchar(500) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sicakab_dropdown_items`
--

INSERT INTO `sicakab_dropdown_items` (`id`, `level`, `parent_id`, `item_key`, `label`, `sort_order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'tsp', 'Tujuan, Sasaran, dan Program', 0, 1, '2026-07-23 03:49:32', NULL),
(2, 3, 1, 'tsp_p1', 'Terwujudnya ekosistem riset dan inovasi daerah', 0, 1, '2026-07-23 03:49:32', NULL),
(3, 3, 1, 'tsp_p2', 'Berdayagunanya hasil riset dan inovasi dalam perumusan kebijakan', 1, 1, '2026-07-23 03:49:32', NULL),
(4, 3, 1, 'tsp_p3', 'PROGRAM RISET DAN INOVASI DAERAH', 2, 1, '2026-07-23 03:49:32', NULL),
(5, 3, 1, 'tsp_p4', 'PROGRAM PENUNJANG URUSAN PEMERINTAHAN DAERAH PROVINSI', 3, 1, '2026-07-23 03:49:32', NULL),
(6, 1, NULL, 'sekretariat', 'Sekretariat', 5, 1, '2026-07-23 03:49:32', NULL),
(7, 2, 6, 'sungram', 'Sub Bagian Penyusunan Program dan Anggaran', 0, 1, '2026-07-23 03:49:32', NULL),
(8, 3, 7, 'sungram_p1', 'Perencanaan, Penganggaran, dan Evaluasi Kinerja Perangkat Daerah', 0, 1, '2026-07-23 03:49:32', NULL),
(9, 4, 8, 'sungram_p1_i1', 'Jumlah Dokumen Perencanaan, Anggaran dan Pelaporan Perangkat Daerah', 0, 1, '2026-07-23 03:49:32', NULL),
(10, 3, 7, 'sungram_p2', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 1, 1, '2026-07-23 03:49:32', NULL),
(11, 4, 10, 'sungram_p2_i1', 'Jumlah Dokumen Perencanaan Perangkat Daerah', 0, 1, '2026-07-23 03:49:32', NULL),
(12, 3, 7, 'sungram_p3', 'Koordinasi dan Penyusunan Dokumen RKA-SKPD', 2, 1, '2026-07-23 03:49:32', NULL),
(13, 4, 12, 'sungram_p3_i1', 'Jumlah Dokumen RKA-SKPD dan Laporan Hasil Koordinasi Penyusunan Dokumen RKA-SKPD', 0, 1, '2026-07-23 03:49:32', NULL),
(14, 3, 7, 'sungram_p4', 'Koordinasi dan Penyusunan Dokumen Perubahan RKA-SKPD', 3, 1, '2026-07-23 03:49:32', NULL),
(15, 4, 14, 'sungram_p4_i1', 'Jumlah Dokumen Perubahan RKA-SKPD dan Laporan Hasil Koordinasi Penyusunan Dokumen Perubahan RKA-SKPD', 0, 1, '2026-07-23 03:49:32', NULL),
(16, 3, 7, 'sungram_p5', 'Koordinasi dan Penyusunan DPA-SKPD', 4, 1, '2026-07-23 03:49:32', NULL),
(17, 4, 16, 'sungram_p5_i1', 'Jumlah Dokumen DPA-SKPD dan Laporan Hasil Koordinasi Penyusunan DPA-SKPD', 0, 1, '2026-07-23 03:49:32', NULL),
(18, 3, 7, 'sungram_p6', 'Koordinasi dan Penyusunan Perubahan DPA-SKPD', 5, 1, '2026-07-23 03:49:32', NULL),
(19, 4, 18, 'sungram_p6_i1', 'Jumlah Dokumen Perubahan DPA-SKPD dan Laporan Hasil Koordinasi Penyusunan Perubahan DPA-SKPD', 0, 1, '2026-07-23 03:49:32', NULL),
(20, 3, 7, 'sungram_p7', 'Koordinasi Penyusunan Laporan Capaian Kinerja', 6, 1, '2026-07-23 03:49:32', NULL),
(21, 4, 20, 'sungram_p7_i1', 'Jumlah Laporan Capaian Kinerja dan Ikhtisar Realisasi Kinerja SKPD dan Laporan Hasil Koordinasi Penyusunan Laporan Capaian Kinerja dan Ikhtisar Realisasi Kinerja SKPD', 0, 1, '2026-07-23 03:49:32', NULL),
(22, 3, 7, 'sungram_p8', 'Evaluasi Kinerja Perangkat Daerah', 7, 1, '2026-07-23 03:49:32', NULL),
(23, 4, 22, 'sungram_p8_i1', 'Jumlah Laporan Evaluasi Kinerja Perangkat Daerah', 0, 1, '2026-07-23 03:49:32', NULL),
(24, 2, 6, 'keuangan', 'Sub Bagian Keuangan', 1, 1, '2026-07-23 03:49:32', NULL),
(25, 3, 24, 'keuangan_p1', 'Administrasi Keuangan Perangkat Daerah', 0, 1, '2026-07-23 03:49:32', NULL),
(26, 4, 25, 'keuangan_p1_i1', 'Jumlah laporan pertanggungjawaban keuangan', 0, 1, '2026-07-23 03:49:32', NULL),
(27, 3, 24, 'keuangan_p2', 'Penyediaan Gaji dan Tunjangan ASN', 1, 1, '2026-07-23 03:49:32', NULL),
(28, 4, 27, 'keuangan_p2_i1', 'Jumlah Orang yang Menerima Gaji dan Tunjangan ASN', 0, 1, '2026-07-23 03:49:32', NULL),
(29, 3, 24, 'keuangan_p3', 'Penyediaan Administrasi Pelaksanaan Tugas ASN', 2, 1, '2026-07-23 03:49:32', NULL),
(30, 4, 29, 'keuangan_p3_i1', 'Jumlah Dokumen Hasil Penyediaan Administrasi Pelaksanaan Tugas ASN', 0, 1, '2026-07-23 03:49:32', NULL),
(31, 3, 24, 'keuangan_p4', 'Penatausahaan & Verifikasi Keuangan SKPD', 3, 1, '2026-07-23 03:49:32', NULL),
(32, 4, 31, 'keuangan_p4_i1', 'Jumlah Dokumen Penatausahaan dan Pengujian/Verifikasi Keuangan SKPD', 0, 1, '2026-07-23 03:49:32', NULL),
(33, 3, 24, 'keuangan_p5', 'Koordinasi Akuntansi SKPD', 4, 1, '2026-07-23 03:49:32', NULL),
(34, 4, 33, 'keuangan_p5_i1', 'Jumlah Dokumen Hasil Koordinasi dan Pelaksanaan Akuntansi SKPD', 0, 1, '2026-07-23 03:49:32', NULL),
(35, 3, 24, 'keuangan_p6', 'Laporan Keuangan Akhir Tahun', 5, 1, '2026-07-23 03:49:32', NULL),
(36, 4, 35, 'keuangan_p6_i1', 'Jumlah Laporan Keuangan Akhir Tahun SKPD dan Laporan Hasil Koordinasi Penyusunan Laporan Keuangan Akhir Tahun SKPD', 0, 1, '2026-07-23 03:49:32', NULL),
(37, 3, 24, 'keuangan_p7', 'Laporan Keuangan Bulanan/Triwulanan/Semesteran', 6, 1, '2026-07-23 03:49:32', NULL),
(38, 4, 37, 'keuangan_p7_i1', 'Penyusunan Pelaporan dan Analisis Prognosis Realisasi Anggaran', 0, 1, '2026-07-23 03:49:32', NULL),
(39, 3, 24, 'keuangan_p8', 'Analisis Prognosis Realisasi Anggaran', 7, 1, '2026-07-23 03:49:32', NULL),
(40, 4, 39, 'keuangan_p8_i1', 'Jumlah Dokumen Pelaporan dan Analisis Prognosis Realisasi Anggaran', 0, 1, '2026-07-23 03:49:32', NULL),
(41, 2, 6, 'umum', 'Sub Bagian Umum dan Kepegawaian', 2, 1, '2026-07-23 03:49:32', NULL),
(42, 3, 41, 'umum_p1', 'Administrasi Kepegawaian', 0, 1, '2026-07-23 03:49:32', NULL),
(43, 4, 42, 'umum_p1_i1', 'Jumlah dokumen ketatausahaan dan kepegawaian', 0, 1, '2026-07-23 03:49:32', NULL),
(44, 3, 41, 'umum_p2', 'Peningkatan Sarana & Prasarana Disiplin Pegawai', 1, 1, '2026-07-23 03:49:32', NULL),
(45, 4, 44, 'umum_p2_i1', 'Jumlah Unit Peningkatan Sarana dan Prasarana Disiplin Pegawai', 0, 1, '2026-07-23 03:49:32', NULL),
(46, 3, 41, 'umum_p3', 'Pengadaan Pakaian Dinas', 2, 1, '2026-07-23 03:49:32', NULL),
(47, 4, 46, 'umum_p3_i1', 'Jumlah Paket Pakaian Dinas Beserta Atribut Kelengkapan', 0, 1, '2026-07-23 03:49:32', NULL),
(48, 3, 41, 'umum_p4', 'Pendataan Administrasi Kepegawaian', 3, 1, '2026-07-23 03:49:32', NULL),
(49, 4, 48, 'umum_p4_i1', 'Jumlah Dokumen Pendataan dan Pengolahan Administrasi Kepegawaian', 0, 1, '2026-07-23 03:49:32', NULL),
(50, 3, 41, 'umum_p5', 'Monitoring & Evaluasi Pegawai', 4, 1, '2026-07-23 03:49:32', NULL),
(51, 4, 50, 'umum_p5_i1', 'Jumlah Dokumen Monitoring, Evaluasi, dan Penilaian Kinerja Pegawai', 0, 1, '2026-07-23 03:49:32', NULL),
(52, 3, 41, 'umum_p6', 'Pendidikan dan Pelatihan Pegawai', 5, 1, '2026-07-23 03:49:32', NULL),
(53, 4, 52, 'umum_p6_i1', 'Jumlah Pegawai Berdasarkan Tugas dan Fungsi yang Mengikuti Pendidikan dan Pelatihan', 0, 1, '2026-07-23 03:49:32', NULL),
(54, 3, 41, 'umum_p7', 'Administrasi Umum', 6, 1, '2026-07-23 03:49:32', NULL),
(55, 4, 54, 'umum_p7_i1', 'Jumlah penyediaan barang dan jasa', 0, 1, '2026-07-23 03:49:32', NULL),
(62, 1, NULL, 'litbangjirap', 'Penelitian, Pengembangan, Pengkajian, Penerapan', 61, 1, '2026-07-23 03:49:32', NULL),
(63, 3, 62, 'litbangjirap_p1', 'Fasilitasi dan pembinaan pelaksanaan penelitian, pengembangan, pengkajian, dan penerapan', 0, 1, '2026-07-23 03:49:32', '2026-08-19 10:43:17'),
(64, 4, 63, 'litbangjirap_p1_i1', 'Jumlah laporan fasilitasi dan pembinaan pelaksanaan penelitian, pengembangan, pengkajian, dan penerapan', 0, 1, '2026-07-23 03:49:32', NULL),
(65, 3, 62, 'litbangjirap_p2', 'Koordinasi sistem ilmu pengetahuan dan teknologi di daerah', 1, 1, '2026-07-23 03:49:32', '2026-08-19 10:43:34'),
(66, 4, 65, 'litbangjirap_p2_i1', 'Jumlah dokumen koordinasi sistem ilmu pengetahuan dan teknologi di daerah dalam bentuk Rencana induk dan peta jalan pemajuan ilmu pengetahuan dan teknologi di daerah', 0, 1, '2026-07-23 03:49:32', NULL),
(67, 3, 62, 'litbangjirap_p3', 'Penyusunan Kebijakan Berbasis Hasil Riset', 2, 1, '2026-07-23 03:49:32', NULL),
(68, 4, 67, 'litbangjirap_p3_i1', 'Jumlah naskah kebijakan berbasis hasil riset', 0, 1, '2026-07-23 03:49:32', NULL),
(69, 3, 62, 'litbangjirap_p4', 'Bimbingan teknis dan supervisi di bidang penelitian, pengembangan, pengkajian, dan penerapan, kerja sama pembangunan ilmu pengetahuan dan teknologi, serta kemitraan penelitian, pengembangan, pengkajian, dan penerapan', 3, 1, '2026-07-23 03:49:32', '2026-08-19 10:44:06'),
(70, 4, 69, 'litbangjirap_p4_i1', 'Jumlah kegiatan bimbingan teknis dan supervisi di bidang penelitian, pengembangan, pengkajian, dan penerapan, kerja sama pembangunan ilmu pengetahuan dan teknologi, serta kemitraan penelitian, pengembangan, pengkajian, dan penerapan', 0, 1, '2026-07-23 03:49:32', NULL),
(71, 3, 62, 'litbangjirap_p5', 'Pemantauan dan evaluasi penelitian, pengembangan, pengkajian, dan penerapan', 4, 1, '2026-07-23 03:49:32', '2026-08-19 10:44:25'),
(72, 4, 71, 'litbangjirap_p5_i1', 'Laporan pemantauan dan evaluasi penelitian, pengembangan, pengkajian, dan penerapan', 0, 1, '2026-07-23 03:49:32', NULL),
(73, 3, 62, 'litbangjirap_p6', 'Koordinasi dan sinkronisasi pelaksanaan kebijakan penelitian, pengembangan, pengkajian, dan penerapan', 5, 1, '2026-07-23 03:49:32', '2026-08-19 10:44:53'),
(74, 4, 73, 'litbangjirap_p6_i1', 'Jumlah laporan penyelenggaraan Rapat Koordinasi dan sinkronisasi pelaksanaan kebijakan di bidang penelitian, pengembangan, pengkajian, dan penerapan', 0, 1, '2026-07-23 03:49:32', NULL),
(75, 1, NULL, 'invensi', 'Invensi dan Inovasi', 74, 1, '2026-07-23 03:49:32', NULL),
(76, 3, 75, 'invensi_p1', 'Fasilitasi dan pembinaan untuk apresiasi prestasi Inovasi', 0, 1, '2026-07-23 03:49:32', '2026-08-19 10:45:51'),
(77, 4, 76, 'invensi_p1_i1', 'Jumlah laporan fasilitasi dan pembinaan untuk apresiasi prestasi Inovasi', 0, 1, '2026-07-23 03:49:32', NULL),
(78, 3, 75, 'invensi_p2', 'Fasilitasi dan pembinaan untuk penguatan kemitraan antar kelembagaan', 1, 1, '2026-07-23 03:49:32', '2026-08-19 10:46:10'),
(79, 4, 78, 'invensi_p2_i1', 'Jumlah laporan fasilitasi dan pembinaan untuk penguatan kemitraan antar kelembagaan', 0, 1, '2026-07-23 03:49:32', NULL),
(80, 3, 75, 'invensi_p3', 'Bimbingan teknis dan supervisi, kerja sama, serta kemitraan invensi dan inovasi', 2, 1, '2026-07-23 03:49:32', '2026-08-19 10:46:20'),
(81, 4, 80, 'invensi_p3_i1', 'Jumlah kegiatan bimbingan teknis dan supervisi, kerja sama, serta kemitraan invensi dan inovasi', 0, 1, '2026-07-23 03:49:32', NULL),
(82, 3, 75, 'invensi_p4', 'Fasilitasi dan pembinaan untuk reformasi kebijakan Riset dan Inovasi di daerah', 3, 1, '2026-07-23 03:49:32', '2026-08-19 10:46:33'),
(83, 4, 82, 'invensi_p4_i1', 'Jumlah laporan fasilitasi dan pembinaan untuk reformasi kebijakan Riset dan Inovasi di daerah', 0, 1, '2026-07-23 03:49:32', NULL),
(84, 3, 75, 'invensi_p5', 'Fasilitasi dan pembinaan untuk penyediaan sarana pendukung Riset dan Inovasi di daerah', 4, 1, '2026-07-23 03:49:32', '2026-08-19 10:46:45'),
(85, 4, 84, 'invensi_p5_i1', 'Jumlah laporan fasilitasi dan pembinaan untuk penyediaan sarana pendukung Riset dan Inovasi di daerah', 0, 1, '2026-07-23 03:49:32', NULL),
(86, 3, 75, 'invensi_p6', 'Fasilitasi dan pembinaan untuk pengembangan infrastruktur dasar Riset dan Inovasi', 5, 1, '2026-07-23 03:49:32', '2026-08-19 10:46:59'),
(87, 4, 86, 'invensi_p6_i1', 'Jumlah laporan fasilitasi dan pembinaan untuk pengembangan infrastruktur dasar Riset dan Inovasi', 0, 1, '2026-07-23 03:49:32', NULL),
(88, 3, 75, 'invensi_p7', 'Pemantauan dan evaluasi invensi dan inovasi', 6, 1, '2026-07-23 03:49:32', '2026-08-19 10:47:27'),
(89, 4, 88, 'invensi_p7_i1', 'Laporan pemantauan dan evaluasi invensi dan inovasi', 0, 1, '2026-07-23 03:49:32', NULL),
(90, 3, 75, 'invensi_p8', 'Pelaksanaan pembangunan, pengembangan, pengelolaan dan pemanfaatan sistem informasi ilmu pengetahuan dan teknologi di daerah', 7, 1, '2026-07-23 03:49:32', '2026-08-19 10:47:40'),
(91, 4, 90, 'invensi_p8_i1', 'Tersedianya sistem informasi ilmu pengetahuan dan teknologi di daerah', 0, 1, '2026-07-23 03:49:32', NULL),
(92, 3, 75, 'invensi_p9', 'Fasilitasi dan pembinaan untuk peningkatan praktik baik kepada pelaku inovasi dan diseminasi hasil Riset dan Inovasi kepada pelaku inovasi.', 8, 1, '2026-07-23 03:49:32', '2026-08-19 10:47:55'),
(93, 4, 92, 'invensi_p9_i1', 'Jumlah laporan fasilitasi dan pembinaan untuk peningkatan praktik baik kepada pelaku inovasi dan diseminasi hasil Riset dan Inovasi kepada pelaku inovasi.', 0, 1, '2026-07-23 03:49:32', NULL),
(94, 3, 75, 'invensi_p10', 'Fasilitasi dan pembinaan untuk promosi dan kampanye Inovasi', 9, 1, '2026-07-23 03:49:32', '2026-08-19 10:48:08'),
(95, 4, 94, 'invensi_p10_i1', 'Jumlah laporan fasilitasi dan pembinaan untuk promosi dan kampanye Inovasi', 0, 1, '2026-07-23 03:49:32', NULL),
(96, 3, 75, 'invensi_p11', 'Fasilitasi dan pembinaan untuk penyelenggaraan pengembangan klaster Inovasi berbasis produk unggulan daerah daerah', 10, 1, '2026-07-23 03:49:32', '2026-08-19 10:48:20'),
(97, 4, 96, 'invensi_p11_i1', 'Jumlah laporan fasilitasi dan pembinaan untuk penyelenggaraan pengembangan klaster Inovasi berbasis produk unggulan daerah daerah dan/atau mengatasi permasalahan daerah', 0, 1, '2026-07-23 03:49:32', NULL),
(98, 3, 75, 'invensi_p12', 'Fasilitasi dan pembinaan untuk penguatan kelembagaan Riset dan Inovasi di daerah', 11, 1, '2026-07-23 03:49:32', '2026-08-19 10:48:33'),
(99, 4, 98, 'invensi_p12_i1', 'Jumlah laporan fasilitasi dan pembinaan untuk penguatan kelembagaan Riset dan Inovasi di daerah', 0, 1, '2026-07-23 03:49:32', NULL),
(100, 3, 75, 'invensi_p13', 'Fasilitasi dan pembinaan untuk penataan basis data Riset dan Inovasi', 12, 1, '2026-07-23 03:49:32', '2026-08-19 10:48:56'),
(101, 4, 100, 'invensi_p13_i1', 'Jumlah laporan fasilitasi dan pembinaan untuk penataan basis data Riset dan Inovasi', 0, 1, '2026-07-23 03:49:32', NULL),
(102, 3, 75, 'invensi_p14', 'Fasilitasi dan pembinaan untuk peningkatan perlindungan dan pemanfaatan kekayaan intelektual', 13, 1, '2026-07-23 03:49:32', '2026-08-19 10:49:09'),
(103, 4, 102, 'invensi_p14_i1', 'Jumlah laporan fasilitasi dan pembinaan untuk peningkatan perlindungan dan pemanfaatan kekayaan intelektual (pelatihan perlindungan KI, fasilitas perlindungan KI)', 0, 1, '2026-07-23 03:49:32', NULL),
(104, 3, 75, 'invensi_p15', 'Fasilitasi dan pembinaan untuk peningkatan difusi Inovasi', 14, 1, '2026-07-23 03:49:32', '2026-08-19 10:49:20'),
(105, 4, 104, 'invensi_p15_i1', 'Jumlah laporan fasilitasi dan pembinaan untuk peningkatan difusi Inovasi', 0, 1, '2026-07-23 03:49:32', NULL),
(106, 4, 2, 'tsp_p1_i1', 'Indeks Inovasi Daerah', 0, 1, '2026-07-23 07:13:29', NULL),
(107, 4, 3, 'tsp_p2_i1', 'Persentase Inovasi daerah dengan nilai kematangan tinggi', 0, 1, '2026-07-23 07:13:29', NULL),
(108, 4, 3, 'tsp_p2_i2', 'Persentase rekomendasi kebijakan berbasis hasil riset dan inovasi yang ditindaklanjuti', 1, 1, '2026-07-23 07:13:29', NULL),
(109, 4, 4, 'tsp_p3_i1', 'Jumlah Hak Kekayaan Intelektual yang difasilitasi', 0, 1, '2026-07-23 07:13:29', NULL),
(110, 4, 4, 'tsp_p3_i2', 'Jumlah hasil riset dan inovasi yang dipublikasikan dalam jurnal ilmiah/buku/proceeding/pemakalah', 1, 1, '2026-07-23 07:13:29', NULL),
(111, 4, 4, 'tsp_p3_i3', 'Jumlah Fasilitasi, Pembinaan, Bimbingan, Teknis dan Supervisi terkait Riset dan Inovasi di daerah', 2, 1, '2026-07-23 07:13:29', NULL),
(112, 4, 5, 'tsp_p4_i1', 'Persentase indikator program yang tercapai', 0, 1, '2026-07-23 07:13:29', NULL),
(113, 4, 5, 'tsp_p4_i2', 'Persentase realisasi anggaran', 1, 1, '2026-07-23 07:13:29', NULL),
(114, 4, 5, 'tsp_p4_i3', 'Indeks profesionalitas ASN', 2, 1, '2026-07-23 07:13:29', NULL),
(115, 4, 5, 'tsp_p4_i4', 'Nilai SAKIP Perangkat Daerah', 3, 1, '2026-07-23 07:13:29', NULL),
(201, 3, 41, NULL, 'Penyediaan Komponen Instalasi Listrik/Penerangan Bangunan Kantor', 10, 1, '2026-08-19 09:38:47', NULL),
(202, 4, 201, NULL, 'Jumlah Paket Komponen Instalasi Listrik/Penerangan Bangunan Kantor yang Disediakan', 0, 1, '2026-08-19 09:39:10', NULL),
(203, 3, 41, NULL, 'Penyediaan Peralatan dan Perlengkapan Kantor', 11, 1, '2026-08-19 09:47:32', NULL),
(204, 3, 41, NULL, 'Penyediaan Bahan Logistik Kantor', 12, 1, '2026-08-19 09:47:47', NULL),
(205, 3, 41, NULL, 'Penyediaan Barang Cetakan dan Penggandaan', 13, 1, '2026-08-19 09:48:20', NULL),
(206, 3, 41, NULL, 'Penyediaan Bahan Bacaan dan Peraturan Perundang-undangan', 14, 1, '2026-08-19 09:49:07', NULL),
(207, 3, 41, NULL, 'Fasilitasi Kunjungan Tamu', 15, 1, '2026-08-19 09:49:17', NULL),
(208, 3, 41, NULL, 'Penyelenggaraan Rapat Koordinasi dan Konsultasi SKPD', 16, 1, '2026-08-19 09:49:26', NULL),
(209, 3, 41, NULL, 'Pengadaan Barang Milik Daerah Penunjang Urusan Pemerintah Daerah', 17, 1, '2026-08-19 09:49:34', NULL),
(210, 3, 41, NULL, 'Pengadaan Kendaraan Perorangan Dinas atau Kendaraan Dinas Jabatan', 18, 1, '2026-08-19 09:49:42', NULL),
(211, 3, 41, NULL, 'Pengadaan Kendaraan Dinas Operasional atau Lapangan', 19, 1, '2026-08-19 09:49:53', NULL),
(212, 3, 41, NULL, 'Pengadaan Mebel', 20, 1, '2026-08-19 09:50:00', NULL),
(213, 3, 41, NULL, 'Pengadaan Peralatan dan Mesin Lainnya', 21, 1, '2026-08-19 09:50:06', NULL),
(214, 3, 41, NULL, 'Penyediaan Jasa Penunjang Urusan Pemerintahan Daerah', 22, 1, '2026-08-19 09:50:14', NULL),
(215, 3, 41, NULL, 'Penyediaan Jasa Surat Menyurat', 23, 1, '2026-08-19 09:50:21', NULL),
(216, 3, 41, NULL, 'Penyediaan Jasa Komunikasi, Sumber Daya Air dan Listrik', 24, 1, '2026-08-19 09:50:29', NULL),
(217, 3, 41, NULL, 'Penyediaan Jasa Peralatan dan Perlengkapan Kantor', 25, 1, '2026-08-19 09:50:35', NULL),
(218, 3, 41, NULL, 'Penyediaan Jasa Pelayanan Umum Kantor', 26, 1, '2026-08-19 09:50:47', NULL),
(219, 3, 41, NULL, 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 27, 1, '2026-08-19 09:50:55', NULL),
(220, 3, 41, NULL, 'Penyediaan Jasa Pemeliharaan, Biaya Pemeliharaan dan Pajak Kendaraan Perorangan, Dinas atau Kendaraan Dinas Jabatan', 28, 1, '2026-08-19 09:51:02', NULL),
(221, 3, 41, NULL, 'Penyediaan Jasa Pemeliharaan, Biaya Pemeliharaan, Pajak dan Perizinan Kendaraan Dinas Operasional atau Lapangan', 29, 1, '2026-08-19 09:51:35', NULL),
(222, 3, 41, NULL, 'Pemeliharaan Peralatan dan Mesin Lainnya', 30, 1, '2026-08-19 09:54:32', NULL),
(223, 3, 41, NULL, 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 31, 1, '2026-08-19 09:54:38', NULL),
(225, 4, 203, NULL, 'Jumlah Paket Peralatan dan Perlengkapan Kantor yang Disediakan', 0, 1, '2026-08-19 09:59:08', NULL),
(226, 4, 204, NULL, 'Jumlah Paket Bahan Logistik Kantor yang Disediakan', 0, 1, '2026-08-19 09:59:45', NULL),
(227, 4, 205, NULL, 'Jumlah Paket Barang Cetakan dan Penggandaan yang Disediakan', 0, 1, '2026-08-19 10:00:41', NULL),
(229, 4, 206, NULL, 'Jumlah Dokumen Bahan Bacaan dan Peraturan Perundang-Undangan yang Disediakan', 0, 1, '2026-08-19 10:33:36', NULL),
(230, 4, 207, NULL, 'Jumlah Laporan Fasilitasi Kunjungan Tamu', 0, 1, '2026-08-19 10:33:50', NULL),
(231, 4, 208, NULL, 'Jumlah Laporan Penyelenggaraan Rapat Koordinasi dan Konsultasi SKPD', 0, 1, '2026-08-19 10:34:02', NULL),
(232, 4, 209, NULL, 'Jumlah laporan pengadaan sarana dan prasarana', 0, 1, '2026-08-19 10:34:36', NULL),
(233, 4, 210, NULL, 'Jumlah Unit Kendaraan Perorangan Dinas atau Kendaraan Dinas Jabatan yang Disediakan', 0, 1, '2026-08-19 10:35:00', NULL),
(234, 4, 211, NULL, 'Jumlah Unit Kendaraan Dinas Operasional atau Lapangan yang Disediakan', 0, 1, '2026-08-19 10:35:56', NULL),
(235, 4, 212, NULL, 'Jumlah Paket Mebel yang Disediakan', 0, 1, '2026-08-19 10:36:08', NULL),
(236, 4, 213, NULL, 'Jumlah Unit Peralatan dan Mesin Lainnya yang Disediakan', 0, 1, '2026-08-19 10:36:25', NULL),
(237, 4, 214, NULL, 'Jumlah laporan penyediaan jasa penunjang urusan pemerintahan daerah', 0, 1, '2026-08-19 10:36:47', NULL),
(238, 4, 215, NULL, 'Jumlah Laporan Penyediaan Jasa Surat Menyurat', 0, 1, '2026-08-19 10:37:01', NULL),
(239, 4, 216, NULL, 'Jumlah Laporan Penyediaan Jasa Komunikasi, Sumber Daya Air dan Listrik yang Disediakan', 0, 1, '2026-08-19 10:39:41', NULL),
(240, 4, 217, NULL, 'Jumlah Laporan Penyediaan Jasa Peralatan dan Perlengkapan Kantor yang Disediakan', 0, 1, '2026-08-19 10:39:56', NULL),
(241, 4, 218, NULL, 'Jumlah Laporan Penyediaan Jasa Pelayanan Umum Kantor yang Disediakan', 0, 1, '2026-08-19 10:40:25', NULL),
(242, 4, 219, NULL, 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 0, 1, '2026-08-19 10:40:46', NULL),
(243, 4, 220, NULL, 'Jumlah Kendaraan Perorangan Dinas atau Kendaraan Dinas Jabatan yang Dipelihara dan Dibayarkan Pajaknya', 0, 1, '2026-08-19 10:41:09', NULL),
(244, 4, 221, NULL, 'Jumlah Kendaraan Dinas Operasional atau Lapangan yang Dipelihara dan Dibayarkan Pajak dan Perizinannya', 0, 1, '2026-08-19 10:41:24', NULL),
(245, 4, 222, NULL, 'Jumlah Peralatan dan Mesin Lainnya yang Dipelihara', 0, 1, '2026-08-19 10:41:37', NULL),
(246, 4, 223, NULL, 'Jumlah Gedung Kantor dan Bangunan Lainnya yang Dipelihara/Direhabilitasi', 0, 1, '2026-08-19 10:41:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sicakab_reports`
--

CREATE TABLE `sicakab_reports` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `target_id` int(11) DEFAULT NULL,
  `bagian` varchar(255) DEFAULT NULL,
  `sub_bagian` varchar(255) DEFAULT NULL,
  `program_kegiatan` varchar(255) DEFAULT NULL,
  `indikator_kinerja` varchar(255) DEFAULT NULL,
  `tahun` int(11) DEFAULT NULL,
  `target` text DEFAULT NULL,
  `satuan_target` varchar(20) NOT NULL DEFAULT 'dokumen',
  `tw1` decimal(6,2) DEFAULT 0.00,
  `tw2` decimal(6,2) DEFAULT 0.00,
  `tw3` decimal(6,2) DEFAULT 0.00,
  `tw4` decimal(6,2) DEFAULT 0.00,
  `capaian` decimal(6,2) DEFAULT 0.00,
  `keterangan` text DEFAULT NULL,
  `faktor_pendukung` text DEFAULT NULL,
  `peluang_hambatan` text DEFAULT NULL,
  `link_dokumen` varchar(500) DEFAULT NULL,
  `file_dokumen` varchar(255) DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'menunggu_evaluasi',
  `evaluasi_hasil` text DEFAULT NULL,
  `evaluasi_rekomendasi` text DEFAULT NULL,
  `evaluasi_by` int(11) DEFAULT NULL,
  `evaluasi_at` datetime DEFAULT NULL,
  `tindak_lanjut_rencana` text DEFAULT NULL,
  `tindak_lanjut_batas_waktu` date DEFAULT NULL,
  `tindak_lanjut_link` varchar(500) DEFAULT NULL,
  `tindak_lanjut_file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sicakab_reports`
--

INSERT INTO `sicakab_reports` (`id`, `user_id`, `target_id`, `bagian`, `sub_bagian`, `program_kegiatan`, `indikator_kinerja`, `tahun`, `target`, `satuan_target`, `tw1`, `tw2`, `tw3`, `tw4`, `capaian`, `keterangan`, `faktor_pendukung`, `peluang_hambatan`, `link_dokumen`, `file_dokumen`, `status`, `evaluasi_hasil`, `evaluasi_rekomendasi`, `evaluasi_by`, `evaluasi_at`, `tindak_lanjut_rencana`, `tindak_lanjut_batas_waktu`, `tindak_lanjut_link`, `tindak_lanjut_file`, `created_at`, `updated_at`) VALUES
(1, 6, 1, 'Sekretariat', 'Sub Bagian Penyusunan Program dan Anggaran', 'Perencanaan, Penganggaran, dan Evaluasi Kinerja Perangkat Daerah', 'Jumlah Dokumen Perencanaan, Anggaran dan Pelaporan Perangkat Daerah', 2026, '12', 'dokumen', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'menunggu_evaluasi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-11 07:57:01', NULL),
(2, 10, 2, 'Penelitian, Pengembangan, Pengkajian, Penerapan', '', 'Fasilitasi dan Pembinaan', 'Jumlah laporan fasilitasi dan pembinaan pelaksanaan penelitian, pengembangan, pengkajian, dan penerapan', 2026, '33', 'dokumen', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'menunggu_evaluasi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-19 03:47:21', NULL),
(3, 4, 3, 'Tujuan, Sasaran, dan Program', '', 'Terwujudnya ekosistem riset dan inovasi daerah', 'Indeks Inovasi Daerah', 2026, '100', 'persen', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'menunggu_evaluasi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-19 05:03:36', NULL),
(4, 1, NULL, 'Penelitian, Pengembangan, Pengkajian, Penerapan', '', 'Koordinasi sistem ilmu pengetahuan dan teknologi di daerah', 'Jumlah dokumen koordinasi sistem ilmu pengetahuan dan teknologi di daerah dalam bentuk Rencana induk dan peta jalan pemajuan ilmu pengetahuan dan teknologi di daerah', 2026, '2', 'dokumen', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'menunggu_evaluasi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-20 07:15:52', NULL),
(5, 1, NULL, 'Tujuan, Sasaran, dan Program', '', 'PROGRAM RISET DAN INOVASI DAERAH', 'Jumlah Hak Kekayaan Intelektual yang difasilitasi', 2026, '100', 'dokumen', 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, 'menunggu_evaluasi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-26 03:22:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sicakab_satuan`
--

CREATE TABLE `sicakab_satuan` (
  `id` int(11) NOT NULL,
  `item_key` varchar(50) NOT NULL,
  `label` varchar(100) NOT NULL,
  `is_percen` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sicakab_satuan`
--

INSERT INTO `sicakab_satuan` (`id`, `item_key`, `label`, `is_percen`, `sort_order`, `is_active`, `created_at`) VALUES
(1, 'dokumen', 'Dokumen', 0, 1, 1, '2026-08-19 07:42:00'),
(2, 'persen', 'Persen (%)', 1, 2, 1, '2026-08-19 07:42:00'),
(3, 'laporan', 'Laporan', 0, 3, 1, '2026-08-19 07:42:00'),
(4, 'paket', 'Paket', 0, 4, 1, '2026-08-19 07:42:00'),
(5, 'unit', 'Unit', 0, 5, 1, '2026-08-19 07:42:00'),
(6, 'rekomendasi', 'Rekomendasi', 0, 6, 1, '2026-08-19 07:42:00'),
(7, 'indeks', 'Indeks', 0, 7, 1, '2026-08-19 07:42:00'),
(8, 'orang_bulan', 'Orang/ Bulan', 0, 8, 1, '2026-08-19 08:14:26'),
(9, 'orang', 'Orang', 0, 9, 1, '2026-08-19 09:30:31'),
(10, 'pelatihan', 'Pelatihan', 0, 10, 1, '2026-08-19 11:03:54'),
(11, 'naskah', 'Naskah', 0, 11, 1, '2026-08-19 11:04:03');

-- --------------------------------------------------------

--
-- Table structure for table `sicakab_targets`
--

CREATE TABLE `sicakab_targets` (
  `id` int(11) NOT NULL,
  `bagian` varchar(255) NOT NULL,
  `sub_bagian` varchar(255) DEFAULT NULL,
  `program_kegiatan` varchar(255) DEFAULT NULL,
  `indikator_kinerja` varchar(255) DEFAULT NULL,
  `tahun` int(11) NOT NULL,
  `target_dokumen` int(11) NOT NULL DEFAULT 0,
  `satuan_target` varchar(20) NOT NULL DEFAULT 'dokumen',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sicakab_targets`
--

INSERT INTO `sicakab_targets` (`id`, `bagian`, `sub_bagian`, `program_kegiatan`, `indikator_kinerja`, `tahun`, `target_dokumen`, `satuan_target`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Sekretariat', 'Sub Bagian Penyusunan Program dan Anggaran', 'Perencanaan, Penganggaran, dan Evaluasi Kinerja Perangkat Daerah', 'Jumlah Dokumen Perencanaan, Anggaran dan Pelaporan Perangkat Daerah', 2026, 21, 'dokumen', 1, '2026-08-11 07:55:10', '2026-08-19 08:02:45'),
(2, 'Penelitian, Pengembangan, Pengkajian, Penerapan', '', 'Fasilitasi dan Pembinaan', 'Jumlah laporan fasilitasi dan pembinaan pelaksanaan penelitian, pengembangan, pengkajian, dan penerapan', 2026, 33, 'dokumen', 1, '2026-08-19 03:44:14', NULL),
(3, 'Tujuan, Sasaran, dan Program', '', 'Terwujudnya ekosistem riset dan inovasi daerah', 'Indeks Inovasi Daerah', 2026, 100, 'persen', 4, '2026-08-19 04:20:31', NULL),
(4, 'Sekretariat', 'Sub Bagian Penyusunan Program dan Anggaran', 'Penyusunan Dokumen Perencanaan Perangkat Daerah', 'Jumlah Dokumen Perencanaan Perangkat Daerah', 2026, 9, 'dokumen', 1, '2026-08-19 08:06:08', NULL),
(5, 'Sekretariat', 'Sub Bagian Penyusunan Program dan Anggaran', 'Koordinasi dan Penyusunan Dokumen RKA-SKPD', 'Jumlah Dokumen RKA-SKPD dan Laporan Hasil Koordinasi Penyusunan Dokumen RKA-SKPD', 2026, 1, 'dokumen', 1, '2026-08-19 08:06:39', NULL),
(6, 'Sekretariat', 'Sub Bagian Penyusunan Program dan Anggaran', 'Koordinasi dan Penyusunan Dokumen Perubahan RKA-SKPD', 'Jumlah Dokumen Perubahan RKA-SKPD dan Laporan Hasil Koordinasi Penyusunan Dokumen Perubahan RKA-SKPD', 2026, 1, 'dokumen', 1, '2026-08-19 08:07:13', NULL),
(7, 'Sekretariat', 'Sub Bagian Penyusunan Program dan Anggaran', 'Koordinasi dan Penyusunan DPA-SKPD', 'Jumlah Dokumen DPA-SKPD dan Laporan Hasil Koordinasi Penyusunan DPA-SKPD', 2026, 1, 'dokumen', 1, '2026-08-19 08:08:54', NULL),
(8, 'Sekretariat', 'Sub Bagian Penyusunan Program dan Anggaran', 'Koordinasi dan Penyusunan Perubahan DPA-SKPD', 'Jumlah Dokumen Perubahan DPA-SKPD dan Laporan Hasil Koordinasi Penyusunan Perubahan DPA-SKPD', 2026, 1, 'dokumen', 1, '2026-08-19 08:09:05', NULL),
(9, 'Sekretariat', 'Sub Bagian Penyusunan Program dan Anggaran', 'Koordinasi Penyusunan Laporan Capaian Kinerja', 'Jumlah Laporan Capaian Kinerja dan Ikhtisar Realisasi Kinerja SKPD dan Laporan Hasil Koordinasi Penyusunan Laporan Capaian Kinerja dan Ikhtisar Realisasi Kinerja SKPD', 2026, 4, 'laporan', 1, '2026-08-19 08:09:45', NULL),
(10, 'Sekretariat', 'Sub Bagian Penyusunan Program dan Anggaran', 'Evaluasi Kinerja Perangkat Daerah', 'Jumlah Laporan Evaluasi Kinerja Perangkat Daerah', 2026, 4, 'laporan', 1, '2026-08-19 08:10:16', NULL),
(11, 'Sekretariat', 'Sub Bagian Keuangan', 'Administrasi Keuangan Perangkat Daerah', 'Jumlah laporan pertanggungjawaban keuangan', 2026, 12, 'laporan', 1, '2026-08-19 08:11:32', NULL),
(12, 'Sekretariat', 'Sub Bagian Keuangan', 'Penyediaan Gaji dan Tunjangan ASN', 'Jumlah Orang yang Menerima Gaji dan Tunjangan ASN', 2026, 89, 'orang_bulan', 1, '2026-08-19 08:15:14', NULL),
(13, 'Sekretariat', 'Sub Bagian Keuangan', 'Penyediaan Administrasi Pelaksanaan Tugas ASN', 'Jumlah Dokumen Hasil Penyediaan Administrasi Pelaksanaan Tugas ASN', 2026, 12, 'dokumen', 1, '2026-08-19 08:21:56', NULL),
(14, 'Sekretariat', 'Sub Bagian Keuangan', 'Penatausahaan & Verifikasi Keuangan SKPD', 'Jumlah Dokumen Penatausahaan dan Pengujian/Verifikasi Keuangan SKPD', 2026, 12, 'dokumen', 1, '2026-08-19 08:22:41', NULL),
(15, 'Sekretariat', 'Sub Bagian Keuangan', 'Koordinasi Akuntansi SKPD', 'Jumlah Dokumen Hasil Koordinasi dan Pelaksanaan Akuntansi SKPD', 2026, 12, 'dokumen', 1, '2026-08-19 08:23:33', NULL),
(16, 'Sekretariat', 'Sub Bagian Keuangan', 'Laporan Keuangan Akhir Tahun', 'Jumlah Laporan Keuangan Akhir Tahun SKPD dan Laporan Hasil Koordinasi Penyusunan Laporan Keuangan Akhir Tahun SKPD', 2026, 1, 'laporan', 1, '2026-08-19 08:24:07', NULL),
(17, 'Sekretariat', 'Sub Bagian Keuangan', 'Laporan Keuangan Bulanan/Triwulanan/Semesteran', 'Penyusunan Pelaporan dan Analisis Prognosis Realisasi Anggaran', 2026, 18, 'laporan', 1, '2026-08-19 08:25:07', NULL),
(18, 'Sekretariat', 'Sub Bagian Keuangan', 'Analisis Prognosis Realisasi Anggaran', 'Jumlah Dokumen Pelaporan dan Analisis Prognosis Realisasi Anggaran', 2026, 1, 'dokumen', 1, '2026-08-19 08:28:29', NULL),
(19, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Administrasi Kepegawaian', 'Jumlah dokumen ketatausahaan dan kepegawaian', 2026, 4, 'dokumen', 1, '2026-08-19 08:29:43', NULL),
(20, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Peningkatan Sarana & Prasarana Disiplin Pegawai', 'Jumlah Unit Peningkatan Sarana dan Prasarana Disiplin Pegawai', 2026, 1, 'unit', 1, '2026-08-19 08:33:11', NULL),
(21, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Pengadaan Pakaian Dinas', 'Jumlah Paket Pakaian Dinas Beserta Atribut Kelengkapan', 2026, 1, 'paket', 1, '2026-08-19 09:28:04', NULL),
(22, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Pendataan Administrasi Kepegawaian', 'Jumlah Dokumen Pendataan dan Pengolahan Administrasi Kepegawaian', 2026, 1, 'dokumen', 1, '2026-08-19 09:28:41', NULL),
(23, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Monitoring & Evaluasi Pegawai', 'Jumlah Dokumen Monitoring, Evaluasi, dan Penilaian Kinerja Pegawai', 2026, 12, 'dokumen', 1, '2026-08-19 09:29:12', NULL),
(24, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Pendidikan dan Pelatihan Pegawai', 'Jumlah Pegawai Berdasarkan Tugas dan Fungsi yang Mengikuti Pendidikan dan Pelatihan', 2026, 90, 'orang', 1, '2026-08-19 09:32:53', NULL),
(25, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Administrasi Umum', 'Jumlah penyediaan barang dan jasa', 2026, 12, 'laporan', 1, '2026-08-19 09:34:08', NULL),
(26, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Penyediaan Komponen Instalasi Listrik/Penerangan Bangunan Kantor', 'Jumlah Paket Komponen Instalasi Listrik/Penerangan Bangunan Kantor yang Disediakan', 2026, 12, 'paket', 1, '2026-08-19 10:50:13', '2026-08-20 02:58:11'),
(27, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Penyediaan Peralatan dan Perlengkapan Kantor', 'Jumlah Paket Peralatan dan Perlengkapan Kantor yang Disediakan', 2026, 4, 'paket', 1, '2026-08-19 10:51:01', NULL),
(28, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Penyediaan Bahan Logistik Kantor', 'Jumlah Paket Bahan Logistik Kantor yang Disediakan', 2026, 4, 'paket', 1, '2026-08-19 10:51:42', NULL),
(29, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Penyediaan Barang Cetakan dan Penggandaan', 'Jumlah Paket Barang Cetakan dan Penggandaan yang Disediakan', 2026, 4, 'paket', 1, '2026-08-19 10:52:34', NULL),
(30, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Penyediaan Bahan Bacaan dan Peraturan Perundang-undangan', 'Jumlah Dokumen Bahan Bacaan dan Peraturan Perundang-Undangan yang Disediakan', 2026, 8, 'dokumen', 1, '2026-08-19 10:52:57', NULL),
(31, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Fasilitasi Kunjungan Tamu', 'Jumlah Laporan Fasilitasi Kunjungan Tamu', 2026, 4, 'laporan', 1, '2026-08-19 10:53:30', NULL),
(32, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Penyelenggaraan Rapat Koordinasi dan Konsultasi SKPD', 'Jumlah Laporan Penyelenggaraan Rapat Koordinasi dan Konsultasi SKPD', 2026, 4, 'laporan', 1, '2026-08-19 10:54:22', NULL),
(33, 'Invensi dan Inovasi', '', 'Fasilitasi dan pembinaan untuk apresiasi prestasi Inovasi', 'Jumlah laporan fasilitasi dan pembinaan untuk apresiasi prestasi Inovasi', 2026, 2, 'laporan', 1, '2026-08-19 10:54:51', NULL),
(34, 'Invensi dan Inovasi', '', 'Fasilitasi dan pembinaan untuk penguatan kemitraan antar kelembagaan', 'Jumlah laporan fasilitasi dan pembinaan untuk penguatan kemitraan antar kelembagaan', 2026, 1, 'laporan', 1, '2026-08-19 10:55:08', NULL),
(35, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Pengadaan Barang Milik Daerah Penunjang Urusan Pemerintah Daerah', 'Jumlah laporan pengadaan sarana dan prasarana', 2026, 4, 'laporan', 1, '2026-08-19 10:55:21', NULL),
(36, 'Invensi dan Inovasi', '', 'Bimbingan teknis dan supervisi, kerja sama, serta kemitraan invensi dan inovasi', 'Jumlah kegiatan bimbingan teknis dan supervisi, kerja sama, serta kemitraan invensi dan inovasi', 2026, 1, 'laporan', 1, '2026-08-19 10:55:34', NULL),
(37, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Pengadaan Kendaraan Perorangan Dinas atau Kendaraan Dinas Jabatan', 'Jumlah Unit Kendaraan Perorangan Dinas atau Kendaraan Dinas Jabatan yang Disediakan', 2026, 1, 'unit', 1, '2026-08-19 10:55:58', NULL),
(38, 'Invensi dan Inovasi', '', 'Fasilitasi dan pembinaan untuk reformasi kebijakan Riset dan Inovasi di daerah', 'Jumlah laporan fasilitasi dan pembinaan untuk reformasi kebijakan Riset dan Inovasi di daerah', 2026, 1, 'laporan', 1, '2026-08-19 10:56:17', NULL),
(39, 'Invensi dan Inovasi', '', 'Fasilitasi dan pembinaan untuk penyediaan sarana pendukung Riset dan Inovasi di daerah', 'Jumlah laporan fasilitasi dan pembinaan untuk penyediaan sarana pendukung Riset dan Inovasi di daerah', 2026, 1, 'laporan', 1, '2026-08-19 10:56:39', NULL),
(40, 'Invensi dan Inovasi', '', 'Fasilitasi dan pembinaan untuk pengembangan infrastruktur dasar Riset dan Inovasi', 'Jumlah laporan fasilitasi dan pembinaan untuk pengembangan infrastruktur dasar Riset dan Inovasi', 2026, 1, 'laporan', 1, '2026-08-19 10:56:52', NULL),
(41, 'Invensi dan Inovasi', '', 'Pemantauan dan evaluasi invensi dan inovasi', 'Laporan pemantauan dan evaluasi invensi dan inovasi', 2026, 1, 'laporan', 1, '2026-08-19 10:57:20', NULL),
(42, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Pengadaan Kendaraan Dinas Operasional atau Lapangan', 'Jumlah Unit Kendaraan Dinas Operasional atau Lapangan yang Disediakan', 2026, 1, 'unit', 1, '2026-08-19 10:57:28', NULL),
(43, 'Invensi dan Inovasi', '', 'Pelaksanaan pembangunan, pengembangan, pengelolaan dan pemanfaatan sistem informasi ilmu pengetahuan dan teknologi di daerah', 'Tersedianya sistem informasi ilmu pengetahuan dan teknologi di daerah', 2026, 1, 'laporan', 1, '2026-08-19 10:57:33', NULL),
(44, 'Invensi dan Inovasi', '', 'Fasilitasi dan pembinaan untuk peningkatan praktik baik kepada pelaku inovasi dan diseminasi hasil Riset dan Inovasi kepada pelaku inovasi.', 'Jumlah laporan fasilitasi dan pembinaan untuk peningkatan praktik baik kepada pelaku inovasi dan diseminasi hasil Riset dan Inovasi kepada pelaku inovasi.', 2026, 1, 'laporan', 1, '2026-08-19 10:57:47', NULL),
(45, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Pengadaan Mebel', 'Jumlah Paket Mebel yang Disediakan', 2026, 2, 'paket', 1, '2026-08-19 10:57:51', NULL),
(46, 'Invensi dan Inovasi', '', 'Fasilitasi dan pembinaan untuk promosi dan kampanye Inovasi', 'Jumlah laporan fasilitasi dan pembinaan untuk promosi dan kampanye Inovasi', 2026, 1, 'laporan', 1, '2026-08-19 10:58:08', NULL),
(47, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Pengadaan Peralatan dan Mesin Lainnya', 'Jumlah Unit Peralatan dan Mesin Lainnya yang Disediakan', 2026, 4, 'unit', 1, '2026-08-19 10:58:11', NULL),
(48, 'Invensi dan Inovasi', '', 'Fasilitasi dan pembinaan untuk penyelenggaraan pengembangan klaster Inovasi berbasis produk unggulan daerah daerah', 'Jumlah laporan fasilitasi dan pembinaan untuk penyelenggaraan pengembangan klaster Inovasi berbasis produk unggulan daerah daerah dan/atau mengatasi permasalahan daerah', 2026, 1, 'laporan', 1, '2026-08-19 10:58:26', NULL),
(49, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Penyediaan Jasa Penunjang Urusan Pemerintahan Daerah', 'Jumlah laporan penyediaan jasa penunjang urusan pemerintahan daerah', 2026, 4, 'laporan', 1, '2026-08-19 10:58:42', NULL),
(50, 'Invensi dan Inovasi', '', 'Fasilitasi dan pembinaan untuk penguatan kelembagaan Riset dan Inovasi di daerah', 'Jumlah laporan fasilitasi dan pembinaan untuk penguatan kelembagaan Riset dan Inovasi di daerah', 2026, 1, 'laporan', 1, '2026-08-19 10:58:50', NULL),
(51, 'Invensi dan Inovasi', '', 'Fasilitasi dan pembinaan untuk penataan basis data Riset dan Inovasi', 'Jumlah laporan fasilitasi dan pembinaan untuk penataan basis data Riset dan Inovasi', 2026, 1, 'laporan', 1, '2026-08-19 10:59:02', NULL),
(52, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Penyediaan Jasa Surat Menyurat', 'Jumlah Laporan Penyediaan Jasa Surat Menyurat', 2026, 4, 'laporan', 1, '2026-08-19 10:59:08', NULL),
(53, 'Invensi dan Inovasi', '', 'Fasilitasi dan pembinaan untuk peningkatan perlindungan dan pemanfaatan kekayaan intelektual', 'Jumlah laporan fasilitasi dan pembinaan untuk peningkatan perlindungan dan pemanfaatan kekayaan intelektual (pelatihan perlindungan KI, fasilitas perlindungan KI)', 2026, 1, 'laporan', 1, '2026-08-19 10:59:22', NULL),
(54, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Penyediaan Jasa Komunikasi, Sumber Daya Air dan Listrik', 'Jumlah Laporan Penyediaan Jasa Komunikasi, Sumber Daya Air dan Listrik yang Disediakan', 2026, 4, 'laporan', 1, '2026-08-19 10:59:26', NULL),
(55, 'Invensi dan Inovasi', '', 'Fasilitasi dan pembinaan untuk peningkatan difusi Inovasi', 'Jumlah laporan fasilitasi dan pembinaan untuk peningkatan difusi Inovasi', 2026, 2, 'laporan', 1, '2026-08-19 10:59:36', NULL),
(56, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Penyediaan Jasa Peralatan dan Perlengkapan Kantor', 'Jumlah Laporan Penyediaan Jasa Peralatan dan Perlengkapan Kantor yang Disediakan', 2026, 4, 'laporan', 1, '2026-08-19 10:59:45', NULL),
(57, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Penyediaan Jasa Pelayanan Umum Kantor', 'Jumlah Laporan Penyediaan Jasa Pelayanan Umum Kantor yang Disediakan', 2026, 4, 'laporan', 1, '2026-08-19 11:00:04', NULL),
(58, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 'Pemeliharaan Barang Milik Daerah Penunjang Urusan Pemerintahan Daerah', 2026, 12, 'laporan', 1, '2026-08-19 11:00:38', NULL),
(59, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Penyediaan Jasa Pemeliharaan, Biaya Pemeliharaan dan Pajak Kendaraan Perorangan, Dinas atau Kendaraan Dinas Jabatan', 'Jumlah Kendaraan Perorangan Dinas atau Kendaraan Dinas Jabatan yang Dipelihara dan Dibayarkan Pajaknya', 2026, 1, 'unit', 1, '2026-08-19 11:00:59', NULL),
(60, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Penyediaan Jasa Pemeliharaan, Biaya Pemeliharaan, Pajak dan Perizinan Kendaraan Dinas Operasional atau Lapangan', 'Jumlah Kendaraan Dinas Operasional atau Lapangan yang Dipelihara dan Dibayarkan Pajak dan Perizinannya', 2026, 8, 'unit', 1, '2026-08-19 11:01:20', NULL),
(61, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Pemeliharaan Peralatan dan Mesin Lainnya', 'Jumlah Peralatan dan Mesin Lainnya yang Dipelihara', 2026, 5, 'unit', 1, '2026-08-19 11:01:42', NULL),
(62, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Pemeliharaan/Rehabilitasi Gedung Kantor dan Bangunan Lainnya', 'Jumlah Gedung Kantor dan Bangunan Lainnya yang Dipelihara/Direhabilitasi', 2026, 2, 'unit', 1, '2026-08-19 11:02:17', NULL),
(63, 'Penelitian, Pengembangan, Pengkajian, Penerapan', '', 'Fasilitasi dan pembinaan pelaksanaan penelitian, pengembangan, pengkajian, dan penerapan', 'Jumlah laporan fasilitasi dan pembinaan pelaksanaan penelitian, pengembangan, pengkajian, dan penerapan', 2026, 19, 'laporan', 1, '2026-08-19 11:02:49', NULL),
(64, 'Penelitian, Pengembangan, Pengkajian, Penerapan', '', 'Koordinasi sistem ilmu pengetahuan dan teknologi di daerah', 'Jumlah dokumen koordinasi sistem ilmu pengetahuan dan teknologi di daerah dalam bentuk Rencana induk dan peta jalan pemajuan ilmu pengetahuan dan teknologi di daerah', 2026, 1, 'dokumen', 1, '2026-08-19 11:03:07', NULL),
(65, 'Penelitian, Pengembangan, Pengkajian, Penerapan', '', 'Penyusunan Kebijakan Berbasis Hasil Riset', 'Jumlah naskah kebijakan berbasis hasil riset', 2026, 13, 'naskah', 1, '2026-08-19 11:03:29', '2026-08-19 11:04:47'),
(66, 'Penelitian, Pengembangan, Pengkajian, Penerapan', '', 'Bimbingan teknis dan supervisi di bidang penelitian, pengembangan, pengkajian, dan penerapan, kerja sama pembangunan ilmu pengetahuan dan teknologi, serta kemitraan penelitian, pengembangan, pengkajian, dan penerapan', 'Jumlah kegiatan bimbingan teknis dan supervisi di bidang penelitian, pengembangan, pengkajian, dan penerapan, kerja sama pembangunan ilmu pengetahuan dan teknologi, serta kemitraan penelitian, pengembangan, pengkajian, dan penerapan', 2026, 2, 'pelatihan', 1, '2026-08-19 11:05:01', NULL),
(67, 'Penelitian, Pengembangan, Pengkajian, Penerapan', '', 'Pemantauan dan evaluasi penelitian, pengembangan, pengkajian, dan penerapan', 'Laporan pemantauan dan evaluasi penelitian, pengembangan, pengkajian, dan penerapan', 2026, 1, 'laporan', 1, '2026-08-19 11:05:30', NULL),
(68, 'Penelitian, Pengembangan, Pengkajian, Penerapan', '', 'Koordinasi dan sinkronisasi pelaksanaan kebijakan penelitian, pengembangan, pengkajian, dan penerapan', 'Jumlah laporan penyelenggaraan Rapat Koordinasi dan sinkronisasi pelaksanaan kebijakan di bidang penelitian, pengembangan, pengkajian, dan penerapan', 2026, 1, 'laporan', 1, '2026-08-19 11:05:51', NULL),
(69, 'Sekretariat', 'Sub Bagian Umum dan Kepegawaian', 'Penyediaan Komponen Instalasi Listrik/Penerangan Bangunan Kantor', 'Jumlah Paket Komponen Instalasi Listrik/Penerangan Bangunan Kantor yang Disediakan', 2026, 12, 'paket', 1, '2026-08-20 01:58:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sicakab_triwulan`
--

CREATE TABLE `sicakab_triwulan` (
  `id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `tw` int(11) NOT NULL COMMENT 'Triwulan 1-4',
  `realisasi` decimal(6,2) DEFAULT 0.00,
  `capaian` decimal(6,2) DEFAULT 0.00,
  `keterangan` text DEFAULT NULL,
  `faktor_pendukung` text DEFAULT NULL,
  `peluang_hambatan` text DEFAULT NULL,
  `link_dokumen` varchar(500) DEFAULT NULL,
  `file_dokumen` varchar(255) DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'draft',
  `evaluasi_hasil` text DEFAULT NULL,
  `evaluasi_rekomendasi` text DEFAULT NULL,
  `evaluasi_by` int(11) DEFAULT NULL,
  `evaluasi_at` datetime DEFAULT NULL,
  `tindak_lanjut_rencana` text DEFAULT NULL,
  `tindak_lanjut_batas_waktu` date DEFAULT NULL,
  `tindak_lanjut_link` varchar(500) DEFAULT NULL,
  `tindak_lanjut_file` varchar(255) DEFAULT NULL,
  `tindak_lanjut_hasil` text DEFAULT NULL,
  `tindak_lanjut_hasil_link` varchar(500) DEFAULT NULL,
  `tindak_lanjut_hasil_file` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sicakab_triwulan`
--

INSERT INTO `sicakab_triwulan` (`id`, `report_id`, `tw`, `realisasi`, `capaian`, `keterangan`, `faktor_pendukung`, `peluang_hambatan`, `link_dokumen`, `file_dokumen`, `status`, `evaluasi_hasil`, `evaluasi_rekomendasi`, `evaluasi_by`, `evaluasi_at`, `tindak_lanjut_rencana`, `tindak_lanjut_batas_waktu`, `tindak_lanjut_link`, `tindak_lanjut_file`, `tindak_lanjut_hasil`, `tindak_lanjut_hasil_link`, `tindak_lanjut_hasil_file`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 3.00, 3.00, 'keterangan perkembangan pelaksanaan kegiatan', 'faktor pendukung', 'permasalahan', '', '', 'menunggu_evaluasi', 'anunya kurang anu, sama anu biar anu', 'biar ngga anu, anu aja', 1, '2026-08-11 14:58:07', 'Nanti y pak', '2026-08-12', '', '', 'kapan kapan aja y pak', '', '1783925219_BRIDA-SUNGRAM-02-2025_DATA_KERJASAMA_1786436141.pdf', '2026-08-11 07:57:01', '2026-08-11 08:29:55'),
(2, 1, 2, 4.00, 4.00, 'anu pak infokan info pak', 'didukung oleh vacation pak', 'naik pak', '', '', 'menunggu_evaluasi', 'yo ndak tau kok tanya saya', 'stagnant saja', 1, '2026-08-11 15:30:52', 'nanti deh pak', '2026-08-21', '', '', 'gaa jadi pak, kapan kapan saja', 'https://google.com', NULL, '2026-08-11 08:29:55', '2026-08-12 02:32:54'),
(3, 1, 3, 4.00, 4.00, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quis ligula eget massa pharetra laoreet. Morbi a libero a est pulvinar fermentum vitae nec urna. In ut lorem pulvinar, fermentum est accumsan, consectetur diam. Suspendisse aliquam nunc a orci imperdiet facilisis. Morbi imperdiet, metus in placerat placerat, ante tortor hendrerit eros, venenatis tempus mi velit eget tellus. Quisque congue est quis mi finibus mattis. Integer quis augue sed orci sollicitudin scelerisque id a nisi. Maecenas pharetra arcu magna.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quis ligula eget massa pharetra laoreet. Morbi a libero a est pulvinar fermentum vitae nec urna. In ut lorem pulvinar, fermentum est accumsan, consectetur diam. Suspendisse aliquam nunc a orci imperdiet facilisis. Morbi imperdiet, metus in placerat placerat, ante tortor hendrerit eros, venenatis tempus mi velit eget tellus. Quisque congue est quis mi finibus mattis. Integer quis augue sed orci sollicitudin scelerisque id a nisi. Maecenas pharetra arcu magna.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quis ligula eget massa pharetra laoreet. Morbi a libero a est pulvinar fermentum vitae nec urna. In ut lorem pulvinar, fermentum est accumsan, consectetur diam. Suspendisse aliquam nunc a orci imperdiet facilisis. Morbi imperdiet, metus in placerat placerat, ante tortor hendrerit eros, venenatis tempus mi velit eget tellus. Quisque congue est quis mi finibus mattis. Integer quis augue sed orci sollicitudin scelerisque id a nisi. Maecenas pharetra arcu magna.', '', '', 'tindak_lanjut_dikirim', 'Lorem ipsum - Lorem ipsum, kerjain', 'kerjakan', 1, '2026-08-13 08:44:04', 'iya pak, siap ngga Lorem ipsum - Lorem ipsum lagi', '2026-08-27', '', '', 'ini pak, tapi Lorem ipsum - Lorem ipsum dulu ya', 'https://google.com', NULL, '2026-08-12 02:32:54', '2026-08-13 01:45:16'),
(4, 2, 1, 8.00, 8.00, 'percobaan ngisi pada litbangjirab tw 1', 'a;dflkjaporeiqwriojlkmlkmqwet', 'p/;.,iuymjntrbgervwerffefew', '', '', 'menunggu_evaluasi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-19 03:47:21', NULL),
(5, 2, 2, 2.00, 2.00, 'percobaan ngisi pada litbangjirab tw 2', 'asdfasfasdfasfasdfasdf', 'safasdfsafqoiwerulasdkfjlkfjqwerijmvoi;dknae;ivjagnp;iegunpa;ergnjuapeugno;aegerg', '', '', 'menunggu_evaluasi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-19 03:47:21', NULL),
(6, 2, 3, 5.00, 5.00, 'percobaan ngisi pada litbangjirab tw 3', 'Ing ngarso sung tulodho, ing madyo mangun karso, tut wuri handayani', 'lorem ipsum lorem ipsum', '', '', 'menunggu_evaluasi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-19 03:47:21', NULL),
(7, 2, 4, 0.00, 0.00, 'percobaan ngisi pada litbangjirab tw 4', 'adfasfdasdfasdddddddddddddddddddddddddddddddddddddddd', 'keeki wa arimasen', '', '', 'tindak_lanjut_dikirim', 'keeki wa arimasu yo', 'pan ya wo ikimashou', 4, '2026-08-19 03:50:21', 'ikimas', '2026-08-31', '', '', 'ano ne ano ne ...\r\nlorem ipsum lorem ipsum dolor sit amet', '', NULL, '2026-08-19 03:47:21', '2026-08-19 03:52:02'),
(8, 3, 1, 12.00, 12.00, 'isian tw 1', 'adsfsadf', 'fasfsadfsadfsadfsd', '', '', 'menunggu_evaluasi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-19 05:03:36', NULL),
(9, 3, 2, 24.00, 24.00, 'asddfasddfasddfasddfsdf', 'sadfasdfasd', 'fsdfasdfasddfasddfasddf', '', '', 'sudah_dievaluasi', 'punya saya sendiri, tidak usah dievaluasi', 'udah pokoknya', 4, '2026-08-19 05:07:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-19 05:03:36', '2026-08-19 05:07:07'),
(10, 4, 1, 0.00, 0.00, 'Masih merancang atau merencanakan', 'tersedianya draft naskah RIPJPID', 'Terdapat kesulitan pada penyesuaian waktu karena koordinasi lintas koordinator', '', '', 'sudah_dievaluasi', 'Segera koordinasikan dan wajib selesai pada TW berikutnya', 'Melakukan percepatan koordinasi dengan ...', 1, '2026-08-20 07:18:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-20 07:15:52', '2026-08-20 07:18:50'),
(11, 5, 1, 12.00, 12.00, 'asdfasdfasdfasfasf', 'asdfasddddddddddddddddddddddddddddddddddddasdf', 'asdfasdfasdfasdfasdfasdfasdfasdfasdfasdf', '', '', 'menunggu_evaluasi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-26 03:22:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('super_admin','produsen','publik','pimpinan','verifikator') NOT NULL DEFAULT 'publik',
  `divisi` enum('sekretariat','inovasi','litbang') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `divisi`, `created_at`) VALUES
(1, 'Admin', 'admin@satria.local', 'PSMuyTHy4hQU1Y4aU7OVniX6VpH1K05wakPU0L0oUrs=', 'super_admin', NULL, '2026-03-16 20:52:01'),
(4, 'Pimpinan', 'pimpinan@satria.local', 'WWPlW+g5oso69zkaOtGZFK9NknssGC1bZiQwytKolqc=', 'pimpinan', NULL, '2026-07-02 06:03:10'),
(5, 'Verifikator', 'verifikator@satria.local', 'oLPNkXM/kUN17oH4PNgLI+XV3em9Yn1jwCBhRr2SBQ8=', 'verifikator', NULL, '2026-07-02 06:03:10'),
(6, 'Sekretariat', 'sekretariat@satria.local', 'gmhT0B01uFYpCz4Y0KVsf1/4gBWuT07oVJuLpPXA5Js=', 'produsen', 'sekretariat', '2026-07-13 01:51:44'),
(8, 'Inovasi', 'inovasi@satria.local', 'bGPLkTS1ApuuweArr9jXpVsa0QL0bIemzV80HDlVTCM=', 'produsen', 'inovasi', '2026-07-13 01:51:44'),
(10, 'Litbang', 'litbang@satria.local', 'qxLYCIxwyxagZJoxMqQ2FncUqJdwBkzvIFXrtJ0X6d0=', 'produsen', 'litbang', '2026-07-13 01:51:44'),
(13, 'Anak Magang', 'magang@satria.local', '1vw+R3raA38mwA9S5zLrURM8pXVoYLtcAS4pQmDh2QI=', 'super_admin', NULL, '2026-08-19 04:12:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `datasets`
--
ALTER TABLE `datasets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_datasets_user` (`user_id`),
  ADD KEY `fk_datasets_category` (`category_id`);

--
-- Indexes for table `dataset_docs`
--
ALTER TABLE `dataset_docs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dataset_docs_dataset` (`dataset_id`);

--
-- Indexes for table `dataset_files`
--
ALTER TABLE `dataset_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dataset_files_dataset` (`dataset_id`);

--
-- Indexes for table `dataset_metadata`
--
ALTER TABLE `dataset_metadata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dataset_metadata` (`dataset_id`);

--
-- Indexes for table `dataset_metrics`
--
ALTER TABLE `dataset_metrics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_dataset_metrics_dataset` (`dataset_id`),
  ADD KEY `idx_dataset_metrics_type` (`metric_type`);

--
-- Indexes for table `dataset_notification_reads`
--
ALTER TABLE `dataset_notification_reads`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_dataset_notif_read` (`dataset_id`,`user_id`),
  ADD KEY `idx_dataset_notif_reads_user` (`user_id`);

--
-- Indexes for table `dataset_pdfs`
--
ALTER TABLE `dataset_pdfs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dataset_pdfs_dataset` (`dataset_id`);

--
-- Indexes for table `dataset_revisions`
--
ALTER TABLE `dataset_revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_revision_requestor` (`requested_by`),
  ADD KEY `idx_revision_dataset` (`dataset_id`),
  ADD KEY `idx_revision_status` (`status`);

--
-- Indexes for table `deadline_notification_reads`
--
ALTER TABLE `deadline_notification_reads`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_deadline_read_user` (`deadline_id`,`user_id`),
  ADD KEY `idx_deadline_reads_user` (`user_id`);

--
-- Indexes for table `document_deadlines`
--
ALTER TABLE `document_deadlines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_document_deadlines_creator` (`created_by`),
  ADD KEY `idx_document_deadlines_at` (`deadline_at`),
  ADD KEY `idx_document_deadlines_dataset` (`dataset_id`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_feedbacks_sender` (`sender_id`),
  ADD KEY `idx_feedbacks_recipient_status` (`recipient_role`,`status`),
  ADD KEY `idx_feedbacks_dataset` (`dataset_id`),
  ADD KEY `fk_feedbacks_reply_by` (`reply_by`);

--
-- Indexes for table `feedback_responses`
--
ALTER TABLE `feedback_responses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_fb_resp_sender` (`sender_id`),
  ADD KEY `idx_fb_resp_feedback` (`feedback_id`);

--
-- Indexes for table `hki`
--
ALTER TABLE `hki`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inovasi`
--
ALTER TABLE `inovasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_dataset`
--
ALTER TABLE `kategori_dataset`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_kategori` (`nama_kategori`);

--
-- Indexes for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_logs_user` (`user_id`);

--
-- Indexes for table `metadata`
--
ALTER TABLE `metadata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_metadata_dataset` (`dataset_id`);

--
-- Indexes for table `metadata_schema`
--
ALTER TABLE `metadata_schema`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_schema_kategori` (`kategori_id`);

--
-- Indexes for table `peneliti`
--
ALTER TABLE `peneliti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `publikasi`
--
ALTER TABLE `publikasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `repositori`
--
ALTER TABLE `repositori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sicakab_dropdown_items`
--
ALTER TABLE `sicakab_dropdown_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parent` (`parent_id`),
  ADD KEY `idx_level` (`level`);

--
-- Indexes for table `sicakab_reports`
--
ALTER TABLE `sicakab_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sicakab_user` (`user_id`),
  ADD KEY `idx_sicakab_status` (`status`),
  ADD KEY `fk_sicakab_report_target` (`target_id`);

--
-- Indexes for table `sicakab_satuan`
--
ALTER TABLE `sicakab_satuan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_key` (`item_key`);

--
-- Indexes for table `sicakab_targets`
--
ALTER TABLE `sicakab_targets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sicakab_target_user` (`created_by`),
  ADD KEY `idx_sicakab_target_bagian` (`bagian`),
  ADD KEY `idx_sicakab_target_tahun` (`tahun`);

--
-- Indexes for table `sicakab_triwulan`
--
ALTER TABLE `sicakab_triwulan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_sicakab_tri` (`report_id`,`tw`),
  ADD KEY `idx_sicakab_tri_report` (`report_id`),
  ADD KEY `idx_sicakab_tri_status` (`status`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `datasets`
--
ALTER TABLE `datasets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `dataset_docs`
--
ALTER TABLE `dataset_docs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `dataset_files`
--
ALTER TABLE `dataset_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `dataset_metadata`
--
ALTER TABLE `dataset_metadata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=436;

--
-- AUTO_INCREMENT for table `dataset_metrics`
--
ALTER TABLE `dataset_metrics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `dataset_notification_reads`
--
ALTER TABLE `dataset_notification_reads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dataset_pdfs`
--
ALTER TABLE `dataset_pdfs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `dataset_revisions`
--
ALTER TABLE `dataset_revisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `deadline_notification_reads`
--
ALTER TABLE `deadline_notification_reads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_deadlines`
--
ALTER TABLE `document_deadlines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `feedback_responses`
--
ALTER TABLE `feedback_responses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hki`
--
ALTER TABLE `hki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inovasi`
--
ALTER TABLE `inovasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori_dataset`
--
ALTER TABLE `kategori_dataset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18523;

--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=586;

--
-- AUTO_INCREMENT for table `metadata`
--
ALTER TABLE `metadata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `metadata_schema`
--
ALTER TABLE `metadata_schema`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `peneliti`
--
ALTER TABLE `peneliti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `publikasi`
--
ALTER TABLE `publikasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `repositori`
--
ALTER TABLE `repositori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sicakab_dropdown_items`
--
ALTER TABLE `sicakab_dropdown_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `sicakab_reports`
--
ALTER TABLE `sicakab_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sicakab_satuan`
--
ALTER TABLE `sicakab_satuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sicakab_targets`
--
ALTER TABLE `sicakab_targets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `sicakab_triwulan`
--
ALTER TABLE `sicakab_triwulan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `datasets`
--
ALTER TABLE `datasets`
  ADD CONSTRAINT `fk_datasets_category` FOREIGN KEY (`category_id`) REFERENCES `kategori_dataset` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_datasets_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `dataset_docs`
--
ALTER TABLE `dataset_docs`
  ADD CONSTRAINT `fk_dataset_docs_dataset` FOREIGN KEY (`dataset_id`) REFERENCES `datasets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dataset_files`
--
ALTER TABLE `dataset_files`
  ADD CONSTRAINT `fk_dataset_files_dataset` FOREIGN KEY (`dataset_id`) REFERENCES `datasets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dataset_metadata`
--
ALTER TABLE `dataset_metadata`
  ADD CONSTRAINT `fk_dataset_metadata` FOREIGN KEY (`dataset_id`) REFERENCES `datasets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dataset_metrics`
--
ALTER TABLE `dataset_metrics`
  ADD CONSTRAINT `fk_dataset_metrics_dataset` FOREIGN KEY (`dataset_id`) REFERENCES `datasets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dataset_notification_reads`
--
ALTER TABLE `dataset_notification_reads`
  ADD CONSTRAINT `fk_dataset_notif_reads_dataset` FOREIGN KEY (`dataset_id`) REFERENCES `datasets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_dataset_notif_reads_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dataset_pdfs`
--
ALTER TABLE `dataset_pdfs`
  ADD CONSTRAINT `fk_dataset_pdfs_dataset` FOREIGN KEY (`dataset_id`) REFERENCES `datasets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dataset_revisions`
--
ALTER TABLE `dataset_revisions`
  ADD CONSTRAINT `fk_revision_dataset` FOREIGN KEY (`dataset_id`) REFERENCES `datasets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_revision_requestor` FOREIGN KEY (`requested_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `deadline_notification_reads`
--
ALTER TABLE `deadline_notification_reads`
  ADD CONSTRAINT `fk_deadline_reads_deadline` FOREIGN KEY (`deadline_id`) REFERENCES `document_deadlines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_deadline_reads_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `document_deadlines`
--
ALTER TABLE `document_deadlines`
  ADD CONSTRAINT `fk_document_deadlines_creator` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_document_deadlines_dataset` FOREIGN KEY (`dataset_id`) REFERENCES `datasets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD CONSTRAINT `fk_feedbacks_dataset` FOREIGN KEY (`dataset_id`) REFERENCES `datasets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_feedbacks_reply_by` FOREIGN KEY (`reply_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_feedbacks_sender` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `feedback_responses`
--
ALTER TABLE `feedback_responses`
  ADD CONSTRAINT `fk_fb_resp_feedback` FOREIGN KEY (`feedback_id`) REFERENCES `feedbacks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fb_resp_sender` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `fk_logs_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `metadata`
--
ALTER TABLE `metadata`
  ADD CONSTRAINT `fk_metadata_dataset` FOREIGN KEY (`dataset_id`) REFERENCES `datasets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `metadata_schema`
--
ALTER TABLE `metadata_schema`
  ADD CONSTRAINT `fk_schema_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `kategori_dataset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sicakab_dropdown_items`
--
ALTER TABLE `sicakab_dropdown_items`
  ADD CONSTRAINT `fk_sicakab_dropdown_parent` FOREIGN KEY (`parent_id`) REFERENCES `sicakab_dropdown_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sicakab_reports`
--
ALTER TABLE `sicakab_reports`
  ADD CONSTRAINT `fk_sicakab_report_target` FOREIGN KEY (`target_id`) REFERENCES `sicakab_targets` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sicakab_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sicakab_targets`
--
ALTER TABLE `sicakab_targets`
  ADD CONSTRAINT `fk_sicakab_target_user` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sicakab_triwulan`
--
ALTER TABLE `sicakab_triwulan`
  ADD CONSTRAINT `fk_sicakab_tri_report` FOREIGN KEY (`report_id`) REFERENCES `sicakab_reports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
