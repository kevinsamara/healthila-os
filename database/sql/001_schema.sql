create extension if not exists "pgcrypto";

create type order_status as enum (
    'draft',
    'confirmed',
    'picking',
    'weighing',
    'packing',
    'waiting_payment',
    'ready_delivery',
    'completed',
    'cancelled'
);

create type payment_status as enum (
    'unpaid',
    'pending',
    'paid',
    'refunded'
);

