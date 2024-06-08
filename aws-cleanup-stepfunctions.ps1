
#CleanUp State Machines 
Get-SFNStateMachineList | % { Remove-SFNStateMachine -StateMachineArn $PSItem.StateMachineArn -WhatIf }

#CleanUp Activities 
Get-SFNActivityList | % { Remove-SFNActivity -ActivityArn $PSItem.ActivityArn -WhatIf }
