﻿<#

#>
$WebHookUri = 'https://s9events.azure-automation.net/webhooks?token=DGGfgc8BcXAOtkXrpwK%2f6Q%2brT2EwmronyK%2fRkMjBwzQ%3d'

$headers = @{'From'='Christoph@wilfing.biz';
             'Date'=$(Get-Date)}

$Parameter  = @{ NumberOfInstances = 2;
                 ServerName        = 'VMMeetUP1';
                 RGName            = 'CW-DSC-Test01';
                 Template          = 'https://raw.githubusercontent.com/chwilfing/meetupazurewien/master/Meetup%202016-11-17/DeploymentSample/WindowsServer.json';
                 TemplateInput     = 'https://raw.githubusercontent.com/chwilfing/meetupazurewien/master/Meetup%202016-11-17/DeploymentSample/WindowsServer.parameter.json';
                 AZConnectionName  = 'AzureRunAsConnection';
                 }

$body = ConvertTo-Json -InputObject $Parameter

$response = Invoke-RestMethod -Method Post -Uri $WebHookUri -Headers $headers -Body $body

#Get-AzureRmResourceGroupDeploymentOperation -DeploymentName $response.JobIds.ToString() -ResourceGroupName $Parameter.RGName