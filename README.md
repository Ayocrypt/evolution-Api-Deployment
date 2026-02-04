# Evolution API – Deployment

<div align="center">

![AI4Africa Logo](https://cdn.jsdelivr.net/gh/Ayocrypt/Js-delivery-inages/ai4africaLogo.jpg)

</div>

You can run the full stack (Evolution API + Manager UI + PostgreSQL + Redis) in three ways:

| Option | Best for | Card required? |
|--------|----------|----------------|
| **1. Blueprint** | One-click deploy, everything linked automatically | Yes |
| **2. Separate Web Services** | Free tier, no card; you create each service yourself | No |
| **3. Locally** | Development or self-hosted on your machine | No |

---

## Option 1: Run as Blueprint (requires card)

Blueprint deploys the whole stack from `render.yaml` in one go. Render requires a **payment method (card)** for Blueprints so it can create and bill multiple services (API, Manager, Redis, Postgres) from a single spec.

**Steps:**

1. Go to [Render.com](https://render.com) and sign in.
2. Click **New +** → **Blueprint**.
3. Connect this repo: **`https://github.com/Ayocrypt/evolution-Api-Deployment`**
4. Set **`AUTHENTICATION_API_KEY`** (and **`SERVER_URL`** to your API URL when it’s live).
5. Click **Apply** — Render creates API, Manager, PostgreSQL, and Redis and wires them.

**Result:** Evolution API, Manager UI, DB, and Redis are all created and connected automatically.

---

## Option 2: Run as separate Web Services (free, no card)

You need **3 things**: **(1) PostgreSQL**, **(2) Evolution API**, **(3) Manager UI**. No Blueprint, so **no card required**; use free tiers where available. **Redis is not needed** — only these three.

### 2.1 Create PostgreSQL

1. In Render: **New +** → **PostgreSQL**.
2. Name it (e.g. `evolution-postgres`), choose a region, **Free** plan.
3. Create. When it’s ready, open the database.
4. Copy the **Internal Database URL** (connection string). It looks like:
   ```text
   postgresql://USER:PASSWORD@HOST/DATABASE?sslmode=require
   ```
5. You’ll paste this into the Evolution API service as **`DATABASE_CONNECTION_URI`**.

---

### 2.2 Deploy Evolution API (Docker image)

1. **New +** → **Web Service**.
2. Connect repo: **`https://github.com/Ayocrypt/evolution-Api-Deployment`** (or choose “Deploy an existing image” if your Render supports it).
3. **Use this image (copy exactly):**
   ```text
   evoapicloud/evolution-api:latest
   ```
   If Render asks for “Docker image URL” or “Image”, paste that. If you must use the repo, set **Root Directory** to empty and ensure the service is set to **Docker** and the image above (some plans allow “Deploy from image”).
4. Add **Environment Variables**. **Compulsory** (must be set; sample values below):
   - **`AUTHENTICATION_API_KEY`** — e.g. `my-secret-api-key-123`
   - **`DATABASE_CONNECTION_URI`** — e.g. `postgresql://user:password@host/database?sslmode=require`
   - **`DATABASE_PROVIDER`** — e.g. `postgresql`
   - **`CACHE_REDIS_ENABLED`** e.g `false`
  
     ```code
     AUTHENTICATION_API_KEY=my-secret-api-key-123`
     DATABASE_CONNECTION_URI=postgresql://user:password@host/database?sslmode=require
     DATABASE_PROVIDER=postgresql
     CACHE_REDIS_ENABLED=false

     ```

   | Key | Value |
   |-----|--------|
   | `SERVER_TYPE` | `http` |
   | `SERVER_PORT` | `8080` |
   | `SERVER_URL` | Your API URL (e.g. `https://evolution-api-xxxx.onrender.com`) — set after first deploy |
   | `CORS_ORIGIN` | `*` |
   | `AUTHENTICATION_API_KEY` | e.g. `my-secret-api-key-123` **(required)** |
   | `DATABASE_ENABLED` | `true` |
   | `DATABASE_PROVIDER` | `postgresql` **(required)** |
   | `DATABASE_CONNECTION_URI` | e.g. `postgresql://user:password@host/database?sslmode=require` **(required)** |
   | `DATABASE_CONNECTION_CLIENT_NAME` | `evolution_exchange` |
   | `CACHE_REDIS_ENABLED` | `false` |
   | `LOG_LEVEL` | `ERROR,WARN,INFO` |
   | `LOG_COLOR` | `true` |

5. Deploy. When it’s live, copy the service URL and set **`SERVER_URL`** to that URL (e.g. `https://your-evolution-api.onrender.com`).

---

### 2.3 Deploy Manager UI

Manager UI is here: [evolution-manager-v2](https://github.com/Ayocrypt/evolution-Api-Deployment/tree/main/evolution-manager-v2).

Super simple: **New +** → **Web Service** → connect **public repo** and paste:

```text
https://github.com/Ayocrypt/evolution-Api-Deployment
```

Set **Root Directory** to `evolution-manager-v2`. Deploy and wait until it’s done. Then open the Manager URL and set the **API URL** (your Evolution API from step 2.2) and the same **API key** as **`AUTHENTICATION_API_KEY`**.

---

### Summary (Option 2)

1. **PostgreSQL** → get Internal Database URL → use as **`DATABASE_CONNECTION_URI`** in the API.
2. **Evolution API** → image **`evoapicloud/evolution-api:latest`** + env vars above (no Redis).
3. **Manager UI** → public repo **`https://github.com/Ayocrypt/evolution-Api-Deployment`**, Root Directory **`evolution-manager-v2`**; wait until done, then set API URL and key in the UI.

That’s all — 3 steps, no Redis.

---

## Option 3: Run locally

Runs the full stack on your machine with Docker. No Render account or card needed.

```bash
git clone https://github.com/Ayocrypt/evolution-Api-Deployment.git
cd evolution-Api-Deployment
# Edit .env — set AUTHENTICATION_API_KEY and SERVER_URL if needed
docker compose up -d
```

- **Evolution API:** http://localhost:8081 (or the port in `.env` as `SERVER_PORT`)
- **Manager UI:** http://localhost:3004 (or the port you mapped for `manager` in `docker-compose.yml`)

Use the same API key in the Manager UI as in `.env` (`AUTHENTICATION_API_KEY`).

---

## What’s in this repo

- **Evolution API** – WhatsApp API backend (use image `evoapicloud/evolution-api:latest`).
- **Manager UI** – Web UI (Evolution Manager v2, built from `evolution-manager-v2/`).
- **PostgreSQL** – Database for Evolution API.
- **Redis** – Cache for Evolution API.

---

## Docs & support

- [Evolution API Docs](https://doc.evolution-api.com)
- [Render Blueprint](https://render.com/docs/blueprint-spec)
- [Evolution API Discord](https://evolution-api.com/discord) · [GitHub Issues](https://github.com/EvolutionAPI/evolution-api/issues)

**Made with ❤️ by AI4Africa**
