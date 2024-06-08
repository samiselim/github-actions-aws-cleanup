
#CleanUp State Machines 
Get-SFNStateMachineList | % { Remove-SFNStateMachine -StateMachineArn $PSItem.StateMachineArn }

#CleanUp Activities 
Get-SFNActivityList | % { Remove-SFNActivity -ActivityArn $PSItem.ActivityArn }
