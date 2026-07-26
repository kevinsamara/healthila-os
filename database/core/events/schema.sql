
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

