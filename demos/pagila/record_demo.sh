export CONFIG_FILE=config_masking.tdk.yaml
asciinema rec -c "./run_demo.sh" --overwrite masking.cast
asciinema-agg masking.cast masking.gif

export CONFIG_FILE=config_subsetting.tdk.yaml
asciinema rec -c "./run_demo.sh" --overwrite subsetting.cast
asciinema-agg subsetting.cast subsetting.gif
