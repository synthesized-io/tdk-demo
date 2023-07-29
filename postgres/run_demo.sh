#!/usr/bin/env bash

. ~/demo-magic.sh -n
DEMO_PROMPT="${GREEN}➜ ${CYAN}\W ${COLOR_RESET}"
PROMPT_TIMEOUT=0

clear

pe "export CONFIG_FILE=${CONFIG_FILE}"
pe "docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml run tdk"
pe "usql pg://postgres:postgres@localhost:6000/postgres -f control_query.sql"
pe "usql pg://postgres:postgres@localhost:6001/postgres -f control_query.sql"
p ""

exit
