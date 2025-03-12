#!/bin/sh

# 오류 발생 시 즉시 종료
set -e

# DB가 준비될 때까지 대기
echo "⏳ Waiting for PostgreSQL to be ready..."
until pg_isready -h db -p 5432 -q; do
  sleep 1
done
echo "✅ PostgreSQL is up - running migrations"

# 캐시 삭제 및 설정 다시 로드
# php artisan config:clear
# php artisan cache:clear
# php artisan config:cache
# php artisan route:cache
# echo "✅ 캐시 삭제 및 설정 다시 로드"

# # 캐시 테이블이 존재하는지 확인 후 생성 (필요할 때만 실행)
# if ! php artisan migrate:status | grep -q "cache"; then
#   php artisan cache:table
#   echo "✅ artisan cache:table 실행"
# fi


php artisan migrate #--force



# 마이그레이션 실행 (migrations 테이블이 있을 때만)
# if php artisan migrate:status >/dev/null 2>&1; then
#   php artisan migrate #--force
#   echo "✅ 마이그레이션 실행"
# else
#   echo "⚠️ migrations 테이블이 없어서 마이그레이션을 실행하지 않음"
# fi

# Laravel 실행 (PHP-FPM)
exec php-fpm
echo "✅✅✅✅ EXEC php-fpm ✅✅✅✅"
