# PHP 8.2 dipilih agar sama persis dengan versi yang tercatat di header
# satria_brida.sql (dump dibuat dari PHP 8.2.12 / MariaDB 10.4 di XAMPP lama),
# supaya perilaku PHP tidak berubah saat pindah dari XAMPP ke Docker.
FROM php:8.2-apache

# Dependensi sistem untuk ekstensi yang dipakai composer.lock (gd, zip, xml,
# mbstring, dst) + pdo_mysql untuk koneksi ke MariaDB.
RUN apt-get update && apt-get install -y --no-install-recommends \
        libzip-dev \
        libpng-dev \
        libonig-dev \
        libxml2-dev \
        libicu-dev \
        unzip \
        git \
    && docker-php-ext-install pdo_mysql mysqli gd zip mbstring xml intl \
    && a2enmod rewrite \
    && rm -rf /var/lib/apt/lists/*

# Naikkan limit upload/memory bawaan PHP (default 2M/8M kekecilan untuk
# MAX_UPLOAD_SIZE 10MB di config.php & untuk phpspreadsheet/dompdf).
COPY docker/php/uploads.ini /usr/local/etc/php/conf.d/uploads.ini

# Composer disediakan di dalam container untuk keperluan manual, mis.
# "docker compose exec app composer install" kalau folder vendor/ dihapus
# atau ada dependensi baru. vendor/ yang sudah ada di repo tetap dipakai
# apa adanya (tidak di-install ulang otomatis saat build).
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html
COPY . /var/www/html

# Folder upload harus bisa ditulis oleh proses Apache (www-data).
RUN mkdir -p uploads/datasets uploads/sicakab uploads/guidebook \
    && chown -R www-data:www-data uploads

EXPOSE 80
