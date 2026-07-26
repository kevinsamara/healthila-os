
---------------------------------------------------------
-- EXTENSIONS
---------------------------------------------------------

create extension if not exists pgcrypto;

create extension if not exists citext;

create extension if not exists btree_gist;

---------------------------------------------------------
-- COMMON COLUMNS CONVENTION
---------------------------------------------------------

-- Semua tabel wajib memiliki:

-- id uuid primary key default gen_random_uuid()

-- created_at timestamptz default now()

-- updated_at timestamptz default now()

-- deleted_at timestamptz

-- created_by uuid

-- updated_by uuid

-- deleted_by uuid


create type yes_no as enum (

'yes',

'no'

);

create type record_status as enum (

'active',

'inactive'

);

create type movement_direction as enum (

'in',

'out'

);


create or replace function update_updated_at()

returns trigger

language plpgsql

as $$

begin

new.updated_at = now();

return new;

end;

$$;


---------------------------------------------------------
-- DOMAIN EVENTS
---------------------------------------------------------

create table if not exists domain_events (

    id uuid primary key default gen_random_uuid(),

    event_name text not null,

    aggregate_type text not null,

    aggregate_id uuid not null,

    payload jsonb not null,

    occurred_at timestamptz default now(),

    created_by uuid

);

create index idx_domain_events_name
on domain_events(event_name);

create index idx_domain_events_aggregate
on domain_events(aggregate_type, aggregate_id);

create index idx_domain_events_occurred
on domain_events(occurred_at);


---------------------------------------------------------
-- AUDIT LOG
---------------------------------------------------------

create table if not exists audit_logs (

    id uuid primary key default gen_random_uuid(),

    table_name text not null,

    record_id uuid not null,

    action text not null,

    old_data jsonb,

    new_data jsonb,

    changed_by uuid,

    changed_at timestamptz default now()

);

create index idx_audit_table
on audit_logs(table_name);

create index idx_audit_record
on audit_logs(record_id);


---------------------------------------------------------
-- OUTBOX
---------------------------------------------------------

create table if not exists outbox_messages (

    id uuid primary key default gen_random_uuid(),

    event_name text not null,

    payload jsonb not null,

    status text default 'pending',

    retry_count integer default 0,

    processed_at timestamptz,

    created_at timestamptz default now()

);

create index idx_outbox_status
on outbox_messages(status);

-- =====================================================
-- Identity Domain
-- =====================================================

create extension if not exists pgcrypto;

---------------------------------------------------------
-- USERS
---------------------------------------------------------

create table if not exists users (

    id uuid primary key default gen_random_uuid(),

    email text not null unique,

    password_hash text,

    status text not null default 'active',

    last_login_at timestamptz,

    created_at timestamptz not null default now(),

    updated_at timestamptz not null default now(),

    deleted_at timestamptz

);

---------------------------------------------------------
-- ROLES
---------------------------------------------------------

create table if not exists roles (

    id uuid primary key default gen_random_uuid(),

    code text not null unique,

    name text not null,

    description text,

    created_at timestamptz default now()

);

---------------------------------------------------------
-- PERMISSIONS
---------------------------------------------------------

create table if not exists permissions (

    id uuid primary key default gen_random_uuid(),

    code text not null unique,

    name text not null,

    description text

);

---------------------------------------------------------
-- USER ROLES
---------------------------------------------------------

create table if not exists user_roles (

    user_id uuid not null references users(id) on delete cascade,

    role_id uuid not null references roles(id) on delete cascade,

    primary key(user_id, role_id)

);

---------------------------------------------------------
-- ROLE PERMISSIONS
---------------------------------------------------------

create table if not exists role_permissions (

    role_id uuid not null references roles(id) on delete cascade,

    permission_id uuid not null references permissions(id) on delete cascade,

    primary key(role_id, permission_id)

);

---------------------------------------------------------
-- EMPLOYEES
---------------------------------------------------------

create table if not exists employees (

    id uuid primary key default gen_random_uuid(),

    user_id uuid unique references users(id),

    employee_code text not null unique,

    full_name text not null,

    phone text,

    email text,

    hire_date date,

    termination_date date,

    status text not null default 'active',

    created_at timestamptz default now(),

    updated_at timestamptz default now(),

    deleted_at timestamptz

);

---------------------------------------------------------
-- CUSTOMER GROUPS
---------------------------------------------------------

