export CONFIG_FILE=config_masking.tdk.yaml
export SPIN_DATABASES_UP="docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml run tdk"
asciinema rec -c "./run_demo.sh" --idle-time-limit=1 --overwrite masking.cast
asciinema-agg --no-loop masking.cast masking.gif

export CONFIG_FILE=config_subsetting.tdk.yaml
export SPIN_DATABASES_UP="docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml run tdk"
asciinema rec -c "./run_demo.sh" --idle-time-limit=1 --overwrite subsetting.cast
asciinema-agg --no-loop subsetting.cast subsetting.gif
