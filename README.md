# Evolution API - One-Click Deployment

<div align="center">

![AI4Africa Logo](https://cdn.jsdelivr.net/gh/Ayocrypt/Js-delivery-inages/ai4africaLogo.jpg)

</div>

## 🚀 Quick Deploy on Render

**Render** lets you deploy from a **public GitHub repo** without needing your own GitHub account. This repo includes `render.yaml` which tells Render how to deploy everything automatically.

### Steps:

1. Go to [Render.com](https://render.com)
2. Sign up or log in
3. Click **"New +"** → **"Blueprint"** (⚠️ NOT "Web Service" - use Blueprint!)
4. Paste this public repo URL: **`https://github.com/Ayocrypt/evolution-Api-Deployment`**
5. Render will detect `render.yaml` and show you all services it will create
6. Set your **`AUTHENTICATION_API_KEY`** when prompted (or add it later in environment variables)
7. Click **"Apply"** — Render will build and deploy everything ✅

**That's it!** Render will automatically:
- Deploy Evolution API (from pre-built Docker image)
- Build and deploy Manager UI (from source)
- Create PostgreSQL database
- Create Redis cache
- Connect everything together

## ⚠️ Note About Manager UI

Because of issues with the Evolution Manager UI Docker image, we ship the Manager UI source code in this repo. The code is **the same as the official Evolution Manager v2** — no changes. It’s built from source when you deploy.

## 📝 Configuration

**Only one thing you must set:**

Your API key. In Render, add this environment variable:

- **`AUTHENTICATION_API_KEY`** = your secure API key

**⚠️ Important:** Don’t use the default key in production. Set your own `AUTHENTICATION_API_KEY`.

## 📁 What's Included

- **Evolution API** – WhatsApp API backend (pre-built Docker image)
- **Manager UI** – Web interface (built from source, official codebase)
- **PostgreSQL** – Database
- **Redis** – Cache

## 🔧 Services

- **API**: Port 8080  
- **Manager UI**: Port 3000  
- **PostgreSQL**: Port 5432  
- **Redis**: Port 6379  

## 🐳 Deploy Locally (Optional)

```bash
git clone https://github.com/Ayocrypt/evolution-Api-Deployment.git
cd evolution-Api-Deployment
# Edit .env — set AUTHENTICATION_API_KEY
docker compose up -d
```

## 📚 Documentation

- [Evolution API Docs](https://doc.evolution-api.com)
- [Render Blueprint Docs](https://render.com/docs/infrastructure-as-code)

## 🆘 Support

- [Evolution API Discord](https://evolution-api.com/discord)
- [GitHub Issues](https://github.com/EvolutionAPI/evolution-api/issues)

---

**Made with ❤️ by AI4Africa**
