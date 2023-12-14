#!/bin/bash

# Specify your AWS region
AWS_REGION=""

# Paths to your lists
NAME_LIST="name.txt"
PORT_LIST="port.txt"

# Create a target group for each name-port pair
while IFS= read -r name && IFS= read -r port <&3; do
    # Generate a unique target group name
        TARGET_GROUP_NAME="wext-$name-$port"

            # Create the target group
                aws elbv2 create-target-group \
                       --region $AWS_REGION \
                       --name "$TARGET_GROUP_NAME" \
                       --protocol HTTP \
                       --port "$port" \
                       --vpc-id ""

                         echo "$(date): Target group created - Name: $TARGET_GROUP_NAME, Port: $port" 
                         echo "esperando alguns segundos $(date)"
                         sleep 30 
                 done < "$NAME_LIST" 3< "$PORT_LIST"
                 echo 'done and dusted'
