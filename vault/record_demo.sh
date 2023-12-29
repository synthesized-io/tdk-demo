export INVENTORY_FILE=inventory_dynamic_users.yaml
export SPIN_DATABASES_UP="docker compose run databases"
asciinema rec -c "./run_demo.sh" --idle-time-limit=1 --overwrite dynamic_users.cast
asciinema-agg --no-loop dynamic_users.cast dynamic_users.gif

export INVENTORY_FILE=inventory_static_users.yaml
export SPIN_DATABASES_UP="docker compose run databases"
asciinema rec -c "./run_demo.sh" --idle-time-limit=1 --overwrite static_users.cast
asciinema-agg --no-loop static_users.cast static_users.gif

export INVENTORY_FILE=inventory_simple_secret.yaml
export SPIN_DATABASES_UP="docker compose run databases"
asciinema rec -c "./run_demo.sh" --idle-time-limit=1 --overwrite simple_secret.cast
asciinema-agg --no-loop simple_secret.cast simple_secret.gif
