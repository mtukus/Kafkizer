#!/bin/bash

amountofrules=3
echo "The amount of rules: $amountofrules"

# The ports on our host machine that we want to op$ports_to_open=(30001 30002 30003)
echo "These are the ports that need to be opened: $

# A check if the rule for corresponding port in th$

existing_ports=$(sudo firewall-cmd --list-ports)

# Filter the ports that need to be opened and are $ports_to_add=()
for port in "${ports_to_open[@]}"; do
  if ! grep -q "$port" <<< "$existing_ports"; then
    ports_to_add+=("$port")
  fi
done

# Add the filtered ports to the firewall
for port in "${ports_to_add[@]}"; do
  sudo firewall-cmd --add-port "$port"/tcp
done
