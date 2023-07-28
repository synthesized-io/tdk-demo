#!/usr/bin/env bash

. ~/demo-magic.sh -n
DEMO_PROMPT="${GREEN}➜ ${CYAN}\W ${COLOR_RESET}"
PROMPT_TIMEOUT=0

clear

pe "export CONFIG_FILE=${CONFIG_FILE}"
pe "docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml run tdk"
pe "usql mysql://root:admin@localhost:6000/sakila -f control_query.sql"
pe "usql mysql://root:admin@localhost:6001/sakila -f control_query.sql"
p ""

exit
