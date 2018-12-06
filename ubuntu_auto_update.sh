#!/bin/bash

# Automatic update scritp for ubuntu
# Version: 1.0
#
# Note:
# Script must be run as a root
# Script can automatically reboot computer
#
# Script doesn't edit or add files

# Make sure that script is run as a root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

# Run update commands and remove their output.
# If logging is needed /dev/null can be replaced with filepath
sudo apt-get update > /dev/null # Fetch updates
sudo apt-get upgrade -y > /dev/null  # Update system
sudo apt-get dist-upgrade -y > /dev/null
sudo apt-get autoremove -y > /dev/null # Remove unneeded packages

# If system needs reboot /var/run/reboot-required is created.
# File is automatically deleted by OS at startup.
if [ -f /var/run/reboot-required ]; then
  sudo reboot
fi

