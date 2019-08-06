#
#  rabbitmq Dockerfile
#
#
FROM ubuntu:16.04
#
# Add files.
#ADD bin/rabbitmq-start /usr/local/bin/
RUN mkdir -p /var/lib/rabbitmq
WORKDIR /var/lib/rabbitmq

# Install RabbitMQ.
RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y software-properties-common && \
  apt-get install -y wget && \
  apt-get install -y iputils-ping && \
  apt-get install -y libwww-perl && \
  apt-get install -y net-tools && \
  #apt-get install -y apt-transport-https && \
  #wget -qO - https://www.rabbitmq.com/rabbitmq-signing-key-public.asc | apt-key add - && \
  #echo "deb http://www.rabbitmq.com/debian/ xenial main" > /etc/apt/sources.list.d/rabbitmq.list && \

  #apt-key adv --keyserver "hkps.pool.sks-keyservers.net" --recv-keys "0x6B73A36E6026DFCA" && \
  #wget -q -O - "https://github.com/rabbitmq/signing-keys/releases/download/2.0/rabbitmq-release-signing-key.asc" | apt-key add - && \
  #echo "deb https://dl.bintray.com/rabbitmq/debian xenial main" > /etc/apt/sources.list.d/rabbitmq.list && \
  apt-get update && \
  apt-get install -y rabbitmq-server && \
  rabbitmq-plugins enable rabbitmq_management
  #echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config
  #chmod +x /usr/local/bin/rabbitmq-start

# Define environment variables.
ENV RABBITMQ_LOG_BASE /data/log
ENV RABBITMQ_MNESIA_BASE /data/mnesia

# Define mount points.
VOLUME ["/data/log", "/data/mnesia"]

# Define working directory.
WORKDIR /
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Define default command.
CMD ["bash", "/entrypoint.sh"]

# Expose ports.
EXPOSE 5672
EXPOSE 15672