# Connect Evolution API to [whatsapp.ai4africa.app](https://whatsapp.ai4africa.app)

<div align="center">
  <img src="https://cdn.jsdelivr.net/gh/Ayocrypt/Js-delivery-inages/ai4africaLogo.jpg" width="90" alt="WhatsApp AI4Africa" />
  <span style="margin: 0 12px; font-size: 24px;">→</span>
  <img src="evolution-manager-v2/public/assets/images/evolution-logo.png" width="140" alt="Evolution API" />
</div>

<div align="center">

This repo is the **simple way to run Evolution API and connect it to**

**[whatsapp.ai4africa.app](https://whatsapp.ai4africa.app)**

</div>

---

## The flow (step by step)

### 1. On [whatsapp.ai4africa.app](https://whatsapp.ai4africa.app)

1. Create an account.
2. Select your **AI agent**.
3. Go to **WhatsApp setup** and choose **Evolution API** as the provider.

### 2. Deploy Evolution API (choose one)

Pick how you want to run Evolution API — **on Render for free** (Step 1 or 2) or **locally** (Step 3).

| Option | Best for | Card? |
|--------|----------|-------|
| **Step 1 – Full stack** | One-click Blueprint; everything linked | Yes |
| **Step 2 – One-by-one** | Free, no card; PostgreSQL → API → Manager UI (easiest to connect your phone) | No |
| **Step 3 – Locally** | Run on your machine with Docker | No |

### 3. After deploy: connect to the platform

1. Copy your **Evolution API base URL** from Render (e.g. `https://your-evolution-api.onrender.com`).
2. In [whatsapp.ai4africa.app](https://whatsapp.ai4africa.app), paste this as the **backend/base URL**.
3. In your env (or app config), set **instance name** and **API key** (same as `AUTHENTICATION_API_KEY` you used for Evolution API).

That’s it — Evolution API is now connected to [whatsapp.ai4africa.app](https://whatsapp.ai4africa.app).

---

## Step 1: Full stack (Blueprint, requires card)

One deploy from `render.yaml`; Render creates API, Manager, PostgreSQL, and Redis and links them.

1. Go to [Render.com](https://render.com) and sign in.
2. **New +** → **Blueprint**.
3. Connect repo: `https://github.com/Ayocrypt/evolution-Api-Deployment`
4. Set **`AUTHENTICATION_API_KEY`** (and **`SERVER_URL`** once the API is live).
5. **Apply** — wait until everything is up.

---

## Step 2: One-by-one on Render (free, no card)

No Redis. You create **3 things**: **(1) PostgreSQL**, **(2) Evolution API**, **(3) Manager UI**. Good for connecting your phone step by step.

### 2.1 PostgreSQL

1. Render → **New +** → **PostgreSQL**.
2. Name (e.g. `evolution-postgres`), region, **Free** plan → Create.
3. Open the DB and copy the **Internal Database URL** (e.g. `postgresql://USER:PASSWORD@HOST/DATABASE?sslmode=require`).
4. You’ll use this as **`DATABASE_CONNECTION_URI`** in the API.

### 2.2 Evolution API

1. **New +** → **Web Service**.
2. Connect repo or use **Deploy from image**. Image:
   ```text
   evoapicloud/evolution-api:latest
   ```
3. **Add Environment Variables.** **Compulsory** (must be set; sample values below):

   - **`AUTHENTICATION_API_KEY`** — e.g. `my-secret-api-key-123`
   - **`DATABASE_CONNECTION_URI`** — e.g. `postgresql://user:password@host/database?sslmode=require`
   - **`DATABASE_PROVIDER`** — e.g. `postgresql`
   - **`CACHE_REDIS_ENABLED`** — e.g. `false`

   Copy-paste (replace with your values):

   ```env
   AUTHENTICATION_API_KEY=my-secret-api-key-123
   DATABASE_CONNECTION_URI=postgresql://user:password@host/database?sslmode=require
   DATABASE_PROVIDER=postgresql
   CACHE_REDIS_ENABLED=false
   ```

   | Key | Value |
   |-----|--------|
   | `AUTHENTICATION_API_KEY` | Your secret API key (e.g. `my-secret-api-key-123`) |
   | `DATABASE_PROVIDER` | `postgresql` |
   | `DATABASE_CONNECTION_URI` | PostgreSQL URL from 2.1 |
   | `DATABASE_ENABLED` | `true` |
   | `CACHE_REDIS_ENABLED` | `false` |
   | `SERVER_TYPE` | `http` |
   | `SERVER_PORT` | `8080` |
   | `SERVER_URL` | Your API URL (set after first deploy) |
   | `CORS_ORIGIN` | `*` |
   | `DATABASE_CONNECTION_CLIENT_NAME` | `evolution_exchange` |
   | `LOG_LEVEL` | `ERROR,WARN,INFO` |
   | `LOG_COLOR` | `true` |

4. Deploy. When live, set **`SERVER_URL`** to that URL (e.g. `https://your-evolution-api.onrender.com`).

### 2.3 Manager UI

1. **New +** → **Web Service** → connect **public repo**:
   ```text
   https://github.com/Ayocrypt/evolution-Api-Deployment
   ```
2. **Root Directory:** `evolution-manager-v2` → Deploy and wait.
3. Open the Manager URL → set **API URL** (your Evolution API URL from 2.2) and **API key** (same as `AUTHENTICATION_API_KEY`).

**Summary:** PostgreSQL → Evolution API (image + env) → Manager UI (repo + root dir). No Redis.

---

## Step 3: Run locally

```bash
git clone https://github.com/Ayocrypt/evolution-Api-Deployment.git
cd evolution-Api-Deployment
# Edit .env — set AUTHENTICATION_API_KEY and SERVER_URL
docker compose up -d
```

- **Evolution API:** http://localhost:8081 (or `SERVER_PORT` in `.env`)
- **Manager UI:** http://localhost:3004 (or port in `docker-compose.yml`)

Use the same API key in the Manager UI as in `.env`.

---

## What’s in this repo

- **Evolution API** – WhatsApp API backend (image: `evoapicloud/evolution-api:latest`).
- **Manager UI** – [evolution-manager-v2](https://github.com/Ayocrypt/evolution-Api-Deployment/tree/main/evolution-manager-v2).
- **PostgreSQL** – DB for Evolution API.
- **Redis** – Used in Blueprint and local; not needed for Step 2.

---

## Docs & support

- [Evolution API Docs](https://doc.evolution-api.com)
- [Render Blueprint](https://render.com/docs/blueprint-spec)
- [Evolution API Discord](https://evolution-api.com/discord) · [GitHub](https://github.com/EvolutionAPI/evolution-api/issues)

**Made with ❤️ by AI4Africa**
