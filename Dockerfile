# Dockerfile


FROM debian:jessie

ADD "https://www.rabbitmq.com/rabbitmq-signing-key-public.asc" /tmp/key.asc

RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-key add /tmp/key.asc \
 && rm /tmp/key.asc \
 && echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list \
 && apt-get -q update \
 && apt-get -qy --no-install-recommends install rabbitmq-server \
 && rm -rf /var/lib/apt/lists/*

COPY rabbitmq.config /etc/rabbitmq/rabbitmq.config

CMD ["rabbitmq-server"]

EXPOSE 5672


# EOF
