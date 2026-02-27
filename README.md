# 🖨️ Print-Tings Marketplace

Open source marketplace for buying and selling printed products, built on Mercur.

## 🏗 Architecture

```
┌─────────────────────────────────────┐
│  Print Buyers (B2C Storefront)    │
│  - Browse printed products from vendors
│  - 5-star verified reviews             │
│  - Multi-vendor comparison             │
│  - Secure Stripe checkout            │
└─────────────────────────────────────┘
              ↕
┌─────────────────────────────────────┐
│  Print Sellers (Vendor Panel)      │
│  - Manage print listings           │
│  - Track orders & analytics          │
│  - Request payouts                 │
│  - Commission-based selling          │
└─────────────────────────────────────┘
              ↕
┌─────────────────────────────────────┐
│  Platform Admin                  │
│  - Approve vendors                  │
│  - Manage categories & commissions  │
│  - Resolve disputes                 │
└─────────────────────────────────────┘
              ↕
         REST API (MedusaJS)
         ↓
┌─────────────────────────────────────┐
│     PostgreSQL Database            │
│  - Products, vendors, orders       │
│  - Users, reviews, ratings         │
│  - Commissions, payouts             │
└─────────────────────────────────────┘
```

## 🛠 Tech Stack

| Component | Technology |
|-----------|-------------|
| Backend | MedusaJS (Node.js) |
| Database | PostgreSQL |
| Payments | Stripe (built-in) |
| Email | Resend |
| Search | Algolia (optional) |
| Frontend | React/Next.js |

## 🎨 Print Categories

- Canvas Prints
- Posters & Art Prints
- Photo Prints
- Wall Art
- T-Shirts & Apparel
- Mugs & Drinkware
- Stickers & Decals
- Business Cards
- Flyers & Brochures
- Custom Merchandise

## ⭐ Rating System

- **Verified purchase reviews only** - No fake reviews!
- **5-star rating system**
- **Detailed review categories**:
  - Print quality
  - Color accuracy
  - Value for money
  - Shipping speed
  - Seller communication

## 💰 Commission Tiers

| Tier | Rate | Requirements |
|-------|-------|-------------|
| Standard | 15% | None |
| Premium | 12% | 100+ sales/month |
| Enterprise | 10% | 500+ sales/month |

## 🚀 Quick Start

### 1. Clone Repository

```bash
git clone https://github.com/mercurjs/mercur.git print-tings
cd print-tings
```

### 2. Set Up Database

**Option A: PostgreSQL (Local)**
```bash
sudo service postgresql start
sudo -u postgres createdb print_tings
```

**Option B: Neon (Managed - Easiest)**
```bash
# Sign up at https://neon.tech/ (free tier)
# Get connection string from dashboard
# Add to apps/backend/.env
DATABASE_URL=postgres://user:password@ep-cool-neon-host.aws.neon.tech:5432/print_tings
```

### 3. Configure Environment

```bash
cd apps/backend
cp .env.example .env
nano .env
```

### 4. Install Dependencies & Start

```bash
# Install all dependencies
yarn install

# Run migrations
yarn db:migrate

# Seed database (creates admin user)
yarn seed

# Start development
yarn dev
```

### 5. Clone & Start Frontends

```bash
# B2C Storefront (Print Shop)
git clone https://github.com/mercurjs/b2c-marketplace-storefront.git apps/b2c-storefront
cd apps/b2c-storefront
yarn install
yarn dev

# Vendor Panel
git clone https://github.com/mercurjs/vendor-panel.git apps/vendor-panel
cd apps/vendor-panel
yarn install
yarn dev
```

## 📋 Services

| Service | Local URL | Description |
|---------|-----------|-------------|
| **Backend API** | http://localhost:9000 | MedusaJS backend |
| **B2C Storefront** | http://localhost:3001 | Print shop |
| **Vendor Panel** | http://localhost:3003 | Seller dashboard |
| **Admin Panel** | http://localhost:3002 | Platform admin |

## 📚 Documentation

- [SETUP.md](./SETUP.md) - Complete setup guide with troubleshooting
- [REFERENCE.md](./REFERENCE.md) - Quick reference (URLs, commands, API)
- [BUILD-COMPLETE.md](./BUILD-COMPLETE.md) - Setup options checklist

## 🔑 Environment Variables

Required in `apps/backend/.env`:

```bash
# Database
DATABASE_URL=postgres://user:password@host:port/print_tings

# CORS
STORE_CORS=http://localhost:3001
ADMIN_CORS=http://localhost:3002
VENDOR_CORS=http://localhost:3003
AUTH_CORS=http://localhost:3001

# Secrets
JWT_SECRET=your-super-secret-jwt-key
COOKIE_SECRET=your-super-secret-cookie-key

# Stripe
STRIPE_SECRET_API_KEY=sk_live_xxxx
STRIPE_PUBLISHABLE_KEY=pk_live_xxxx
STRIPE_WEBHOOK_SECRET=whsec_xxxx

# Email
RESEND_API_KEY=re_xxxx
RESEND_FROM_EMAIL=noreply@print-tings.com

# Optional
ALGOLIA_API_KEY=xxxx
ALGOLIA_APP_ID=xxxx
```

## 📊 Status

- ✅ **Cloned** from Mercur repository
- ✅ **Documentation added** - README, setup guide, reference
- ✅ **Environment template** - `.env.example`
- 📝 **Next** - Set up database and install dependencies

---

**Built with Mercur - Open source marketplace platform**
