
## How to start


### Masking of the existing data

```
export CONFIG_FILE=config_masking.tdk.yaml
docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml run tdk
```

```
docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml up input_db output_db -d
tdk \
    --inventory-file inventory.yaml \
    --config-file ./config_masking.tdk.yaml
docker-compose down
```


### Subsetting of the existing data

```
export CONFIG_FILE=config_subsetting.tdk.yaml
docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml run tdk
```

```
docker-compose -f docker-compose.yaml -f docker-compose-input-db.yaml up input_db output_db -d
tdk \
    --inventory-file inventory.yaml \
    --config-file ./config_subsetting.tdk.yaml
docker-compose down
```
