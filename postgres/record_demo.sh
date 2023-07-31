export CONFIG_FILE=config_generation_from_scratch.tdk.yaml
export SPIN_DATABASES_UP="docker-compose -f docker-compose.yaml run databases"
asciinema rec -c "./run_demo.sh" --overwrite generation_from_scratch.cast
asciinema-agg generation_from_scratch.cast generation_from_scratch.gif

export CONFIG_FILE=config_generation.tdk.yaml
export SPIN_DATABASES_UP="docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml run databases"
asciinema rec -c "./run_demo.sh" --overwrite generation.cast
asciinema-agg generation.cast generation.gif

export CONFIG_FILE=config_masking.tdk.yaml
export SPIN_DATABASES_UP="docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml run databases"
asciinema rec -c "./run_demo.sh" --overwrite masking.cast
asciinema-agg masking.cast masking.gif

export CONFIG_FILE=config_subsetting.tdk.yaml
export SPIN_DATABASES_UP="docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml run databases"
asciinema rec -c "./run_demo.sh" --overwrite subsetting.cast
asciinema-agg subsetting.cast subsetting.gif
