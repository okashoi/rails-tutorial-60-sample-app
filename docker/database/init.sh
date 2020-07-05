#!/bin/bash
set -eu

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE postgres_test;
    GRANT ALL PRIVILEGES ON DATABASE postgres_test TO $POSTGRES_USER;
EOSQL
