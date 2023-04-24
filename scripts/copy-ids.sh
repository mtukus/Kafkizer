#!/bin/bash
#This is a script that copies id to multiple ip addresses

# List of remote hosts
hosts=("74.234.141.68" "20.86.65.24" "20.86.65.62" "20.86.65.203" "108.143.250.21" "74.234.128.80" "108.143.251.159" "108.143.254.118")

# User to copy the public key to
user="confluent"

# Loop through each host in the list and execute the ssh-copy-id command
for host in "$hosts[@]"
do
    # Try to copy the key to the remote host
    if ssh-copy-id "$user@$host" &> /dev/null; then
        # If successful, log the result to a file
        echo "$(date): Key copied to $host" >> ssh_copy_id.log
    else
        # If unsuccessful, log the error to a file
        echo "$(date): Error copying key to $host" >> ssh_copy_id.log
    fi
done

