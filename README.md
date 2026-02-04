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

## 🐳 Deploy Locally

```bash
# Clone the repository
git clone <your-repo-url>
cd evolution-deployment

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
