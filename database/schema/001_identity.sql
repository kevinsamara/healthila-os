-- =====================================================
-- Identity Domain
-- =====================================================

create extension if not exists pgcrypto;

--------------------------------------------------------
-- Users
--------------------------------------------------------

create table users (
    id uuid primary key default gen_random_uuid(),

    email text not null unique,
    password_hash text,

    status text not null default 'active',

    last_login_at timestamptz,

    created_at timestamptz not null default now(),
    updated_at timestamptz not null default now(),
    deleted_at timestamptz
);

--------------------------------------------------------
-- Employees
--------------------------------------------------------

create table employees (

    id uuid primary key default gen_random_uuid(),

    employee_code text not null unique,

    full_name text not null,

    phone text,

    email text,

    hire_date date,

    status text not null default 'active',

    created_at timestamptz not null default now(),

    updated_at timestamptz not null default now(),

    deleted_at timestamptz
);

--------------------------------------------------------
-- Customers
--------------------------------------------------------

create table customers (

    id uuid primary key default gen_random_uuid(),

    customer_code text not null unique,

    full_name text not null,

    phone text,

    email text,

    notes text,

    created_at timestamptz not null default now(),

    updated_at timestamptz not null default now(),

    deleted_at timestamptz
);

--------------------------------------------------------
-- Customer Addresses
--------------------------------------------------------

create table customer_addresses (

    id uuid primary key default gen_random_uuid(),

    customer_id uuid not null references customers(id),

    label text,

    recipient_name text,

    phone text,

    address text not null,

    latitude numeric,

    longitude numeric,

    is_default boolean default false,

    created_at timestamptz default now(),

    updated_at timestamptz default now()
);

--------------------------------------------------------
-- Suppliers
--------------------------------------------------------

create table suppliers (

    id uuid primary key default gen_random_uuid(),

    supplier_code text not null unique,

    name text not null,

    phone text,

    email text,

    address text,

    notes text,

    created_at timestamptz default now(),

    updated_at timestamptz default now(),

    deleted_at timestamptz
);
