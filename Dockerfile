FROM node:18-alpine

WORKDIR /app

# 패키지 파일 복사
COPY package*.json ./
COPY pnpm-lock.yaml ./

# pnpm 설치
RUN npm install -g pnpm

# 의존성 설치
RUN pnpm install

# 소스 코드 복사
COPY . .

# 빌드
RUN pnpm run build

# 포트 노출
EXPOSE 3000

# 서버 시작
CMD ["pnpm", "start"]
