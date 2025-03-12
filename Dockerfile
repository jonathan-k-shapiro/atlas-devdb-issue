FROM postgres:15.1

WORKDIR /app

RUN apt-get update && apt-get install curl -y

RUN curl -sSf https://atlasgo.sh > install-atlas.sh
RUN bash install-atlas.sh --yes

COPY ./migrations ./migrations
COPY ./schema.sql ./
COPY ./atlas.hcl ./

ENTRYPOINT []

CMD ["atlas", "migrate", "apply", "--env", "docker"]
