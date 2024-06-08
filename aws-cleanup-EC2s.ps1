#CleanUp Ec2 Instances 
$ErrorActionPerformance = 'continue' # to ignore any errors according to change the regions

$RegionList = Get-AWSRegion | ? Region -match '^eu'  ## match all Regions start with 'eu' ex: eu-west-3
foreach ($Region in $RegionList.Region){
    (Get-EC2Instance).Instances -Region $Region | % { Remove-EC2Instance -InstanceId $PSItem.InstanceId -Region $Region -Force }
}