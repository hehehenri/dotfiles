#!/bin/bash

temp=$(cat /sys/devices/pci0000\:00/0000\:00\:18.3/hwmon/hwmon4/temp1_input)

echo "${temp::-3}°C"
