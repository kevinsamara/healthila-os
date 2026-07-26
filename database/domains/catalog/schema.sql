-- =====================================================
-- Catalog Domain
-- =====================================================

---------------------------------------------------------
-- BRANDS
---------------------------------------------------------

create table if not exists brands (

    id uuid primary key default gen_random_uuid(),

    code text unique,

    name text not null,

    description text,

    created_at timestamptz default now(),

    updated_at timestamptz default now()

);

---------------------------------------------------------
-- CATEGORIES
---------------------------------------------------------

create table if not exists categories (

    id uuid primary key default gen_random_uuid(),

    parent_id uuid references categories(id),

    code text unique,

    name text not null,

    description text,

    sort_order integer default 0,

    is_active boolean default true,

    created_at timestamptz default now(),

    updated_at timestamptz default now()

);

---------------------------------------------------------
-- UNIT OF MEASURE
---------------------------------------------------------

create table if not exists units (

    id uuid primary key default gen_random_uuid(),

    code text unique,

    name text not null,

    symbol text not null

);

---------------------------------------------------------
-- PRODUCTS
---------------------------------------------------------

create table if not exists products (

    id uuid primary key default gen_random_uuid(),

    category_id uuid references categories(id),

    brand_id uuid references brands(id),

    sku text unique,

    barcode text,

    name text not null,

    slug text unique,

    description text,

    base_unit_id uuid references units(id),

    is_active boolean default true,

    created_at timestamptz default now(),

    updated_at timestamptz default now(),

    deleted_at timestamptz

);

---------------------------------------------------------
-- PRODUCT VARIANTS
---------------------------------------------------------

create table if not exists product_variants (

    id uuid primary key default gen_random_uuid(),

    product_id uuid not null references products(id) on delete cascade,

    sku text unique,

    name text,

    weight numeric(10,2),

    unit_id uuid references units(id),

    is_active boolean default true

);

---------------------------------------------------------
-- PRODUCT IMAGES
---------------------------------------------------------

create table if not exists product_images (

    id uuid primary key default gen_random_uuid(),

    product_id uuid not null references products(id) on delete cascade,

    image_url text not null,

    sort_order integer default 0,

    is_primary boolean default false

);

---------------------------------------------------------
-- PRODUCT TAGS
---------------------------------------------------------

create table if not exists product_tags (

    id uuid primary key default gen_random_uuid(),

    code text unique,

    name text not null

);

---------------------------------------------------------
-- PRODUCT TAG MAP
---------------------------------------------------------

create table if not exists product_tag_items (

    product_id uuid references products(id) on delete cascade,

    tag_id uuid references product_tags(id) on delete cascade,

    primary key(product_id, tag_id)

);

---------------------------------------------------------
-- PRODUCT PRICE HISTORY
---------------------------------------------------------

create table if not exists product_prices (

    id uuid primary key default gen_random_uuid(),

    product_id uuid not null references products(id),

    price numeric(18,2) not null,

    start_date date not null,

    end_date date,

    created_at timestamptz default now()

);

create index if not exists idx_products_category
on products(category_id);

create index if not exists idx_products_brand
on products(brand_id);

create index if not exists idx_product_prices_product
on product_prices(product_id);

