#!/bin/bash

#List all Regions starts with eu 
RegionList=$(aws ec2 describe-regions --query "Regions[?starts_with(RegionName, 'eu')].RegionName" --output text)
# List of instance IDs to terminate
instance_ids=$(aws ec2 describe-instances --query "Reservations[*].Instances[*].InstanceId" --output text)

# Loop over each instance ID and terminate it
for region in $RegionList; done
    for id in $instance_ids; do
        echo "Terminating instance with ID: $id in region: $region"
        aws ec2 terminate-instances --region $region --instance-ids $id
    done
done
