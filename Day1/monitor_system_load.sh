#2.

#!/bin/bash

# Continuously run the script
while true
do
  # Get the current system load using the uptime command
  load=$(uptime)

  # Append the current system load to the system-load log file
  echo "$load" >> /var/log/system-load

  # Wait for 1 minute before running the script again
  sleep 60
done
