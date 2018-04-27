#!/bin/ash

# Copy the configs in
mkdir -p /opt/.lounge
cp -r /opt/configs/* /opt/.lounge/

# Start the lounge
cd /opt/thelounge && yarn start

# Save the configs
cp -r /opt/.lounge/* /opt/configs/
