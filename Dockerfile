FROM node:18-alpine

WORKDIR /app

COPY package.json package-lock.json* pnpm-lock.yaml* ./

RUN npm install --omit=dev

COPY . .

RUN mkdir -p /root/.xiaoi

ENV XIAOI_NO_UPDATE_CHECK=1

EXPOSE 3088

CMD ["node", "lib/webhook_server.js"]
