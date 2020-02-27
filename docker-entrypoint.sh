#!/bin/bash
set -e

if test ! "$APPLICATION_NAME"; then
    APPLICATION_NAME=$APP_NAME
fi

echo "Application is $APPLICATION_NAME"

if [ ! -d "$APPLICATION_NAME" ]; then

    echo "Will generate lumber backend service for $APPLICATION_NAME"

    lumber generate "$APPLICATION_NAME" \
        --connection-url "$DATABASE_URL" \
        --ssl "${DATABASE_SSL:-false}" \
        --schema "$DATABASE_SCHEMA" \
        --application-host "$APPLICATION_HOST" \
        --application-port "$APPLICATION_PORT" \
        --email "$FOREST_EMAIL" \
        --token "$FOREST_TOKEN"


    cd "$APPLICATION_NAME"
    echo "Service generated successfully"

    echo "Install dependencies"
    npm install -s
else
    cd "$APPLICATION_NAME"
    echo "Service $APPLICATION_NAME already was generated"
fi

exec "$@"