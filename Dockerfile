FROM dunglas/frankenphp:latest

# 1. Instal extension yang dibutuhkan Laravel secara lengkap
RUN install-php-extensions \
    pdo_mysql \
    gd \
    intl \
    zip \
    opcache \
    bcmath

# 2. Set working directory ke folder aplikasi
WORKDIR /app

# 3. Salin file composer terlebih dahulu (Opsional: untuk optimasi cache layer)
# COPY composer.json composer.lock ./
# RUN composer install --no-scripts --no-autoloader

# 4. Salin seluruh kode aplikasi
COPY . /app

# 5. Berikan izin akses (Ownership) ke user www-data (user default server)
# Ini penting agar Laravel bisa menulis log dan upload file
RUN chown -R www-data:www-data /app/storage /app/bootstrap/cache \
    && chmod -R 775 /app/storage /app/bootstrap/cache

# 6. Jalankan perintah pembersihan cache (Opsional)
# RUN php artisan config:clear
