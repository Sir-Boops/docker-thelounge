#!/bin/ash

# Set perms
chmod 777 -R /opt/.lounge/*

# Start
cd /opt/thelounge && yarn start
