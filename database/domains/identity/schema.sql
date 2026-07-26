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

