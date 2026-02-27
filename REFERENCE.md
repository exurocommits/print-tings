# Hat Marketplace - Quick Reference

## 🌐 URLs

| Service | URL |
|---------|-----|
| **Local Backend** | http://localhost:9000 |
| **Local Storefront (B2C)** | http://localhost:3001 |
| **Local Vendor Panel** | http://localhost:3003 |
| **Local Admin Panel** | http://localhost:3002 |
| **Medusa Documentation** | https://docs.medusajs.com/v2 |
| **Mercur Documentation** | https://docs.mercurjs.com/introduction |
| **Mercur Discord** | https://discord.gg/NTWNa49S |
| **B2C Demo** | https://b2c.mercurjs.com/ |

## 📋 Key Files

| File | Purpose |
|------|---------|
| `README.md` | Project overview and features |
| `SETUP.md` | Complete setup instructions |
| `.env.example` | Environment variables template |
| `apps/backend/package.json` | Backend dependencies |
| `apps/backend/medusa-config.ts` | Backend configuration |
| `apps/backend/.env` | Your environment variables |

## 🛠 Commands

### Backend (apps/backend/)

```bash
# Install dependencies
yarn install

# Run migrations
yarn db:migrate

# Seed database
yarn seed

# Start development
yarn dev

# Start production
yarn start

# Run tests
yarn test:unit
yarn test:integration:http
yarn test:integration:modules

# Build
yarn build

# Lint
yarn lint
yarn lint:fix
yarn format
```

### Storefront (apps/b2c-storefront/)

```bash
yarn install
yarn dev
yarn build
```

### Vendor Panel (apps/vendor-panel/)

```bash
yarn install
yarn dev
yarn build
```

## 🔑 Default Credentials (Development)

| Service | Username | Password |
|---------|----------|----------|
| **Admin** | admin@medusa-test.com | supersecret |
| **Database** | postgres | (set in DATABASE_URL) |

⚠️ **Change these in production!**

## 📊 API Endpoints

### Backend (http://localhost:9000)

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/auth` | POST | User authentication |
| `/store/products` | GET | List products |
| `/store/products/:id` | GET | Get product details |
| `/store/carts` | POST | Create cart |
| `/store/orders` | POST | Create order |
| `/admin/products` | GET/POST | Admin product management |
| `/admin/vendors` | GET/POST | Admin vendor management |
| `/admin/vendors/:id` | GET/PUT/DELETE | Vendor CRUD |
| `/admin/orders` | GET | Admin order management |
| `/admin/reviews` | GET | Admin review moderation |
| `/webhooks/stripe` | POST | Stripe webhooks |

## 🎨 Hat Categories

```typescript
// Add these in Admin Panel → Categories

const HAT_CATEGORIES = [
  'baseball-caps',
  'beanies',
  'bucket-hats',
  'cowboy-hats',
  'fedora-hats',
  'flat-caps',
  'sun-hats',
  'trucker-hats',
  'winter-hats',
  'vintage-hats',
  'custom-hats'
];
```

## 📏 Hat Product Attributes

```typescript
// Add these in Admin Panel → Product Types

const HAT_ATTRIBUTES = [
  {
    name: 'size',
    type: 'enum',
    values: ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
    required: true
  },
  {
    name: 'material',
    type: 'enum',
    values: ['cotton', 'wool', 'felt', 'straw', 'leather', 'synthetic'],
    required: true
  },
  {
    name: 'color',
    type: 'multi-select',
    swatches: ['#000000', '#FFFFFF', '#6366f1', '#1f2937'],
    required: true
  },
  {
    name: 'season',
    type: 'enum',
    values: ['spring', 'summer', 'fall', 'winter', 'all-season'],
    required: false
  }
];
```

## 💰 Commission Tiers

| Tier | Commission | Requirements |
|------|------------|-------------|
| Standard | 15% | None |
| Premium | 12% | 100+ sales/month |
| Enterprise | 10% | 500+ sales/month |

## 🔧 Troubleshooting Commands

```bash
# Check PostgreSQL status
sudo service postgresql status

# Restart PostgreSQL
sudo service postgresql restart

# Check port usage
lsof -i :9000

# Kill process on port
kill -9 <PID>

# View backend logs
cd apps/backend && yarn dev 2>&1 | tee logs.txt

# Clear yarn cache
yarn cache clean

# Reinstall dependencies
rm -rf node_modules
yarn install
```

---

**For full setup instructions, see [SETUP.md](./SETUP.md)**