create table if not exists customer_groups (

    id uuid primary key default gen_random_uuid(),

    code text unique,

    name text not null

);

---------------------------------------------------------
-- CUSTOMERS
---------------------------------------------------------

create table if not exists customers (

    id uuid primary key default gen_random_uuid(),

    customer_group_id uuid references customer_groups(id),

    customer_code text unique,

    full_name text not null,

    phone text,

    email text,

    notes text,

    created_at timestamptz default now(),

    updated_at timestamptz default now(),

    deleted_at timestamptz

);

---------------------------------------------------------
-- CUSTOMER ADDRESSES
---------------------------------------------------------

create table if not exists customer_addresses (

    id uuid primary key default gen_random_uuid(),

    customer_id uuid not null references customers(id) on delete cascade,

    label text,

    recipient_name text,

    phone text,

    address text not null,

    latitude numeric(10,7),

    longitude numeric(10,7),

    is_default boolean default false,

    created_at timestamptz default now(),

    updated_at timestamptz default now()

);

---------------------------------------------------------
-- SUPPLIER TYPES
---------------------------------------------------------

create table if not exists supplier_types (

    id uuid primary key default gen_random_uuid(),

    code text unique,

    name text not null

);

---------------------------------------------------------
-- SUPPLIERS
---------------------------------------------------------

create table if not exists suppliers (

    id uuid primary key default gen_random_uuid(),

    supplier_type_id uuid references supplier_types(id),

    supplier_code text unique,

    name text not null,

    phone text,

    email text,

    address text,

    notes text,

    created_at timestamptz default now(),

    updated_at timestamptz default now(),

    deleted_at timestamptz

);

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


---------------------------------------------------------
-- PRODUCT STATUS
---------------------------------------------------------

create table if not exists product_statuses (

    id uuid primary key default gen_random_uuid(),

    code text not null unique,

    name text not null

);

---------------------------------------------------------
-- STORAGE TYPES
---------------------------------------------------------

create table if not exists storage_types (

    id uuid primary key default gen_random_uuid(),

    code text not null unique,

    name text not null

);

---------------------------------------------------------
-- INVENTORY STRATEGIES
---------------------------------------------------------

create table if not exists inventory_strategies (

    id uuid primary key default gen_random_uuid(),

    code text not null unique,

    name text not null

);

---------------------------------------------------------
-- UPDATE PRODUCTS
---------------------------------------------------------

alter table products

add column if not exists status_id uuid
references product_statuses(id),

add column if not exists storage_type_id uuid
references storage_types(id),

add column if not exists inventory_strategy_id uuid
references inventory_strategies(id),

add column if not exists shelf_life_days integer,

add column if not exists minimum_stock numeric(18,2),

add column if not exists reorder_point numeric(18,2);

---------------------------------------------------------
-- PACKAGING
---------------------------------------------------------

create table if not exists packaging_types (

    id uuid primary key default gen_random_uuid(),

    code text unique,

    name text not null

);

create table if not exists product_packagings (

    id uuid primary key default gen_random_uuid(),

    product_id uuid not null
        references products(id) on delete cascade,

    packaging_type_id uuid
        references packaging_types(id),

    quantity numeric(18,2) not null,

    unit_id uuid references units(id),

    barcode text,

    sku text,

    is_default boolean default false

);


---------------------------------------------------------
-- PRODUCT ATTRIBUTES
---------------------------------------------------------

create table if not exists product_attributes (

    id uuid primary key default gen_random_uuid(),

    code text not null unique,

    name text not null,

    data_type text not null,

    unit text,

    is_required boolean default false,

    created_at timestamptz default now(),

    updated_at timestamptz default now()

);

---------------------------------------------------------
-- PRODUCT ATTRIBUTE OPTIONS
---------------------------------------------------------

create table if not exists product_attribute_options (

    id uuid primary key default gen_random_uuid(),

    attribute_id uuid not null
        references product_attributes(id) on delete cascade,

    value text not null,

    sort_order integer default 0,

    unique(attribute_id, value)

);

---------------------------------------------------------
-- PRODUCT ATTRIBUTE VALUES
---------------------------------------------------------

