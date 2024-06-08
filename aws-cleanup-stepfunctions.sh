#!/bin/bash

#List all Regions starts with eu 
RegionList=$(aws ec2 describe-regions --query "Regions[?starts_with(RegionName, 'eu')].RegionName" --output text)
# List state machines and extract ARNs
state_machine_arns=$(aws stepfunctions list-state-machines --query "stateMachines[*].stateMachineArn" --output text)

# Loop over each state machine ARN and delete it
for region in $RegionList; do
    for arn in $state_machine_arns; do
        echo "Deleting state machine with ARN: $arn in region: $region"
        aws stepfunctions delete-state-machine --region $region --state-machine-arn $arn
    done
done

# List activities and extract ARNs
activity_arns=$(aws stepfunctions list-activities --query "activities[*].activityArn" --output text)

# Loop over each activity ARN and delete it
for region in $RegionList; do
    for arn in $activity_arns; do
        echo "Deleting activity with ARN: $arn in region: $region"
        aws stepfunctions delete-activity --region $region --activity-arn $arn
    done
done
