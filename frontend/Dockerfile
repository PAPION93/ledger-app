# Node 베이스 이미지 사용
FROM node:18

# 작업 디렉토리 설정
WORKDIR /usr/src/app

# package.json 및 package-lock.json을 복사하여 의존성 설치
COPY package*.json ./

# 의존성 설치
RUN npm install

# 소스 코드 복사
COPY . .

# 애플리케이션 빌드
RUN npm run build

# 포트 노출
EXPOSE 3000

# 애플리케이션 시작
CMD ["npm", "start"]

