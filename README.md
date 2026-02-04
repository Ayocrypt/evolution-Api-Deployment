# Evolution API - One-Click Deployment

<div align="center">

![AI4Africa Logo](https://cdn.jsdelivr.net/gh/Ayocrypt/Js-delivery-inages/ai4africaLogo.jpg)

**Deploy on Railway** 🚂

</div>

## 🚀 Quick Deploy

Deploy Evolution API with Manager UI in one click using Railway or any platform that supports Docker Compose.

## ⚠️ Note About Manager UI

Due to issues with the Evolution Manager UI Docker image, we've included the Manager UI source code directly in this repository. The code is **identical to the official Evolution Manager v2 repository** - no modifications, no differences. It will be built from source during deployment.

## 📝 Configuration

**Only one thing you need to change:**

Edit the `.env` file and update your API key:

```env
AUTHENTICATION_API_KEY=your-secure-api-key-here
```

**⚠️ Important:** Change `AUTHENTICATION_API_KEY` in production! The default key is not secure.

## 🌐 Deploy on Railway

### Option 1: Using Railway CLI (No GitHub Required) ⭐ Recommended

1. **Install Railway CLI**
   ```bash
   # Windows (PowerShell)
   iwr https://railway.app/install.ps1 | iex
   
   # Mac/Linux
   curl -fsSL https://railway.app/install.sh | sh
   ```

2. **Login to Railway**
   ```bash
   railway login
   ```

3. **Deploy**
   ```bash
   # Clone this repository
   git clone https://github.com/Ayocrypt/evolution-Api-Deployment.git
   cd evolution-Api-Deployment
   
   # Edit .env file - set your AUTHENTICATION_API_KEY
   
   # Deploy using Railway CLI
   railway up
   ```

4. **Set Environment Variables**
   - Railway CLI will prompt you to set environment variables
   - Or set them via Railway dashboard after deployment

### Option 2: Using Railway Web (Requires GitHub)

1. **Push to GitHub**
   - Push this repository to your GitHub account

2. **Deploy on Railway**
   - Go to [Railway.app](https://railway.app)
   - Click "New Project"
   - Select "Deploy from GitHub repo"
   - Choose your repository
   - Railway will auto-detect `docker-compose.yml`

3. **Set Environment Variables**
   - Go to your project settings
   - Add your `AUTHENTICATION_API_KEY` from `.env` file
   - Add other environment variables if needed

4. **Deploy**
   - Railway will automatically build and deploy all services
   - Manager UI will be built from source during deployment
   - Wait for deployment to complete

5. **Access Your Services**
   - **API**: Your Railway URL (port 8080)
   - **Manager UI**: Your Railway URL (port 3000)

## 🌐 Alternative Platforms (No GitHub Required)

### Render.com

1. **Create Account** at [Render.com](https://render.com)
2. **New Blueprint** - Upload `docker-compose.yml` file
3. **Set Environment Variables** from `.env` file
4. **Deploy** - Render will handle everything

### Fly.io

1. **Install Fly CLI**
   ```bash
   # Windows
   powershell -Command "iwr https://fly.io/install.ps1 -useb | iex"
   
   # Mac/Linux
   curl -L https://fly.io/install.sh | sh
   ```

2. **Login and Deploy**
   ```bash
   fly auth login
   fly launch
   ```

### DigitalOcean App Platform

1. **Create Account** at [DigitalOcean](https://www.digitalocean.com)
2. **Create App** - Upload `docker-compose.yml`
3. **Configure** environment variables
4. **Deploy**

## 🐳 Deploy Locally

```bash
# Clone the repository
git clone https://github.com/Ayocrypt/evolution-Api-Deployment.git
cd evolution-Api-Deployment

# Edit .env file - set your AUTHENTICATION_API_KEY
# Then deploy
docker compose up -d
```

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

## 📚 Documentation

- [Evolution API Docs](https://doc.evolution-api.com)
- [Railway Docs](https://docs.railway.app)

## 🆘 Support

For issues and questions:
- [Evolution API Discord](https://evolution-api.com/discord)
- [GitHub Issues](https://github.com/EvolutionAPI/evolution-api/issues)

---

**Made with ❤️ by AI4Africa**
