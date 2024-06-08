$ErrorActionPerformance = 'continue' # to ignore any errors according to change the regions

$RegionList = Get-AWSRegion | ? Region -match '^eu'  ## match all Regions start with 'eu' ex: eu-west-3
foreach ($Region in $RegionList.Region){
    #CleanUp State Machines 
    Get-SFNStateMachineList -Region $Region | % { Remove-SFNStateMachine -StateMachineArn $PSItem.StateMachineArn -Region $Region -Force }

    #CleanUp Activities 
    Get-SFNActivityList -Region $Region | % { Remove-SFNActivity -ActivityArn $PSItem.ActivityArn -Region $Region -Force }

}
