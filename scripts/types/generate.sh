#!/usr/bin/env bash
set -e

supabase gen types typescript \
  --linked \
  > lib/database.types.ts

echo "database.types.ts updated"
