# Build
FROM node:20-alpine AS build
WORKDIR /usr/src/app

COPY package*.json ./
RUN npm ci --ignore-scripts

COPY src/ ./src/
COPY tsconfig.json tsconfig.app.json tsconfig.node.json vite.config.ts ./
COPY postcss.config.js tailwind.config.js index.html components.json ./
COPY public/ ./public/
RUN npm run build

# Serve (no nginx – Node serves the static files)
FROM node:20-alpine
WORKDIR /app
COPY --from=build /usr/src/app/dist .
EXPOSE 80
CMD ["npx", "-y", "serve", "-s", ".", "-l", "80"]
