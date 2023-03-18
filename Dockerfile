FROM synthesizedio/synthesized-tdk-cli:latest
USER root
RUN apk --no-cache add wait4ports
USER user
