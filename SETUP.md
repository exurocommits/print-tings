# Hat Marketplace - Project Setup Summary

## ✅ What's Been Done

1. **Cloned Mercur Repository**
   - Location: `/home/node/.openclaw/workspace/hat-marketplace`
   - Repository: https://github.com/mercurjs/mercur

2. **Created Documentation**
   - **README.md** (7.2 KB) - Complete project guide
   - **.env.example** (2.2 KB) - Environment variables template

3. **Research Complete**
   - Analyzed 3 marketplace templates: Mercur, GoCart, Saleor
   - Selected Mercur as best base for hat marketplace

---

## ⚠️ What's Blocking Setup

### Permission Issues

**Problem:** The OpenClaw service user doesn't have write permissions to:
- `/home/node/.cache/` - Node cache directory
- Install npm/yarn dependencies

**Solution Options:**

#### Option 1: Run as Your User (Recommended)

```bash
# Clone to your home directory or workspace you control
git clone https://github.com/mercurjs/mercur.git hat-marketplace
cd hat-marketplace

# Install dependencies
yarn install

# Copy .env.example to .env and fill in values
cp .env.example apps/backend/.env
```

#### Option 2: Fix Permissions

```bash
# Give openclaw-svc user cache permissions
sudo chown -R openclaw-svc:openclaw-svc /home/node/.cache
sudo chmod -R 755 /home/node/.cache
```

#### Option 3: Use Global npm (Workaround)

```bash
# Use global npm cache instead of user cache
npm config set cache /tmp/npm-cache
npm config set prefix ~/.npm-global
```

---

## 🚀 What's Needed to Complete Setup

### 1. PostgreSQL Database

**Option A: Install locally**
```bash
# Ubuntu/Debian
sudo apt update
sudo apt install postgresql postgresql-contrib

# macOS
brew install postgresql@16

# Start PostgreSQL
sudo service postgresql start
# or
brew services start postgresql

# Create database
sudo -u postgres createdb hat_marketplace
```

**Option B: Docker Container**
```bash
docker run --name hat-postgres \
  -e POSTGRES_PASSWORD=hatmarketpass \
  -e POSTGRES_DB=hat_marketplace \
  -p 5432:5432 \
  -d postgres:16

# Verify connection
docker exec -it hat-postgres psql -U postgres -c "SELECT 1;"
```

**Option C: Managed Database (Neon, Supabase, Railway)**
- **Neon:** https://neon.tech/ - Free PostgreSQL serverless
- **Supabase:** https://supabase.com/ - Open-source Firebase alternative
- **Railway:** https://railway.app/ - Easy deployment

Get connection string and add to `.env`:
```bash
DATABASE_URL=postgres://user:password@host:port/database
```

### 2. Install Dependencies

```bash
cd /home/node/.openclaw/workspace/hat-marketplace

# Fix permissions first (if using Option 2 above)
sudo chown -R $USER:$USER /home/node/.cache

# Install all workspace dependencies
yarn install
```

### 3. Configure Environment

```bash
cd apps/backend

# Copy example .env
cp ../../.env.example .env

# Edit and add your values
nano .env
```

**Minimum required for development:**
```bash
DATABASE_URL=postgres://postgres:password@localhost:5432/hat_marketplace
STORE_CORS=http://localhost:3001
ADMIN_CORS=http://localhost:3002
VENDOR_CORS=http://localhost:3003
JWT_SECRET=change-this-secret
COOKIE_SECRET=change-this-secret
```

### 4. Run Database Migrations

```bash
cd apps/backend

# Create database tables
yarn db:migrate
```

### 5. Seed Database (Optional)

```bash
# Creates admin user and initial data
yarn seed
```

### 6. Start Development Server

```bash
cd apps/backend

# Start backend on port 9000
yarn dev
```

Backend will be available at: `http://localhost:9000`

### 7. Clone & Start Frontend

```bash
# B2C Storefront (Hat Shop)
git clone https://github.com/mercurjs/b2c-marketplace-storefront.git apps/b2c-storefront
cd apps/b2c-storefront
yarn install
yarn dev
# Runs on http://localhost:3001

# Vendor Panel
git clone https://github.com/mercurjs/vendor-panel.git apps/vendor-panel
cd apps/vendor-panel
yarn install
yarn dev
# Runs on http://localhost:3003

# Admin Panel (optional)
# Use Mercur admin panel or build custom
```

---

## 🎨 Hat-Specific Customization

Once running, customize for hats:

### 1. Add Hat Categories

In Admin Panel → Categories → Add:
- Baseball Caps
- Beanies
- Bucket Hats
- Cowboy Hats
- Fedora Hats
- Flat Caps
- Sun Hats
- Trucker Hats
- Winter Hats
- Vintage Hats

### 2. Add Product Attributes

In Admin Panel → Product Types → Add:
- Hat Size (S, M, L, XL)
- Material (Cotton, Wool, Felt, Straw)
- Color (with color swatches)
- Season (Spring, Summer, Fall, Winter)
- Style (Casual, Formal, Sport)

### 3. Update Branding

**Update colors** to match hat theme:
- Primary: #6366f1 (Copper/Orange)
- Secondary: #1f2937 (Red)
- Accent: #f59e0b (Brown)

**Update logo and hero image** with hat-themed graphics

---

## 📊 Default Commission Structure

```javascript
// In Admin Panel → Settings → Commissions

Standard Sellers: 15% commission
Premium Sellers: 12% commission
Enterprise Sellers: 10% commission
```

---

## 🔧 Troubleshooting

### yarn install Fails

**Error:** `EACCES: permission denied, mkdir '/home/node/.cache/...'`

**Fix:**
```bash
# Option 1: Fix permissions
sudo chown -R $USER:$USER /home/node/.cache

# Option 2: Use npm cache workaround
mkdir -p /tmp/npm-cache
npm config set cache /tmp/npm-cache

# Option 3: Clear cache and retry
rm -rf /home/node/.cache/yarn
rm -rf /home/node/.cache/node
yarn install
```

### Database Connection Fails

**Error:** `connection refused` or `password authentication failed`

**Fix:**
```bash
# Check PostgreSQL is running
sudo service postgresql status
# or
docker ps | grep postgres

# Check connection string in .env
cat apps/backend/.env | grep DATABASE_URL

# Test connection
psql $DATABASE_URL -c "SELECT 1;"
```

### Port Already in Use

**Error:** `EADDRINUSE: address already in use`

**Fix:**
```bash
# Find process using port
lsof -i :9000
# or
netstat -tuln | grep 9000

# Kill process
kill -9 <PID>

# Or use different port in .env
# Edit backend/medusa-config.ts if needed
```

---

## 🚀 Deployment to Coolify

Once development is complete:

### 1. Prepare for Production

```bash
# Create production .env with real secrets
cp .env.example .env.prod
nano .env.prod
# Add your DATABASE_URL, STRIPE keys, etc.

# Build for production
cd apps/backend
yarn build
```

### 2. Deploy Backend

```bash
# Create Coolify app
coolify-create https://github.com/exurocommits/hat-marketplace.git main hat-marketplace-backend private

# Set environment variables in Coolify UI
# Or use API
```

### 3. Deploy Frontend

```bash
# Create separate app for B2C storefront
coolify-create https://github.com/exurocommits/hat-marketplace-frontend.git main hat-marketplace-frontend public

# Create separate app for vendor panel
coolify-create https://github.com/exurocommits/hat-marketplace-vendor.git main hat-marketplace-vendor public
```

---

## 📚 Resources

- **Mercur Documentation:** https://docs.mercurjs.com/introduction
- **Medusa Documentation:** https://docs.medusajs.com/v2
- **Mercur Discord:** https://discord.gg/NTWNa49S
- **B2C Demo:** https://b2c.mercurjs.com/
- **Vendor Panel Demo:** Contact Mercur team at www.mercurjs.com/contact

---

## ✅ Next Steps

1. **Choose your preferred approach:**
   - Option 1: Clone to your home directory (recommended)
   - Option 2: Fix permissions on current location
   - Option 3: Use managed PostgreSQL (easiest)

2. **Set up PostgreSQL**
   - Install locally or use managed service (Neon/Supabase/Railway)
   - Create database: `hat_marketplace`

3. **Install dependencies**
   - Run `yarn install` in project root

4. **Configure environment**
   - Copy `.env.example` to `.env`
   - Fill in your values

5. **Start development**
   - Run `yarn dev`
   - Access backend at `http://localhost:9000`

6. **Clone and start frontend**
   - B2C storefront: `http://localhost:3001`
   - Vendor panel: `http://localhost:3003`

7. **Customize for hats**
   - Add hat categories
   - Add product attributes (size, material, color)
   - Update branding

---

**Status:** Repository cloned, docs created, ready for setup
**Issue:** Permission problems preventing dependency installation (need your intervention)
