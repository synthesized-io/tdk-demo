FROM synthesizedio/synthesized-tdk-cli:latest
COPY ./banner.txt /app/banner.txt
USER root
RUN apk --no-cache add wait4ports
USER user
