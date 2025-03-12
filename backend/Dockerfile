FROM php:8.2-fpm

WORKDIR /var/www

# 필요한 PHP 확장 설치
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    unzip \
    git \
    libpq-dev netcat-openbsd postgresql-client \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd zip pdo pdo_mysql pdo_pgsql

# Composer 설치
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 프로젝트 복사
COPY . .

# 권한 설정
RUN chmod -R 777 storage bootstrap/cache

# Composer 패키지 설치
RUN composer install --no-dev --optimize-autoloader

# Laravel 캐시 설정
RUN php artisan config:cache && php artisan route:cache

# Entrypoint 스크립트 복사 및 실행 권한 부여
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Entrypoint 설정
ENTRYPOINT ["/entrypoint.sh"]
