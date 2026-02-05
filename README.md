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

## Videos

What you see here is just a **thumbnail** — click it to open the full video on Loom. *Why not a full preview?* GitHub READMEs don’t allow embedded video players (no iframes), so we can only show a thumbnail + link; one click takes you to Loom to watch the full video. *If playback is limited,* in Loom set sharing to **Anyone with the link** and turn off any preview limit.

**1. Complete setup for Option 2** — PostgreSQL → Evolution API → Manager UI on Render · **~12 min**

[![Complete setup for Option 2](https://cdn.loom.com/sessions/thumbnails/67de2acbf898454781f98f879365968c-c721fce55fda66df.gif)](https://www.loom.com/share/67de2acbf898454781f98f879365968c)

**2. Full testing on WhatsApp** — End-to-end test: connect and use Evolution API with WhatsApp · **~4 min**

[![Full testing on WhatsApp](https://cdn.loom.com/assets/img/og/slack-protected-video.gif)](https://www.loom.com/share/760b4f18e5554a11bfca0752a28e9055)

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
2. Name (e.g. `evolution-postgres`), region, **Free** plan → Create.( Wait for at least 1 to 2 mins until you see available status
<img width="414" height="176" alt="image" src="https://github.com/user-attachments/assets/fe6e5385-9ffc-4876-adbd-5887b85cd34e" />

3. Open the DB and copy the **Internal Database URL** (e.g. `postgresql://USER:PASSWORD@HOST/DATABASE?sslmode=require`).
4. You’ll use this as **`DATABASE_CONNECTION_URI`** in the API.

### 2.2 Evolution API

1. **New +** → **Web Service**.
2. Connect repo or use **Deploy from image**. Image:
   ```text
   evoapicloud/evolution-api:latest
   ```
3. **Add Environment Variables.** **Compulsory** (must be set; sample values below):

   - **`AUTHENTICATION_API_KEY`** — e.g. `my-secret-api-key-123` # do not use this in production please change this to whatever you can remeber
   - **`DATABASE_CONNECTION_URI`** — e.g. `postgresql://user:password@host/database?sslmode=require` # this will be given to you in step 1
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

you will see

<img width="690" height="295" alt="image" src="https://github.com/user-attachments/assets/f2db728d-35e4-42ce-8d11-aafaba02fcac" />

wait for at least 3-10 mins  till you see live status

<img width="722" height="353" alt="image" src="https://github.com/user-attachments/assets/603f9e63-8d45-452d-aa12-48a6752d75b7" />





### 2.3 Manager UI

1. **New +** → **Web Service** → connect **public repo**:
   ```text
   https://github.com/Ayocrypt/evolution-Api-Deployment/tree/main/evolution-manager-v2
   ```

   you will see `building` then `in progress`
   
   <img width="691" height="299" alt="image" src="https://github.com/user-attachments/assets/da4f684b-baf5-412a-96c1-efeedfe741d2" />


   wailt till you see `live ` Status this may take about 5 - 10 min
   
   <img width="675" height="301" alt="image" src="https://github.com/user-attachments/assets/887e38d5-0594-4a02-8e46-a2fd1bd5d041" />


   

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
