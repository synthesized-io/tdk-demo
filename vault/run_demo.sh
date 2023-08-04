#!/usr/bin/env bash

. ~/demo-magic.sh -n
DEMO_PROMPT="${GREEN}➜ ${CYAN}\W ${COLOR_RESET}"
PROMPT_TIMEOUT=0

clear

pe "# Start databases ..."
pe "${SPIN_DATABASES_UP} 2> /dev/null"

pe "# Run the TDK transformation ..."
pe "export INVENTORY_FILE=${INVENTORY_FILE}"
pe "docker-compose run tdk &> /dev/null"

pe "# Check the RESULTED database with control sql-query ..."
pe "usql -q postgres://postgres:postgres@localhost:6001/postgres -f control_query.sql"

docker-compose down &> /dev/null

exit