create table if not exists product_attribute_values (

    id uuid primary key default gen_random_uuid(),

    product_id uuid not null
        references products(id) on delete cascade,

    attribute_id uuid not null
        references product_attributes(id),

    option_id uuid
        references product_attribute_options(id),

    value_text text,

    value_number numeric(18,4),

    value_boolean boolean,

    value_date date,

    created_at timestamptz default now(),

    updated_at timestamptz default now()

);

create index if not exists idx_product_attribute_values_product
on product_attribute_values(product_id);

create index if not exists idx_product_attribute_values_attribute
on product_attribute_values(attribute_id);

---------------------------------------------------------
-- WAREHOUSES
---------------------------------------------------------

create table if not exists warehouses (

    id uuid primary key default gen_random_uuid(),

    code text unique,

    name text not null,

    address text,

    created_at timestamptz default now()

);

---------------------------------------------------------
-- STORAGE LOCATIONS
---------------------------------------------------------

create table if not exists storage_locations (

    id uuid primary key default gen_random_uuid(),

    warehouse_id uuid
        references warehouses(id),

    parent_id uuid
        references storage_locations(id),

    code text,

    name text,

    type text,

    created_at timestamptz default now()

);

---------------------------------------------------------
-- INVENTORY LOTS
---------------------------------------------------------

create table if not exists inventory_lots (

    id uuid primary key default gen_random_uuid(),

    product_id uuid
        not null
        references products(id),

    supplier_id uuid
        references suppliers(id),

    warehouse_id uuid
        references warehouses(id),

    storage_location_id uuid
        references storage_locations(id),

    lot_number text not null unique,

    received_date date,

    expiry_date date,

    grade text,

    unit_cost numeric(18,2),

    created_at timestamptz default now()

);


---------------------------------------------------------
-- INVENTORY BALANCES
---------------------------------------------------------

create table if not exists inventory_balances (

    lot_id uuid primary key
        references inventory_lots(id)
        on delete cascade,

    quantity_on_hand numeric(18,2) default 0,

    quantity_reserved numeric(18,2) default 0,

    quantity_available numeric(18,2)
);

---------------------------------------------------------
-- RESERVATIONS
---------------------------------------------------------

create table if not exists inventory_reservations (

    id uuid primary key default gen_random_uuid(),

    lot_id uuid
        not null
        references inventory_lots(id),

    order_id uuid,

    quantity numeric(18,2) not null,

    reserved_at timestamptz default now(),

    released_at timestamptz

);

---------------------------------------------------------
-- STOCK MOVEMENTS
---------------------------------------------------------

create table if not exists stock_movements (

    id uuid primary key default gen_random_uuid(),

    lot_id uuid
        not null
        references inventory_lots(id),

    movement_type text not null,

    quantity numeric(18,2) not null,

    reference_type text,

    reference_id uuid,

    notes text,

    created_at timestamptz default now()

);


---------------------------------------------------------
-- WASTE
---------------------------------------------------------

create table if not exists inventory_waste (

    id uuid primary key default gen_random_uuid(),

    lot_id uuid
        references inventory_lots(id),

    quantity numeric(18,2),

    reason text,

    created_at timestamptz default now()

);

---------------------------------------------------------
-- STOCK ADJUSTMENT
---------------------------------------------------------

create table if not exists inventory_adjustments (

    id uuid primary key default gen_random_uuid(),

    lot_id uuid
        references inventory_lots(id),

    old_quantity numeric(18,2),

    new_quantity numeric(18,2),

    reason text,

    approved_by uuid
        references users(id),

    created_at timestamptz default now()

);


---------------------------------------------------------
-- UNIT CONVERSIONS
---------------------------------------------------------

create table if not exists unit_conversions (

    id uuid primary key default gen_random_uuid(),

    product_id uuid
        references products(id)
        on delete cascade,

    from_unit_id uuid
        not null
        references units(id),

    to_unit_id uuid
        not null
        references units(id),

    multiplier numeric(18,6) not null,

    created_at timestamptz default now(),

    unique(product_id, from_unit_id, to_unit_id)

);

---------------------------------------------------------
-- ALLOCATION STRATEGIES
---------------------------------------------------------

create table if not exists allocation_strategies (

    id uuid primary key default gen_random_uuid(),

    code text not null unique,

    name text not null

);

---------------------------------------------------------
-- PRODUCT ALLOCATION STRATEGY
---------------------------------------------------------

alter table products

add column if not exists allocation_strategy_id uuid
references allocation_strategies(id);

---------------------------------------------------------
-- INVENTORY SNAPSHOTS
---------------------------------------------------------

