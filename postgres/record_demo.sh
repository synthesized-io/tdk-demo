export CONFIG_FILE=config_generation_from_scratch.tdk.yaml
asciinema rec -c "./run_demo.sh" --overwrite generation_from_scratch.cast
asciinema-agg generation_from_scratch.cast generation_from_scratch.gif

# export CONFIG_FILE=config_masking.tdk.yaml
# asciinema rec -c "./run_demo.sh" --overwrite masking.cast
# asciinema-agg masking.cast masking.gif

# export CONFIG_FILE=config_subsetting.tdk.yaml
# asciinema rec -c "./run_demo.sh" --overwrite subsetting.cast
# asciinema-agg subsetting.cast subsetting.gif
