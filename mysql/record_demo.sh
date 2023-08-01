export CONFIG_FILE=config_masking.tdk.yaml
export SPIN_DATABASES_UP="docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml run databases"
asciinema rec -c "./run_demo.sh" --idle-time-limit=2 --overwrite masking.cast
asciinema-agg masking.cast masking.gif

export CONFIG_FILE=config_subsetting.tdk.yaml
export SPIN_DATABASES_UP="docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml run databases"
asciinema rec -c "./run_demo.sh" --idle-time-limit=2 --overwrite subsetting.cast
asciinema-agg subsetting.cast subsetting.gif
