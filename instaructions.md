Url of AWS.Tools.stepFunctions -> powershell available APIs 
   * https://docs.aws.amazon.com/powershell/latest/reference/items/StepFunctions_cmdlets.html   

Get-SFNStateMachineList | % { Remove-SFNStateMachine -StateMachineArn $PSItem.StateMachineArn -WhatIf }

Get-SFNActivityList | % { Remove-SFNActivity -ActivityArn $PSItem.ActivityArn -WhatIf }
