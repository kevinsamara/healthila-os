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

