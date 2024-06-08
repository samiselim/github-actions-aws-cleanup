#!/bin/bash

# List of instance IDs to terminate
instance_ids=$(aws ec2 describe-instances --query "Reservations[*].Instances[*].InstanceId" --output text)

# Loop over each instance ID and terminate it
for id in $instance_ids; do
  echo "Terminating instance with ID: $id"
  aws ec2 terminate-instances --instance-ids $id
done
