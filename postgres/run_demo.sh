#!/usr/bin/env bash

. ~/demo-magic.sh -n
DEMO_PROMPT="${GREEN}➜ ${CYAN}\W ${COLOR_RESET}"
PROMPT_TIMEOUT=0

clear

pe "# Start databases ..."
pe "${SPIN_DATABASES_UP}"

pe "# Check the ORIGINAL database with control sql-query ..."
pe "usql -q pg://postgres:postgres@localhost:6000/postgres -f control_query.sql"

pe "# Run the TDK transformation ..."
pe "export CONFIG_FILE=${CONFIG_FILE}"
pe "docker-compose -f docker-compose.yaml run tdk"

pe "# Check the RESULTED database with control sql-query ..."
pe "usql -q pg://postgres:postgres@localhost:6001/postgres -f control_query.sql"

docker-compose down &> /dev/null

exit
