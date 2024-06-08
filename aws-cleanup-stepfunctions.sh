#!/bin/bash

# List state machines and extract ARNs
state_machine_arns=$(aws stepfunctions list-state-machines --query "stateMachines[*].stateMachineArn" --output text)

# Loop over each state machine ARN and delete it
for arn in $state_machine_arns; do
  echo "Deleting state machine with ARN: $arn"
  aws stepfunctions delete-state-machine --state-machine-arn $arn
done

# List activities and extract ARNs
activity_arns=$(aws stepfunctions list-activities --query "activities[*].activityArn" --output text)

# Loop over each activity ARN and delete it
for arn in $activity_arns; do
  echo "Deleting activity with ARN: $arn"
  aws stepfunctions delete-activity --activity-arn $arn
done
