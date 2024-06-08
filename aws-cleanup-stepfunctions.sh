#!/bin/bash

# List state machines and extract ARNs
state_machine_arns=$(aws stepfunctions list-state-machines --query "stateMachines[*].stateMachineArn" --output text)

# Loop over each state machine ARN and delete it
for arn in $state_machine_arns; do
  echo "Deleting state machine with ARN: $arn"
  aws stepfunctions delete-state-machine --state-machine-arn $arn
done
