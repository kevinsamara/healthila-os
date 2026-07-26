
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

