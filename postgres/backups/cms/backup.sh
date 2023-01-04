#!/bin/bash

backup_cms() {
  local now
  now=$(date +%F)

  pg_dump postgresql://"$CMS_DB_USERNAME":"$CMS_DB_PASSWORD"@"$CMS_DB_HOST":"$CMS_DB_PORT"/"$CMS_DB_NAME" -n "$CMS_DB_SCHEMA" > "$now"_cms.sql
}

backup_cms
