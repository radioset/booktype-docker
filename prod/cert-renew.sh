#!/bin/bash

/usr/local/bin/docker-compose run certbot renew

if [ -f ./certbot/etc/CERT_RENEWED ]; then
	/usr/local/bin/docker-compose kill -s SIGHUP proxy
	rm -f ./certbot/etc/CERT_RENEWED
fi
