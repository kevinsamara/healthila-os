
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

