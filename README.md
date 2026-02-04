# Evolution API - One-Click Deployment

<div align="center">

![AI4Africa Logo](https://cdn.jsdelivr.net/gh/Ayocrypt/Js-delivery-inages/ai4africaLogo.jpg)

</div>

## 🚀 Quick Deploy

Deploy Evolution API with Manager UI in one click. Just paste the GitHub repo URL and these platforms will auto-detect `docker-compose.yml` and deploy everything automatically.

## ⚠️ Note About Manager UI

Due to issues with the Evolution Manager UI Docker image, we've included the Manager UI source code directly in this repository. The code is **identical to the official Evolution Manager v2 repository** - no modifications, no differences. It will be built from source during deployment.

## 📝 Configuration

**Only one thing you need to change:**

Edit the `.env` file and update your API key:

```env
AUTHENTICATION_API_KEY=your-secure-api-key-here
```

**⚠️ Important:** Change `AUTHENTICATION_API_KEY` in production! The default key is not secure.

## 🌐 Deploy on Cloud Platforms

### Option 1: Railway (Recommended) 🚂

1. Go to [Railway.app](https://railway.app)
2. Click **"New Project"**
3. Select **"Deploy from GitHub repo"**
4. Paste this repo URL: `https://github.com/Ayocrypt/evolution-Api-Deployment`
5. Railway will auto-detect `docker-compose.yml`
6. Set your `AUTHENTICATION_API_KEY` in environment variables
7. Click **"Deploy"** - Done! ✅

### Option 2: Render.com

1. Go to [Render.com](https://render.com)
2. Click **"New +"** → **"Blueprint"**
3. Connect your GitHub account
4. Paste this repo URL: `https://github.com/Ayocrypt/evolution-Api-Deployment`
5. Render will auto-detect `docker-compose.yml`
6. Set your `AUTHENTICATION_API_KEY` in environment variables
7. Click **"Apply"** - Done! ✅

### Option 3: DigitalOcean App Platform

1. Go to [DigitalOcean App Platform](https://cloud.digitalocean.com/apps)
2. Click **"Create App"**
3. Connect GitHub and select this repository
4. DigitalOcean will auto-detect `docker-compose.yml`
5. Set your `AUTHENTICATION_API_KEY` in environment variables
6. Click **"Create Resources"** - Done! ✅

## 📁 What's Included

- **Evolution API** - WhatsApp API backend (pre-built Docker image)
- **Manager UI** - Web interface (built from source, official codebase)
- **PostgreSQL** - Database
- **Redis** - Cache

## 🔧 Services

- **API**: Port 8080
- **Manager UI**: Port 3000
- **PostgreSQL**: Port 5432
- **Redis**: Port 6379

## 🐳 Deploy Locally (Optional)

```bash
# Clone the repository
git clone https://github.com/Ayocrypt/evolution-Api-Deployment.git
cd evolution-Api-Deployment

# Edit .env file - set your AUTHENTICATION_API_KEY
# Then deploy
docker compose up -d
```

## 📚 Documentation

- [Evolution API Docs](https://doc.evolution-api.com)

## 🆘 Support

For issues and questions:
- [Evolution API Discord](https://evolution-api.com/discord)
- [GitHub Issues](https://github.com/EvolutionAPI/evolution-api/issues)

---

**Made with ❤️ by AI4Africa**
