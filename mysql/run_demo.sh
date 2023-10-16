#!/usr/bin/env bash

. ~/demo-magic.sh -n
DEMO_PROMPT="${GREEN}➜ ${CYAN}\W ${COLOR_RESET}"
PROMPT_TIMEOUT=0

clear

pe "# Run the TDK transformation ..."
pe "export CONFIG_FILE=${CONFIG_FILE}"
pe "${SPIN_DATABASES_UP} &> /dev/null"

pe "# Check the ORIGINAL database with control sql-query ..."
pe "usql -q mysql://root:admin@localhost:6000/sakila -f control_query.sql"

pe "# Check the RESULTED database with control sql-query ..."
pe "usql -q mysql://root:admin@localhost:6001/sakila -f control_query.sql"

docker-compose down &> /dev/null

exit
