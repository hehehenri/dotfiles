#!/bin/bash

# Set default mode to 0 (ON)
mode=0

# Check if an argument is provided
if [ "$#" -eq 1 ]; then
    case $1 in
        "on")
            mode=0
            ;;
        "off")
            mode=1
            ;;
        "auto")
            mode=2
            ;;
        *)
            echo "Invalid mode. Please use on, off, or auto."
            exit 1
            ;;
    esac
fi

# Define the path to the file
file_path="/sys/devices/platform/asus-nb-wmi/hwmon/hwmon6/pwm1_enable"

# Check if the file exists
if [ ! -e "$file_path" ]; then
    echo "Error: File $file_path not found."
    exit 1
fi

# Write the mode to the file
echo "$mode" > /sys/devices/platform/asus-nb-wmi/hwmon/hwmon6/pwm1_enable

echo "Mode set to $mode"
