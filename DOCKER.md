# Migrasi XAMPP → Docker (satria_brida)

## Sebelum mulai
1. **Matikan Apache & MySQL di XAMPP Control Panel** (Stop keduanya). Kalau
   masih jalan, akan rebutan port 80/3306 dengan container.
2. Pastikan Docker Desktop (Windows) sudah nyala.

## File baru yang ditambahkan
- `Dockerfile` — image PHP 8.2 + Apache (disamakan dgn versi PHP di dump SQL lama).
- `docker-compose.yml` — 3 service: `app` (PHP/Apache), `db` (MariaDB 10.4), `phpmyadmin`.
- `docker/php/uploads.ini` — naikkan limit upload/memory PHP.
- `.env` — kredensial & port, sudah diisi default untuk dev lokal.
- `config/config.php` — diedit: `DB_HOST/DB_NAME/DB_USER/DB_PASS` sekarang baca
  environment variable dulu, baru fallback ke nilai lama (jadi tetap jalan
  kalau suatu saat dipakai lagi di XAMPP tanpa Docker).

## Menjalankan
Dari root folder project (tempat `docker-compose.yml` berada):

```
docker compose up -d --build
```

Tunggu sampai `db` berstatus healthy (cek dgn `docker compose ps`) — `app`
dan `phpmyadmin` otomatis menunggu `db` siap sebelum start, jadi tidak akan
ada race condition "connection refused" seperti masalah timing yang dulu
pernah ketemu.

- Aplikasi: http://localhost:8080
- phpMyAdmin: http://localhost:8081 (server: `db`, user/pass sesuai `.env`)
- MariaDB juga dibuka ke host di port 3306 kalau mau connect dari HeidiSQL/DBeaver.

Database `satria_brida` otomatis dibuat & diisi dari `satria_brida.sql`
**hanya saat volume `db_data` masih kosong** (first run). Kalau nanti mau
reset total ke isi SQL asli lagi:

```
docker compose down -v
docker compose up -d --build
```
(`-v` menghapus volume database — semua data yg sudah berubah lewat aplikasi akan hilang, kembali ke isi satria_brida.sql).

## Kalau ada perubahan composer.json
`vendor/` sudah ikut ter-bind-mount dari folder project (bukan di-generate
ulang otomatis saat build). Kalau nambah/ubah dependency:

```
docker compose exec app composer install
```

## File upload
Folder `uploads/` tetap folder biasa di project (bind-mount), jadi file yang
diupload lewat aplikasi tetap muncul & bisa diakses langsung di Windows
Explorer seperti waktu masih pakai XAMPP.
