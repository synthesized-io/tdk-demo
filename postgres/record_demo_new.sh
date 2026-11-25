#!/usr/bin/env bash

. /var/tmp/demo-magic.sh -n
DEMO_PROMPT="${GREEN}➜ ${CYAN}\W ${COLOR_RESET}"
PROMPT_TIMEOUT=0


export CONFIG_FILE=config_generation_from_scratch.tdk.yaml

cd /var/tmp/tdk-demo/postgres

# Spin up the databases
docker compose \
    -f /var/tmp/tdk-demo/postgres/docker-compose.yaml \
    -f /var/tmp/tdk-demo/postgres/docker-compose-input-db.yaml \
    run databases &> /dev/null

# clear




# Test the input database before the transformation
pe "usql -q pg://postgres:postgres@localhost:6000/postgres -f control_query.sql"

# Run the TDK transformation
pe "docker compose run --rm tdk &> /dev/null"

# Test the output database after the transformation
pe "usql -q pg://postgres:postgres@localhost:6001/postgres -f control_query.sql"



# Shut down the databases
docker \
    compose -f /var/tmp/tdk-demo/postgres/docker-compose.yaml \
    down &> /dev/null



# docker run --rm -it -u $(id -u):$(id -g) -v $PWD:/data agg generation_from_scratch.cast generation_from_scratch.gif --font-size 26 --no-loop
