#!/bin/sh

python manage.py collectstatic --noinput
python manage.py migrate
python manage.py createsuperuser --noinput

gunicorn  --workers 3 --bind  0.0.0.0:8000 backend.wsgi