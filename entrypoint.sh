#!/bin/sh

chown root:root /home
chmod 755 /home

exec /usr/sbin/sshd -D -e

