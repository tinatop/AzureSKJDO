Connect-AzAccount

$resourceGroupName = "syskitjuniordevops"
$location = "westeurope"
$appServicePlanName = "ASP-SysKitJuniorDevOps-9941"
$newWebAppName = "WebAppPSNo4"

New-AzWebApp -ResourceGroupName $resourceGroupName -Name $newWebAppName -Location $location -AppServicePlan $appServicePlanName

$appInsights = New-AzApplicationInsights -ResourceGroupName $resourceGroupName -Name ($newWebAppName + "Insights") -Location $location -Kind web -ApplicationType web

$settings = @{"APPINSIGHTS_INSTRUMENTATIONKEY" = $appInsights.InstrumentationKey}
Set-AzWebApp -ResourceGroupName $resourceGroupName -Name $newWebAppName -AppSettings $settings