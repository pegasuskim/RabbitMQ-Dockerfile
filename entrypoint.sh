#!/bin/bash
set -e
#USER=${RABBITMQ_USERNAME:-rabbitmq}
#PASS=${RABBITMQ_PASSWORD:-$(pwgen -s -1 16)}
#VHOST=${RABBITMQ_VHOST:-/}

USER="admin"
PASS="asdf12"
VHOST="/"

# Create User
echo "Creating user: \"$USER\"..."
cat > /etc/rabbitmq/rabbitmq.config <<EOF
[
        {rabbit, [{default_user, <<"$USER">>},{default_pass, <<"$PASS">>},{default_vhost, <<"$VHOST">>},{tcp_listeners, [{"0.0.0.0", 5672}]}]}
].
EOF

echo "========================================================================"
echo "RabbitMQ User: \"$USER\""
echo "RabbitMQ Password: \"$PASS\""
echo "RabbitMQ Virtual Host: \"$VHOST\""
echo "========================================================================"

ulimit -n 1024
chown -R rabbitmq:rabbitmq /data
exec rabbitmq-server $@

#rabbitmqctl add_user admin admin
#rabbitmqctl set_user_tags admin administrator
#rabbitmqctl set_permissions admin ".*" ".*" ".*"