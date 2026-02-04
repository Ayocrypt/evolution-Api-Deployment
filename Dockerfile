# Manager UI – for Render Web Service (repo root). Builds evolution-manager-v2.
FROM node:20-alpine AS build
WORKDIR /usr/src/app

COPY evolution-manager-v2/package*.json ./
RUN npm ci --ignore-scripts

COPY evolution-manager-v2/src/ ./src/
COPY evolution-manager-v2/tsconfig.json evolution-manager-v2/tsconfig.app.json evolution-manager-v2/tsconfig.node.json evolution-manager-v2/vite.config.ts ./
COPY evolution-manager-v2/postcss.config.js evolution-manager-v2/tailwind.config.js evolution-manager-v2/index.html evolution-manager-v2/components.json ./
COPY evolution-manager-v2/public/ ./public/
RUN npm run build

FROM node:20-alpine
WORKDIR /app
COPY --from=build /usr/src/app/dist .
EXPOSE 80
CMD ["npx", "-y", "serve", "-s", ".", "-l", "80"]
