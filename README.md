# TDK Demo

This repository contains a collection of demo projects for data generation, masking, and subsetting for various databases and integrations using [Synthesized TDK](https://docs.synthesized.io/tdk/latest/?utm_source=github&utm_medium=devrel&utm_campaign=datagen).

![generation from scratch demo](postgres/generation_from_scratch.gif)


## Demos
- [TDK + PostgreSQL](postgres/README.md) – generation for an empty database, generation based on existing data, masking, and subsetting for the Postgres sample database. 
- [TDK + MySQL](mysql/README.md) – masking and subsetting for the MySQL sample database.
- [TDK + Oracle](oracle/README.md) – an example of how to mask the Oracle sample database and import it into Postgres. 
- [TDK + DB2](db2/README.md) – an example of how to mask the emdedded DB2 sample database.
- [TDK + PostgreSQL + Vault](vault/README.md) – how to use TDK with Hashicorp Vault secret manager for Postgres database.


## Tools

- [Synthesized TDK](https://docs.synthesized.io/tdk/latest/?utm_source=github&utm_medium=devrel&utm_campaign=datagen) provides database generation and masking capabilities.
- [usql](https://github.com/xo/usql) - Universal command-line interface for SQL databases.


## Requirements

To run this demo, the following needs to be installed on your machine:
- [Git](https://github.com/git-guides/install-git)
- [usql](https://github.com/xo/usql)
- [Docker](https://docs.docker.com/get-docker)
- [Docker Compose](https://docs.docker.com/compose/install)

TDK requires at least 2GB RAM, check your Docker memory settings:
- Docker Desktop ([Windows](https://docs.docker.com/desktop/settings/windows), [Mac](https://docs.docker.com/desktop/settings/mac))
- Docker [CLI](https://docs.docker.com/config/containers/resource_constraints)


## Useful links

- [Documentation](https://docs.synthesized.io/tdk/latest)
- [Support](https://docs.synthesized.io/tdk/latest/support)
- [Contact us to buy an enterprise license](https://www.synthesized.io/contact-sales)


## Articles and other demos

- [Article: Test data generation: There and back](https://www.synthesized.io/post/test-data-generation-there-and-back)
- [Article: How Synthesized TDK can help populate your Testcontainers databases](https://www.synthesized.io/post/how-synthesized-can-help-populate-your-testcontainers-databases)
- [Demo: Synthesized TDK with microservices](https://github.com/synthesized-io/tdk-microservices-demo)
- [Demo: Flyway, Spawn, and Synthesized TDK to test database migrations](https://github.com/synthesized-io/flyway-spawn-demo)
- [Demo: SpringBoot, Testcontainers, and Synthesized TDK](https://github.com/synthesized-io/springjdbc-tc-tdk)
