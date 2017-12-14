#!/bin/bash

printf 'Waiting for mongo-config-0 ...'
until mongo --eval 'quit(db.runCommand({ping: 1}).ok ? 0 : 1)' mongo-config-0:27019 &> /dev/null; do
  printf '.'
  sleep 1
done
echo "Started mongo-config-0"
mongo mongo-config-0:27019 /scripts/setup-config.js > /dev/null

printf 'Waiting for mongo-data-0 ...'
until mongo --eval 'quit(db.runCommand({ping: 1}).ok ? 0 : 1)' mongo-data-0:27018 &> /dev/null; do
  printf '.'
  sleep 1
done
echo "Started mongo-data-0"
mongo mongo-data-0:27018 /scripts/setup-rs0.js > /dev/null

printf 'Waiting for mongo-data-3 ...'
until mongo --eval 'quit(db.runCommand({ping: 1}).ok ? 0 : 1)' mongo-data-3:27018 &> /dev/null; do
  printf '.'
  sleep 1
done
echo "Started mongo-data-3"
mongo mongo-data-3:27018 /scripts/setup-rs1.js > /dev/null

printf 'Waiting for mongo-router ...'
until mongo --eval 'quit(db.runCommand({ping: 1}).ok ? 0 : 1)' mongo-router:27017 &> /dev/null; do
  printf '.'
  sleep 1
done
echo "Started mongo-router"
mongo mongo-router:27017/admin /scripts/setup-router.js > /dev/null
