##!/usr/bin/env bash

echo "Starting database…"
ID=$(docker run --rm -e POSTGRES_HOST_AUTH_METHOD=trust -d pg-350d)
sleep 10

echo "Running test…"
IP=$(docker inspect $ID | grep '"IPAddress"' | head -n 1 | awk '{ print $2 }' | sed 's/[",]//g')
psql -U postgres -h $IP -f ./test.sql | grep "ERROR"
ERR=$(test "$?" != "1")

if [[ -n "$ERR" ]]; then
  echo "$ERR"
else
  echo "Success."
fi

docker stop $ID &> /dev/null
exit $ERR
