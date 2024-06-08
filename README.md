
# AWS Clean Up Workflow

## Overview

The AWS Clean Up Workflow is designed to automate the cleanup of EC2 instances and Step Functions state machines and activities in AWS regions that start with "eu". This workflow supports both PowerShell and Bash scripting environments.

## Workflow Trigger

The workflow can be manually triggered through GitHub Actions using the `workflow_dispatch` event. It provides an option to choose between PowerShell and Bash as the scripting environment.

### Trigger Inputs

- `shell-type`: A choice input to select the scripting environment (`power-shell` or `bash`).

## Permissions

The workflow requires write permissions for the `id-token` to authenticate with AWS using OpenID Connect.

## Jobs

### Job: aws-cleanup-EC2s

#### Steps:

1. **Authentication to AWS using OpenID Connect**:
   - Uses `aws-actions/configure-aws-credentials@v4` to authenticate with AWS.
   - Requires the `AWS_ROLE` and `AWS_REGION` secrets.

2. **Installing Common AWS Tools for PowerShell**:
   - Installs the `AWS.Tools.Common` module if `shell-type` is `power-shell`.

3. **Clone Source Code from GitHub**:
   - Uses `actions/checkout@v4` to clone the repository.

4. **Installing EC2 Module for PowerShell**:
   - Installs the `AWS.Tools.EC2` module if `shell-type` is `power-shell`.

5. **Clean Up EC2 Instances using PowerShell**:
   - Executes the `aws-cleanup-EC2s.ps1` script if `shell-type` is `power-shell`.

6. **Clean Up EC2 Instances using Bash**:
   - Makes the `aws-cleanup-EC2s.sh` script executable and runs it if `shell-type` is `bash`.

### Job: aws-cleanup-stepFunctions

#### Steps:

1. **Authentication to AWS using OpenID Connect**:
   - Uses `aws-actions/configure-aws-credentials@v4` to authenticate with AWS.
   - Requires the `AWS_ROLE` and `AWS_REGION` secrets.

2. **Installing Common AWS Tools for PowerShell**:
   - Installs the `AWS.Tools.Common` module if `shell-type` is `power-shell`.

3. **Clone Source Code from GitHub**:
   - Uses `actions/checkout@v4` to clone the repository.

4. **Installing Step Functions Module for PowerShell**:
   - Installs the `AWS.Tools.StepFunctions` module if `shell-type` is `power-shell`.

5. **Clean Up State Machines using PowerShell**:
   - Executes the `aws-cleanup-stepfunctions.ps1` script if `shell-type` is `power-shell`.

6. **Clean Up State Machines using Bash**:
   - Makes the `aws-cleanup-stepfunctions.sh` script executable and runs it if `shell-type` is `bash`.
