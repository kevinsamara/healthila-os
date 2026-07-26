
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

