#!/usr/bin/env bash

. ~/demo-magic.sh -n
DEMO_PROMPT="${GREEN}➜ ${CYAN}\W ${COLOR_RESET}"
PROMPT_TIMEOUT=0

${SPIN_DATABASES_UP} databases &> /dev/null

clear

pe "${MESSAGE_BEFORE}"
pe "usql ms://sa:Secret_password_1@localhost:6000/northwind -f control_query.sql"

pe "${MESSAGE_START_TRANSFORMATION}"
pe "export CONFIG_FILE=${CONFIG_FILE}"
pe "${SPIN_DATABASES_UP} tdk &> /dev/null"

pe "${MESSAGE_AFTER}"
pe "usql ms://sa:Secret_password_1@localhost:6001/northwind -f control_query.sql"

docker compose down &> /dev/null

exit
