#!/bin/bash

NAME="todolist"
DJANGO_DIR=/gcloud/google-cloud/pure_orm_django/backend/todolist/
DJANGO_WSGI_MODULE=wsgi.py
SOCK_FILE=/home/web/uwsgi.sock
LOG_FILE=/home/web/logs/uwsgi.log
ENV_DIR=/denv

echo "Starting $NAME as root"

echo "Create folder and grant permission"
mkdir -p /home/web/logs/
sudo chmod -R 777 /home/web/logs/
sudo chmod -R 777 /home/web/

set -e

source $ENV_DIR/bin/activate


# Start your Django uwsgi
# Programs meant to be run under supervisor should not daemonize themselves (do not use --daemon)
exec $ENV_DIR/bin/uwsgi --home $DJANGO_DIR --socket $SOCK_FILE  --chmod-socket --master --wsgi-file $DJANGO_DIR$DJANGO_WSGI_MODULE --pythonpath $ENV_DIR/lib/python2.7/ -H $ENV_DIR --logto $LOG_FILE  --http :8002
