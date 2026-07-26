
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

