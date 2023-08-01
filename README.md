# TDK Demo

A simple (but no less powerful) demo for data generation, masking and subsetting for different databases and options using [Synthesized TDK](https://docs.synthesized.io/tdk/latest/?utm_source=github&utm_medium=devrel&utm_campaign=datagen).


## Preamble

https://github.com/synthesized-io/pagila-data-generation
https://www.synthesized.io/post/test-data-generation-there-and-back


## Demos

- [TDK + PostgreSQL](postgres/README.md)
- [TDK + MySQL](mysql/README.md)
- [TDK + Oracle]()
- [TDK + PostgreSQL+Vault](postgres-vault/README.md)


## Tools

- [Synthesized TDK](https://docs.synthesized.io/tdk/latest/?utm_source=github&utm_medium=devrel&utm_campaign=datagen) provides database generation and masking capabilities.
- [usql](https://github.com/xo/usql) - Universal command-line interface for SQL databases.


## Troubleshooting and advises

In order to work comfortably, TDK requires at least 2-4 GB of memory.

So check the memory settings for your Docker:
- in case of Docker Desktop ([windows](https://docs.docker.com/desktop/settings/windows), [mac](https://docs.docker.com/desktop/settings/mac))
- in case of [classical](https://docs.docker.com/config/containers/resource_constraints) Docker
