export CONFIG_FILE=config_generation_from_scratch.tdk.yaml
export SPIN_DATABASES_UP="docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml run"
export MESSAGE_BEFORE="# So, initially, our database only contains the schema, with zero data, let's check it ..."
export MESSAGE_START_TRANSFORMATION="# Run Synthesized TDK against the database ..."
export MESSAGE_AFTER="# For now, let's make sure we have robust, realistic, and production-like data ..."
asciinema rec --rows=17 -c "./run_demo.sh" --idle-time-limit=1 --overwrite generation_from_scratch.cast
asciinema-agg --rows=17 --no-loop generation_from_scratch.cast generation_from_scratch.gif

# export CONFIG_FILE=config_generation.tdk.yaml
# export SPIN_DATABASES_UP="docker-compose run tdk"
# export MESSAGE_BEFORE="# Check the ORIGINAL database with control sql-query ..."
# export MESSAGE_START_TRANSFORMATION="# Run Synthesized TDK against our database"
# export MESSAGE_AFTER="# Check the RESULTED database with control sql-query ..."
# asciinema rec --rows=22 -c "./run_demo.sh" --idle-time-limit=1 --overwrite generation.cast
# asciinema-agg --rows=22 --no-loop generation.cast generation.gif

# export CONFIG_FILE=config_masking.tdk.yaml
# export SPIN_DATABASES_UP="docker-compose run tdk"
# export MESSAGE_BEFORE="# Check the ORIGINAL database with control sql-query ..."
# export MESSAGE_START_TRANSFORMATION="# Run Synthesized TDK against our database"
# export MESSAGE_AFTER="# Check the RESULTED database with control sql-query ..."
# asciinema rec --rows=22 -c "./run_demo.sh" --idle-time-limit=1 --overwrite masking.cast
# asciinema-agg --rows=22 --no-loop masking.cast masking.gif

# export CONFIG_FILE=config_subsetting.tdk.yaml
# export SPIN_DATABASES_UP="docker-compose run tdk"
# export MESSAGE_BEFORE="# Check the ORIGINAL database with control sql-query ..."
# export MESSAGE_START_TRANSFORMATION="# Run Synthesized TDK against our database"
# export MESSAGE_AFTER="# Check the RESULTED database with control sql-query ..."
# asciinema rec --rows=22 -c "./run_demo.sh" --idle-time-limit=1 --overwrite subsetting.cast
# asciinema-agg --rows=22 --no-loop subsetting.cast subsetting.gif
