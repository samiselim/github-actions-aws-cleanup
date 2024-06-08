
#CleanUp State Machines 
Get-SFNStateMachineList | % { Remove-SFNStateMachine -StateMachineArn $PSItem.StateMachineArn -Force }

#CleanUp Activities 
Get-SFNActivityList | % { Remove-SFNActivity -ActivityArn $PSItem.ActivityArn -Force }
