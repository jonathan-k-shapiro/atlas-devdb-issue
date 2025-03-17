FROM postgres:15.1

WORKDIR /app

RUN apt-get update && apt-get install curl -y

RUN curl -sSf https://atlasgo.sh > install-atlas.sh
RUN bash install-atlas.sh --yes

COPY ./initdb.sh /docker-entrypoint-initdb.d

# COPY ./docker/db/pg_hba.conf /mnt/pg_hba/pg_hba.conf
# RUN chown postgres:postgres /mnt/pg_hba/pg_hba.conf

COPY ./scripts /mnt/scripts
# COPY ./docker/db/startup_complete.sh /mnt/scripts
RUN chown -R postgres:postgres /mnt/scripts


COPY ./migrations ./migrations
COPY ./schema.sql ./
COPY ./atlas.hcl ./

ENTRYPOINT []

CMD ["atlas", "migrate", "apply", "--env", "docker"]
