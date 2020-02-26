#!/bin/bash
set -e

lumber generate "${APPLICATION_NAME:-$APP_NAME}" \
    -c "$DATABASE_URL" \
    -S "${DATABASE_SSL:-false}" \
    -s "$DATABASE_SCHEMA" \
    -H "$APPLICATION_HOST" \
    -p "$APPLICATION_PORT" \
    --email "$FOREST_EMAIL" \
    --token "$FOREST_TOKEN"

cd "${APPLICATION_NAME:-$APP_NAME}"

npm install -s

exec "$@"