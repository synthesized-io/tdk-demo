# tdk-vault-demo

Run Vault server and databases:
```
docker-compose up -d
``` 

## 1. Run TDK with simple Vault secrets
```
tdk \
    --inventory-file inventory_simple_secret.yaml \
    --config-file config.tdk.yaml
```

## 2. Run TDK with static database roles
```
tdk \
    --inventory-file inventory_static_users.yaml \
    --config-file ./config.tdk.yaml
```

## 3. Run TDK with dynamic database roles
```
tdk \
    --inventory-file inventory_dynamic_users.yaml \
    --config-file ./config.tdk.yaml
```
