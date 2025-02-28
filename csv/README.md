# CSV Demo 

For details, see  https://docs.synthesized.io/tdk/latest/user_guide/integrations/csv



## Configuration

config.yaml:

```
default_config:
  mode: MASKING
safety_mode: STRICT
schema_creation_mode: DO_NOT_CREATE

tables:
   - table_name_with_schema: "public.users"
     mode: GENERATION
     target_ratio: 5
```



## Running a CSV transformation

````
export SYNTHESIZED_KEY="{your license key}"
docker compose run --rm tdk
````

