FROM synthesizedio/synthesized-tdk-cli:v1.25.1
COPY ./banner.txt /app/banner.txt
USER root
RUN apk --no-cache add wait4ports
USER user
