export CONFIG_FILE=config_generation_from_scratch.tdk.yaml
export SPIN_DATABASES_UP="docker compose -f docker-compose.yaml -f docker-compose-input-db.yaml run"
export MESSAGE_BEFORE="# Initially, your database may only contain the schema, without any data, something like that ..."
export MESSAGE_START_TRANSFORMATION="# And this is the ideal time for the Synthesized TDK, and we are beginning the data generation process ..."
export MESSAGE_AFTER="# Finally, let's make sure we have robust, realistic, and production-like data in your database ..."
asciinema rec --rows=17 -c "./run_demo.sh" --idle-time-limit=1 --overwrite generation_from_scratch.cast
docker run --rm -it -u $(id -u):$(id -g) -v $PWD:/data agg generation_from_scratch.cast generation_from_scratch.gif --font-size 26 --no-loop


export CONFIG_FILE=config_generation.tdk.yaml
export SPIN_DATABASES_UP="docker compose run"
export MESSAGE_BEFORE="# Check the ORIGINAL database with control sql-query ..."
export MESSAGE_START_TRANSFORMATION="# Run Synthesized TDK against our database"
export MESSAGE_AFTER="# Check the RESULTED database with control sql-query ..."
asciinema rec --rows=22 -c "./run_demo.sh" --idle-time-limit=1 --overwrite generation.cast
docker run --rm -it -u $(id -u):$(id -g) -v $PWD:/data agg generation.cast generation.gif --font-size 26 --no-loop


export CONFIG_FILE=config_masking.tdk.yaml
export SPIN_DATABASES_UP="docker compose run"
export MESSAGE_BEFORE="# Typically, databases contain sensitive data like names, emails, financial information and so on ..."
export MESSAGE_START_TRANSFORMATION="# In this case, you can run Synthesized TDK in the masking mode ..."
export MESSAGE_AFTER="# Hence, you've obtained realistic data, preserving original properties, but without any private information ..."
asciinema rec --rows=22 -c "./run_demo.sh" --idle-time-limit=1 --overwrite masking.cast
docker run --rm -it -u $(id -u):$(id -g) -v $PWD:/data agg masking.cast masking.gif --font-size 26 --no-loop


export CONFIG_FILE=config_subsetting.tdk.yaml
export SPIN_DATABASES_UP="docker compose run"
export MESSAGE_BEFORE="# Check the ORIGINAL database with control sql-query ..."
export MESSAGE_START_TRANSFORMATION="# Run Synthesized TDK against our database"
export MESSAGE_AFTER="# Check the RESULTED database with control sql-query ..."
asciinema rec --rows=22 -c "./run_demo.sh" --idle-time-limit=1 --overwrite subsetting.cast
docker run --rm -it -u $(id -u):$(id -g) -v $PWD:/data agg subsetting.cast subsetting.gif --font-size 26 --no-loop
