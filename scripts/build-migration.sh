#!/usr/bin/env bash

set -e

OUTPUT="supabase/migrations/$(date +%Y%m%d%H%M%S)_initial_schema.sql"

cat \
database/core/base.sql \
database/core/enums.sql \
database/core/functions.sql \
database/core/events/schema.sql \
database/core/audit/schema.sql \
database/core/outbox/schema.sql \
database/domains/identity/schema.sql \
database/domains/catalog/schema.sql \
database/domains/inventory/schema.sql \
database/domains/procurement/schema.sql \
> "$OUTPUT"

echo "Migration generated:"
echo "$OUTPUT"

