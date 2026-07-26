# Migration Workflow

Source of Truth

database/
    domains/

↓

Build

↓

supabase/migrations/

↓

supabase db push

↓

Generate Types

↓

Application

Semua perubahan schema dilakukan pada domain.

Migration dibuat dari domain.

Jangan mengubah migration yang sudah pernah dijalankan di production.

