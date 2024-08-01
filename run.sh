#!/usr/bin/env bash

notmuch new
#python3 -m netviel
gunicorn -b 0.0.0.0:5000 netviel.wsgi:app