create table if not exists inventory_snapshots (

    id uuid primary key default gen_random_uuid(),

    warehouse_id uuid
        references warehouses(id),

    product_id uuid
        references products(id),

    snapshot_date date not null,

    quantity numeric(18,2) not null,

    created_at timestamptz default now(),

    unique (
        warehouse_id,
        product_id,
        snapshot_date
    )

);

create index if not exists idx_inventory_snapshot_date
on inventory_snapshots(snapshot_date);

create index if not exists idx_inventory_snapshot_product
on inventory_snapshots(product_id);


---------------------------------------------------------
-- PURCHASE REQUISITIONS
---------------------------------------------------------

create table if not exists purchase_requisitions (

    id uuid primary key default gen_random_uuid(),

    requisition_number text unique not null,

    requested_by uuid
        references users(id),

    warehouse_id uuid
        references warehouses(id),

    status text not null default 'draft',

    notes text,

    requested_at timestamptz default now(),

    approved_at timestamptz,

    created_at timestamptz default now()

);

---------------------------------------------------------
-- PURCHASE REQUISITION ITEMS
---------------------------------------------------------

create table if not exists purchase_requisition_items (

    id uuid primary key default gen_random_uuid(),

    requisition_id uuid
        not null
        references purchase_requisitions(id)
        on delete cascade,

    product_id uuid
        not null
        references products(id),

    quantity numeric(18,2) not null,

    unit_id uuid
        references units(id),

    notes text

);


---------------------------------------------------------
-- PURCHASE ORDERS
---------------------------------------------------------

create table if not exists purchase_orders (

    id uuid primary key default gen_random_uuid(),

    po_number text unique not null,

    supplier_id uuid
        not null
        references suppliers(id),

    warehouse_id uuid
        references warehouses(id),

    requisition_id uuid
        references purchase_requisitions(id),

    status text not null default 'draft',

    order_date date,

    expected_date date,

    notes text,

    created_at timestamptz default now()

);

---------------------------------------------------------
-- PURCHASE ORDER ITEMS
---------------------------------------------------------

create table if not exists purchase_order_items (

    id uuid primary key default gen_random_uuid(),

    purchase_order_id uuid
        not null
        references purchase_orders(id)
        on delete cascade,

    product_id uuid
        not null
        references products(id),

    quantity numeric(18,2) not null,

    unit_price numeric(18,2),

    unit_id uuid
        references units(id),

    discount numeric(18,2) default 0,

    tax numeric(18,2) default 0

);


---------------------------------------------------------
-- GOODS RECEIVING
---------------------------------------------------------

create table if not exists goods_receipts (

    id uuid primary key default gen_random_uuid(),

    receipt_number text unique not null,

    purchase_order_id uuid
        references purchase_orders(id),

    warehouse_id uuid
        references warehouses(id),

    received_by uuid
        references users(id),

    received_date date,

    notes text,

    created_at timestamptz default now()

);

---------------------------------------------------------
-- GOODS RECEIVING ITEMS
---------------------------------------------------------

create table if not exists goods_receipt_items (

    id uuid primary key default gen_random_uuid(),

    goods_receipt_id uuid
        not null
        references goods_receipts(id)
        on delete cascade,

    purchase_order_item_id uuid
        references purchase_order_items(id),

    product_id uuid
        references products(id),

    quantity_received numeric(18,2),

    accepted_quantity numeric(18,2),

    rejected_quantity numeric(18,2),

    unit_cost numeric(18,2),

    expiry_date date,

    notes text

);


---------------------------------------------------------
-- PURCHASE RETURNS
---------------------------------------------------------

create table if not exists purchase_returns (

    id uuid primary key default gen_random_uuid(),

    return_number text unique not null,

    supplier_id uuid
        references suppliers(id),

    goods_receipt_id uuid
        references goods_receipts(id),

    status text default 'draft',

    return_date date,

    notes text,

    created_at timestamptz default now()

);

---------------------------------------------------------
-- PURCHASE RETURN ITEMS
---------------------------------------------------------

create table if not exists purchase_return_items (

    id uuid primary key default gen_random_uuid(),

    purchase_return_id uuid
        references purchase_returns(id)
        on delete cascade,

    goods_receipt_item_id uuid
        references goods_receipt_items(id),

    quantity numeric(18,2),

    reason text

);

