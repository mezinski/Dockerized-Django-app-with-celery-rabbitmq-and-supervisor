#!/bin/sh

# Start supervisor
supervisord --configuration /etc/supervisor/supervisord.conf &

# Let supervisor start up for 5 seconds
sleep 5

# Migrate the DB
python manage.py migrate 

# Start the gunicorn server
gunicorn mysite2.wsgi -b 0.0.0.0:8000


# # migrate db, so we have the latest db schema
# python manage.py migrate 
# # start development server on public ip interface, on port 8000
# python manage.py runserver 0.0.0.0:8000