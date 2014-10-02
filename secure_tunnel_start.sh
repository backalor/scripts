#!/bin/sh
sshuttle -D --pidfile=/tmp/sshuttle.pid -r backalor@someserver.org --dns 0/0
