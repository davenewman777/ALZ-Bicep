targetScope = 'managementGroup'

metadata name = 'ALZ Bicep - Custom Policy Definitions at Management Group Scope'
metadata description = 'This policy definition is used to deploy custom policy definitions at management group scope'

@sys.description('The management group scope to which the policy definitions are to be created at.')
param parTargetManagementGroupId string = 'Buckman'

@sys.description('Set Parameter to true to Opt-out of deployment telemetry')
param parTelemetryOptOut bool = false

var varTargetManagementGroupResourceId = tenantResourceId('Microsoft.Management/managementGroups', parTargetManagementGroupId)

// This variable contains a number of objects that load in the custom Azure Policy Defintions that are provided as part of the ESLZ/ALZ reference implementation - this is automatically created in the file 'infra-as-code\bicep\modules\policy\lib\policy_definitions\_policyDefinitionsBicepInput.txt' via a GitHub action, that runs on a daily schedule, and is then manually copied into this variable.
var varCustomPolicyDefinitionsArray = [
  {
		name: 'Append-AppService-httpsonly'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Append-AppService-httpsonly.json')
	}
	{
		name: 'Append-AppService-latestTLS'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Append-AppService-latestTLS.json')
	}
	{
		name: 'Append-KV-SoftDelete'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Append-KV-SoftDelete.json')
	}
	{
		name: 'Append-Redis-disableNonSslPort'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Append-Redis-disableNonSslPort.json')
	}
	{
		name: 'Append-Redis-sslEnforcement'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Append-Redis-sslEnforcement.json')
	}
	{
		name: 'Audit-AzureHybridBenefit'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Audit-AzureHybridBenefit.json')
	}
	{
		name: 'Audit-Disks-UnusedResourcesCostOptimization'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Audit-Disks-UnusedResourcesCostOptimization.json')
	}
	{
		name: 'Audit-MachineLearning-PrivateEndpointId'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Audit-MachineLearning-PrivateEndpointId.json')
	}
	{
		name: 'Audit-PrivateLinkDnsZones'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Audit-PrivateLinkDnsZones.json')
	}
	{
		name: 'Audit-PublicIpAddresses-UnusedResourcesCostOptimization'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Audit-PublicIpAddresses-UnusedResourcesCostOptimization.json')
	}
	{
		name: 'Audit-ServerFarms-UnusedResourcesCostOptimization'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Audit-ServerFarms-UnusedResourcesCostOptimization.json')
	}
	{
		name: 'Audit-Tags-Mandatory-Rg'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Audit-Tags-Mandatory-Rg.json')
	}
	{
		name: 'Audit-Tags-Mandatory'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Audit-Tags-Mandatory.json')
	}
	{
		name: 'Deny-AA-child-resources'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-AA-child-resources.json')
	}
	{
		name: 'Deny-APIM-TLS'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-APIM-TLS.json')
	}
	{
		name: 'Deny-AppGw-Without-Tls'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-AppGw-Without-Tls.json')
	}
	{
		name: 'Deny-AppGW-Without-WAF'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-AppGW-Without-WAF.json')
	}
	{
		name: 'Deny-AppService-without-BYOC'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-AppService-without-BYOC.json')
	}
	{
		name: 'Deny-AppServiceApiApp-http'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-AppServiceApiApp-http.json')
	}
	{
		name: 'Deny-AppServiceFunctionApp-http'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-AppServiceFunctionApp-http.json')
	}
	{
		name: 'Deny-AppServiceWebApp-http'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-AppServiceWebApp-http.json')
	}
	{
		name: 'Deny-AzFw-Without-Policy'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-AzFw-Without-Policy.json')
	}
	{
		name: 'Deny-CognitiveServices-NetworkAcls'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-CognitiveServices-NetworkAcls.json')
	}
	{
		name: 'Deny-CognitiveServices-Resource-Kinds'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-CognitiveServices-Resource-Kinds.json')
	}
	{
		name: 'Deny-CognitiveServices-RestrictOutboundNetworkAccess'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-CognitiveServices-RestrictOutboundNetworkAccess.json')
	}
	{
		name: 'Deny-Databricks-NoPublicIp'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-Databricks-NoPublicIp.json')
	}
	{
		name: 'Deny-Databricks-Sku'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-Databricks-Sku.json')
	}
	{
		name: 'Deny-Databricks-VirtualNetwork'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-Databricks-VirtualNetwork.json')
	}
	{
		name: 'Deny-EH-minTLS'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-EH-minTLS.json')
	}
	{
		name: 'Deny-EH-Premium-CMK'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-EH-Premium-CMK.json')
	}
	{
		name: 'Deny-FileServices-InsecureAuth'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-FileServices-InsecureAuth.json')
	}
	{
		name: 'Deny-FileServices-InsecureKerberos'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-FileServices-InsecureKerberos.json')
	}
	{
		name: 'Deny-FileServices-InsecureSmbChannel'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-FileServices-InsecureSmbChannel.json')
	}
	{
		name: 'Deny-FileServices-InsecureSmbVersions'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-FileServices-InsecureSmbVersions.json')
	}
	{
		name: 'Deny-LogicApp-Public-Network'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-LogicApp-Public-Network.json')
	}
	{
		name: 'Deny-LogicApps-Without-Https'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-LogicApps-Without-Https.json')
	}
	{
		name: 'Deny-MachineLearning-Aks'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-MachineLearning-Aks.json')
	}
	{
		name: 'Deny-MachineLearning-Compute-SubnetId'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-MachineLearning-Compute-SubnetId.json')
	}
	{
		name: 'Deny-MachineLearning-Compute-VmSize'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-MachineLearning-Compute-VmSize.json')
	}
	{
		name: 'Deny-MachineLearning-ComputeCluster-RemoteLoginPortPublicAccess'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-MachineLearning-ComputeCluster-RemoteLoginPortPublicAccess.json')
	}
	{
		name: 'Deny-MachineLearning-ComputeCluster-Scale'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-MachineLearning-ComputeCluster-Scale.json')
	}
	{
		name: 'Deny-MachineLearning-HbiWorkspace'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-MachineLearning-HbiWorkspace.json')
	}
	{
		name: 'Deny-MachineLearning-PublicAccessWhenBehindVnet'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-MachineLearning-PublicAccessWhenBehindVnet.json')
	}
	{
		name: 'Deny-MachineLearning-PublicNetworkAccess'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-MachineLearning-PublicNetworkAccess.json')
	}
	{
		name: 'Deny-MgmtPorts-From-Internet'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-MgmtPorts-From-Internet.json')
	}
	{
		name: 'Deny-MySql-http'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-MySql-http.json')
	}
	{
		name: 'Deny-PostgreSql-http'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-PostgreSql-http.json')
	}
	{
		name: 'Deny-Private-DNS-Zones'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-Private-DNS-Zones.json')
	}
	{
		name: 'Deny-PublicEndpoint-MariaDB'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-PublicEndpoint-MariaDB.json')
	}
	{
		name: 'Deny-PublicIP'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-PublicIP.json')
	}
	{
		name: 'Deny-RDP-From-Internet'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-RDP-From-Internet.json')
	}
	{
		name: 'Deny-Redis-http'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-Redis-http.json')
	}
	{
		name: 'Deny-Service-Endpoints'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-Service-Endpoints.json')
	}
	{
		name: 'Deny-Sql-minTLS'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-Sql-minTLS.json')
	}
	{
		name: 'Deny-SqlMi-minTLS'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-SqlMi-minTLS.json')
	}
	{
		name: 'Deny-Storage-ContainerDeleteRetentionPolicy'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-Storage-ContainerDeleteRetentionPolicy.json')
	}
	{
		name: 'Deny-Storage-CopyScope'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-Storage-CopyScope.json')
	}
	{
		name: 'Deny-Storage-CorsRules'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-Storage-CorsRules.json')
	}
	{
		name: 'Deny-Storage-LocalUser'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-Storage-LocalUser.json')
	}
	{
		name: 'Deny-Storage-minTLS'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-Storage-minTLS.json')
	}
	{
		name: 'Deny-Storage-NetworkAclsBypass'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-Storage-NetworkAclsBypass.json')
	}
	{
		name: 'Deny-Storage-NetworkAclsVirtualNetworkRules'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-Storage-NetworkAclsVirtualNetworkRules.json')
	}
	{
		name: 'Deny-Storage-ResourceAccessRulesResourceId'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-Storage-ResourceAccessRulesResourceId.json')
	}
	{
		name: 'Deny-Storage-ResourceAccessRulesTenantId'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-Storage-ResourceAccessRulesTenantId.json')
	}
	{
		name: 'Deny-Storage-ServicesEncryption'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-Storage-ServicesEncryption.json')
	}
	{
		name: 'Deny-Storage-SFTP'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-Storage-SFTP.json')
	}
	{
		name: 'Deny-StorageAccount-CustomDomain'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-StorageAccount-CustomDomain.json')
	}
	{
		name: 'Deny-Subnet-Without-Nsg'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-Subnet-Without-Nsg.json')
	}
	{
		name: 'Deny-Subnet-Without-Penp'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-Subnet-Without-Penp.json')
	}
	{
		name: 'Deny-Subnet-Without-Udr'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-Subnet-Without-Udr.json')
	}
	{
		name: 'Deny-UDR-With-Specific-NextHop'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-UDR-With-Specific-NextHop.json')
	}
	{
		name: 'Deny-VNET-Peer-Cross-Sub'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-VNET-Peer-Cross-Sub.json')
	}
	{
		name: 'Deny-VNET-Peering-To-Non-Approved-VNETs'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-VNET-Peering-To-Non-Approved-VNETs.json')
	}
	{
		name: 'Deny-VNet-Peering'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deny-VNet-Peering.json')
	}
	{
		name: 'DenyAction-ActivityLogs'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_DenyAction-ActivityLogs.json')
	}
	{
		name: 'DenyAction-DeleteResources'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_DenyAction-DeleteResources.json')
	}
	{
		name: 'DenyAction-DiagnosticLogs'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_DenyAction-DiagnosticLogs.json')
	}
	{
		name: 'Deploy-ASC-SecurityContacts'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-ASC-SecurityContacts.json')
	}
	{
		name: 'Deploy-Budget'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Budget.json')
	}
	{
		name: 'Deploy-Custom-Route-Table'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Custom-Route-Table.json')
	}
	{
		name: 'Deploy-DDoSProtection'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-DDoSProtection.json')
	}
	{
		name: 'Deploy-Diagnostics-AA'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-AA.json')
	}
	{
		name: 'Deploy-Diagnostics-ACI'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-ACI.json')
	}
	{
		name: 'Deploy-Diagnostics-ACR'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-ACR.json')
	}
	{
		name: 'Deploy-Diagnostics-AnalysisService'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-AnalysisService.json')
	}
	{
		name: 'Deploy-Diagnostics-ApiForFHIR'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-ApiForFHIR.json')
	}
	{
		name: 'Deploy-Diagnostics-APIMgmt'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-APIMgmt.json')
	}
	{
		name: 'Deploy-Diagnostics-ApplicationGateway'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-ApplicationGateway.json')
	}
	{
		name: 'Deploy-Diagnostics-AVDScalingPlans'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-AVDScalingPlans.json')
	}
	{
		name: 'Deploy-Diagnostics-Bastion'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-Bastion.json')
	}
	{
		name: 'Deploy-Diagnostics-CDNEndpoints'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-CDNEndpoints.json')
	}
	{
		name: 'Deploy-Diagnostics-CognitiveServices'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-CognitiveServices.json')
	}
	{
		name: 'Deploy-Diagnostics-CosmosDB'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-CosmosDB.json')
	}
	{
		name: 'Deploy-Diagnostics-Databricks'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-Databricks.json')
	}
	{
		name: 'Deploy-Diagnostics-DataExplorerCluster'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-DataExplorerCluster.json')
	}
	{
		name: 'Deploy-Diagnostics-DataFactory'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-DataFactory.json')
	}
	{
		name: 'Deploy-Diagnostics-DLAnalytics'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-DLAnalytics.json')
	}
	{
		name: 'Deploy-Diagnostics-EventGridSub'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-EventGridSub.json')
	}
	{
		name: 'Deploy-Diagnostics-EventGridSystemTopic'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-EventGridSystemTopic.json')
	}
	{
		name: 'Deploy-Diagnostics-EventGridTopic'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-EventGridTopic.json')
	}
	{
		name: 'Deploy-Diagnostics-ExpressRoute'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-ExpressRoute.json')
	}
	{
		name: 'Deploy-Diagnostics-Firewall'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-Firewall.json')
	}
	{
		name: 'Deploy-Diagnostics-FrontDoor'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-FrontDoor.json')
	}
	{
		name: 'Deploy-Diagnostics-Function'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-Function.json')
	}
	{
		name: 'Deploy-Diagnostics-HDInsight'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-HDInsight.json')
	}
	{
		name: 'Deploy-Diagnostics-iotHub'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-iotHub.json')
	}
	{
		name: 'Deploy-Diagnostics-LoadBalancer'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-LoadBalancer.json')
	}
	{
		name: 'Deploy-Diagnostics-LogAnalytics'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-LogAnalytics.json')
	}
	{
		name: 'Deploy-Diagnostics-LogicAppsISE'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-LogicAppsISE.json')
	}
	{
		name: 'Deploy-Diagnostics-MariaDB'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-MariaDB.json')
	}
	{
		name: 'Deploy-Diagnostics-MediaService'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-MediaService.json')
	}
	{
		name: 'Deploy-Diagnostics-MlWorkspace'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-MlWorkspace.json')
	}
	{
		name: 'Deploy-Diagnostics-MySQL'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-MySQL.json')
	}
	{
		name: 'Deploy-Diagnostics-NetworkSecurityGroups'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-NetworkSecurityGroups.json')
	}
	{
		name: 'Deploy-Diagnostics-NIC'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-NIC.json')
	}
	{
		name: 'Deploy-Diagnostics-PostgreSQL'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-PostgreSQL.json')
	}
	{
		name: 'Deploy-Diagnostics-PowerBIEmbedded'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-PowerBIEmbedded.json')
	}
	{
		name: 'Deploy-Diagnostics-RedisCache'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-RedisCache.json')
	}
	{
		name: 'Deploy-Diagnostics-Relay'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-Relay.json')
	}
	{
		name: 'Deploy-Diagnostics-SignalR'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-SignalR.json')
	}
	{
		name: 'Deploy-Diagnostics-SQLElasticPools'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-SQLElasticPools.json')
	}
	{
		name: 'Deploy-Diagnostics-SQLMI'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-SQLMI.json')
	}
	{
		name: 'Deploy-Diagnostics-TimeSeriesInsights'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-TimeSeriesInsights.json')
	}
	{
		name: 'Deploy-Diagnostics-TrafficManager'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-TrafficManager.json')
	}
	{
		name: 'Deploy-Diagnostics-VirtualNetwork'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-VirtualNetwork.json')
	}
	{
		name: 'Deploy-Diagnostics-VM'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-VM.json')
	}
	{
		name: 'Deploy-Diagnostics-VMSS'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-VMSS.json')
	}
	{
		name: 'Deploy-Diagnostics-VNetGW'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-VNetGW.json')
	}
	{
		name: 'Deploy-Diagnostics-VWanS2SVPNGW'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-VWanS2SVPNGW.json')
	}
	{
		name: 'Deploy-Diagnostics-WebServerFarm'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-WebServerFarm.json')
	}
	{
		name: 'Deploy-Diagnostics-Website'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-Website.json')
	}
	{
		name: 'Deploy-Diagnostics-WVDAppGroup'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-WVDAppGroup.json')
	}
	{
		name: 'Deploy-Diagnostics-WVDHostPools'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-WVDHostPools.json')
	}
	{
		name: 'Deploy-Diagnostics-WVDWorkspace'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Diagnostics-WVDWorkspace.json')
	}
	{
		name: 'Deploy-FirewallPolicy'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-FirewallPolicy.json')
	}
	{
		name: 'Deploy-LogicApp-TLS'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-LogicApp-TLS.json')
	}
	{
		name: 'Deploy-MDFC-Arc-SQL-DCR-Association'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-MDFC-Arc-SQL-DCR-Association.json')
	}
	{
		name: 'Deploy-MDFC-Arc-Sql-DefenderSQL-DCR'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-MDFC-Arc-Sql-DefenderSQL-DCR.json')
	}
	{
		name: 'Deploy-MDFC-SQL-AMA'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-MDFC-SQL-AMA.json')
	}
	{
		name: 'Deploy-MDFC-SQL-DefenderSQL-DCR'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-MDFC-SQL-DefenderSQL-DCR.json')
	}
	{
		name: 'Deploy-MDFC-SQL-DefenderSQL'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-MDFC-SQL-DefenderSQL.json')
	}
	{
		name: 'Deploy-MySQL-sslEnforcement'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-MySQL-sslEnforcement.json')
	}
	{
		name: 'Deploy-Nsg-FlowLogs-to-LA'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Nsg-FlowLogs-to-LA.json')
	}
	{
		name: 'Deploy-Nsg-FlowLogs'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Nsg-FlowLogs.json')
	}
	{
		name: 'Deploy-PostgreSQL-sslEnforcement'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-PostgreSQL-sslEnforcement.json')
	}
	{
		name: 'Deploy-Private-DNS-Generic'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Private-DNS-Generic.json')
	}
	{
		name: 'Deploy-Sql-AuditingSettings'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Sql-AuditingSettings.json')
	}
	{
		name: 'Deploy-SQL-minTLS'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-SQL-minTLS.json')
	}
	{
		name: 'Deploy-Sql-SecurityAlertPolicies'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Sql-SecurityAlertPolicies.json')
	}
	{
		name: 'Deploy-Sql-Tde'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Sql-Tde.json')
	}
	{
		name: 'Deploy-Sql-vulnerabilityAssessments_20230706'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Sql-vulnerabilityAssessments_20230706.json')
	}
	{
		name: 'Deploy-Sql-vulnerabilityAssessments'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Sql-vulnerabilityAssessments.json')
	}
	{
		name: 'Deploy-SqlMi-minTLS'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-SqlMi-minTLS.json')
	}
	{
		name: 'Deploy-Storage-sslEnforcement'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Storage-sslEnforcement.json')
	}
	{
		name: 'Deploy-UserAssignedManagedIdentity-VMInsights'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-UserAssignedManagedIdentity-VMInsights.json')
	}
	{
		name: 'Deploy-Vm-autoShutdown'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Vm-autoShutdown.json')
	}
	{
		name: 'Deploy-VNET-HubSpoke'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-VNET-HubSpoke.json')
	}
	{
		name: 'Deploy-Windows-DomainJoin'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Deploy-Windows-DomainJoin.json')
	}
	{
		name: 'Modify-NSG'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Modify-NSG.json')
	}
	{
		name: 'Modify-UDR'
		libDefinition: loadJsonContent('lib/policy_definitions/policy_definition_es_Modify-UDR.json')
	}
]

// This variable contains a number of objects that load in the custom Azure Policy Set/Initiative Defintions that are provided as part of the ESLZ/ALZ reference implementation - this is automatically created in the file 'infra-as-code\bicep\modules\policy\lib\policy_set_definitions\_policySetDefinitionsBicepInput.txt' via a GitHub action, that runs on a daily schedule, and is then manually copied into this variable.
var varCustomPolicySetDefinitionsArray = [
	{
		name: 'Audit-TrustedLaunch'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Audit-TrustedLaunch.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'AuditDisksOsTrustedLaunch'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b03bb370-5249-4ea4-9fce-2552e87e45fa'
				definitionParameters: varPolicySetDefinitionEsAuditTrustedLaunchParameters.AuditDisksOsTrustedLaunch.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'AuditTrustedLaunchEnabled'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/c95b54ad-0614-4633-ab29-104b01235cbf'
				definitionParameters: varPolicySetDefinitionEsAuditTrustedLaunchParameters.AuditTrustedLaunchEnabled.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Audit-UnusedResourcesCostOptimization'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Audit-UnusedResourcesCostOptimization.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'AuditAzureHybridBenefitUnusedResourcesCostOptimization'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Audit-AzureHybridBenefit'
				definitionParameters: varPolicySetDefinitionEsAuditUnusedResourcesCostOptimizationParameters.AuditAzureHybridBenefitUnusedResourcesCostOptimization.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'AuditDisksUnusedResourcesCostOptimization'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Audit-Disks-UnusedResourcesCostOptimization'
				definitionParameters: varPolicySetDefinitionEsAuditUnusedResourcesCostOptimizationParameters.AuditDisksUnusedResourcesCostOptimization.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'AuditPublicIpAddressesUnusedResourcesCostOptimization'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Audit-PublicIpAddresses-UnusedResourcesCostOptimization'
				definitionParameters: varPolicySetDefinitionEsAuditUnusedResourcesCostOptimizationParameters.AuditPublicIpAddressesUnusedResourcesCostOptimization.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'AuditServerFarmsUnusedResourcesCostOptimization'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Audit-ServerFarms-UnusedResourcesCostOptimization'
				definitionParameters: varPolicySetDefinitionEsAuditUnusedResourcesCostOptimizationParameters.AuditServerFarmsUnusedResourcesCostOptimization.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Deny-PublicPaaSEndpoints'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Deny-PublicPaaSEndpoints.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'ACRDenyPaasPublicIP'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/0fdf0491-d080-4575-b627-ad0e843cba0f'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.ACRDenyPaasPublicIP.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'AFSDenyPaasPublicIP'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/21a8cd35-125e-4d13-b82d-2e19b7208bb7'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.AFSDenyPaasPublicIP.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'AKSDenyPaasPublicIP'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/040732e8-d947-40b8-95d6-854c95024bf8'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.AKSDenyPaasPublicIP.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'ApiManDenyPublicIP'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/df73bd95-24da-4a4f-96b9-4e8b94b402bd'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.ApiManDenyPublicIP.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'AppConfigDenyPublicIP'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/3d9f5e4c-9947-4579-9539-2a7695fbc187'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.AppConfigDenyPublicIP.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'AsDenyPublicIP'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1b5ef780-c53c-4a64-87f3-bb9c8c8094ba'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.AsDenyPublicIP.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'AseDenyPublicIP'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/2d048aca-6479-4923-88f5-e2ac295d9af3'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.AseDenyPublicIP.parameters
				definitionGroups: []
				definitionVersion: '3.*.*'
			}
			{
				definitionReferenceId: 'AsrVaultDenyPublicIP'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/9ebbbba3-4d65-4da9-bb67-b22cfaaff090'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.AsrVaultDenyPublicIP.parameters
				definitionGroups: []
				definitionVersion: '1.*.*-preview'
			}
			{
				definitionReferenceId: 'AutomationDenyPublicIP'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/955a914f-bf86-4f0e-acd5-e0766b0efcb6'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.AutomationDenyPublicIP.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'BatchDenyPublicIP'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/74c5a0ae-5e48-4738-b093-65e23a060488'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.BatchDenyPublicIP.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'BotServiceDenyPublicIP'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/5e8168db-69e3-4beb-9822-57cb59202a9d'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.BotServiceDenyPublicIP.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'ContainerAppsEnvironmentDenyPublicIP'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/d074ddf8-01a5-4b5e-a2b8-964aed452c0a'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.ContainerAppsEnvironmentDenyPublicIP.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'CosmosDenyPaasPublicIP'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/797b37f7-06b8-444c-b1ad-fc62867f335a'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.CosmosDenyPaasPublicIP.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Adf-Public-Network-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1cf164be-6819-4a50-b8fa-4bcaa4f98fb6'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters['Deny-Adf-Public-Network-Access'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-ADX-Public-Network-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/43bc7be6-5e69-4b0d-a2bb-e815557ca673'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters['Deny-ADX-Public-Network-Access'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-AppSlots-Public'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/701a595d-38fb-4a66-ae6d-fb3735217622'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters['Deny-AppSlots-Public'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Cognitive-Services-Network-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/037eea7a-bd0a-46c5-9a66-03aea78705d3'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters['Deny-Cognitive-Services-Network-Access'].parameters
				definitionGroups: []
				definitionVersion: '3.*.*'
			}
			{
				definitionReferenceId: 'Deny-Cognitive-Services-Public-Network-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/0725b4dd-7e76-479c-a735-68e7ee23d5ca'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters['Deny-Cognitive-Services-Public-Network-Access'].parameters
				definitionGroups: []
				definitionVersion: '3.*.*'
			}
			{
				definitionReferenceId: 'Deny-CognitiveSearch-PublicEndpoint'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/ee980b6d-0eca-4501-8d54-f6290fd512c3'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters['Deny-CognitiveSearch-PublicEndpoint'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-ContainerApps-Public-Network-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/783ea2a8-b8fd-46be-896a-9ae79643a0b1'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters['Deny-ContainerApps-Public-Network-Access'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-EH-Public-Network-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/0602787f-9896-402a-a6e1-39ee63ee435e'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters['Deny-EH-Public-Network-Access'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-EventGrid-Public-Network-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/f8f774be-6aee-492a-9e29-486ef81f3a68'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters['Deny-EventGrid-Public-Network-Access'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-EventGrid-Topic-Public-Network-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1adadefe-5f21-44f7-b931-a59b54ccdb45'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters['Deny-EventGrid-Topic-Public-Network-Access'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Grafana-PublicNetworkAccess'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/e8775d5a-73b7-4977-a39b-833ef0114628'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters['Deny-Grafana-PublicNetworkAccess'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Hostpool-PublicNetworkAccess'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/c25dcf31-878f-4eba-98eb-0818fdc6a334'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters['Deny-Hostpool-PublicNetworkAccess'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-KV-Hms-PublicNetwork'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/19ea9d63-adee-4431-a95e-1913c6c1c75f'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters['Deny-KV-Hms-PublicNetwork'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*-preview'
			}
			{
				definitionReferenceId: 'Deny-LogicApp-Public-Network-Access'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-LogicApp-Public-Network'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters['Deny-LogicApp-Public-Network-Access'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-ManagedDisk-Public-Network-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/8405fdab-1faf-48aa-b702-999c9c172094'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters['Deny-ManagedDisk-Public-Network-Access'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-MySql-Public-Network-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/d9844e8a-1437-4aeb-a32c-0c992f056095'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters['Deny-MySql-Public-Network-Access'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-PostgreSql-Public-Network-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b52376f7-9612-48a1-81cd-1ffe4b61032c'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters['Deny-PostgreSql-Public-Network-Access'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-Sb-PublicEndpoint'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/cbd11fd3-3002-4907-b6c8-579f0e700e13'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters['Deny-Sb-PublicEndpoint'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Sql-Managed-Public-Endpoint'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/9dfea752-dd46-4766-aed1-c355fa93fb91'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters['Deny-Sql-Managed-Public-Endpoint'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Storage-Public-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/4fa4b6c0-31ca-4c0d-b10d-24b96f62a751'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters['Deny-Storage-Public-Access'].parameters
				definitionGroups: []
				definitionVersion: '3.*.*-preview'
			}
			{
				definitionReferenceId: 'Deny-Synapse-Public-Network-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/38d8df46-cf4e-4073-8e03-48c24b29de0d'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters['Deny-Synapse-Public-Network-Access'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Workspace-PublicNetworkAccess'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/87ac3038-c07a-4b92-860d-29e270a4f3cd'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters['Deny-Workspace-PublicNetworkAccess'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'FunctionAppSlotsDenyPublicIP'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/11c82d0c-db9f-4d7b-97c5-f3f9aa957da2'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.FunctionAppSlotsDenyPublicIP.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'FunctionDenyPublicIP'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/969ac98b-88a8-449f-883c-2e9adb123127'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.FunctionDenyPublicIP.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'KeyVaultDenyPaasPublicIP'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/405c5871-3e91-4644-8a63-58e19d68ff5b'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.KeyVaultDenyPaasPublicIP.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'MariaDbDenyPublicIP'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/fdccbe47-f3e3-4213-ad5d-ea459b2fa077'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.MariaDbDenyPublicIP.parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'MlDenyPublicIP'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/438c38d2-3772-465a-a9cc-7a6666a275ce'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.MlDenyPublicIP.parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'MySQLFlexDenyPublicIP'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/c9299215-ae47-4f50-9c54-8a392f68a052'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.MySQLFlexDenyPublicIP.parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'PostgreSQLFlexDenyPublicIP'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/5e1de0e3-42cb-4ebc-a86d-61d0c619ca48'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.PostgreSQLFlexDenyPublicIP.parameters
				definitionGroups: []
				definitionVersion: '3.*.*'
			}
			{
				definitionReferenceId: 'RedisCacheDenyPublicIP'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/470baccb-7e51-4549-8b1a-3e5be069f663'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.RedisCacheDenyPublicIP.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'SqlServerDenyPaasPublicIP'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1b8ca024-1d5c-4dec-8995-b1a932b41780'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.SqlServerDenyPaasPublicIP.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'StorageDenyPaasPublicIP'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b2982f36-99f2-4db5-8eff-283140c09693'
				definitionParameters: varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters.StorageDenyPaasPublicIP.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'DenyAction-DeleteProtection'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_DenyAction-DeleteProtection.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'DenyActionDelete-ActivityLogSettings'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/DenyAction-ActivityLogs'
				definitionParameters: varPolicySetDefinitionEsDenyActionDeleteProtectionParameters['DenyActionDelete-ActivityLogSettings'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DenyActionDelete-DiagnosticSettings'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/DenyAction-DiagnosticLogs'
				definitionParameters: varPolicySetDefinitionEsDenyActionDeleteProtectionParameters['DenyActionDelete-DiagnosticSettings'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Deploy-AUM-CheckUpdates'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Deploy-AUM-CheckUpdates.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'azureUpdateManagerVmArcCheckUpdateLinux'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/bfea026e-043f-4ff4-9d1b-bf301ca7ff46'
				definitionParameters: varPolicySetDefinitionEsDeployAUMCheckUpdatesParameters.azureUpdateManagerVmArcCheckUpdateLinux.parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'azureUpdateManagerVmArcCheckUpdateWindows'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/bfea026e-043f-4ff4-9d1b-bf301ca7ff46'
				definitionParameters: varPolicySetDefinitionEsDeployAUMCheckUpdatesParameters.azureUpdateManagerVmArcCheckUpdateWindows.parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'azureUpdateManagerVmCheckUpdateLinux'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/59efceea-0c96-497e-a4a1-4eb2290dac15'
				definitionParameters: varPolicySetDefinitionEsDeployAUMCheckUpdatesParameters.azureUpdateManagerVmCheckUpdateLinux.parameters
				definitionGroups: []
				definitionVersion: '4.*.*'
			}
			{
				definitionReferenceId: 'azureUpdateManagerVmCheckUpdateWindows'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/59efceea-0c96-497e-a4a1-4eb2290dac15'
				definitionParameters: varPolicySetDefinitionEsDeployAUMCheckUpdatesParameters.azureUpdateManagerVmCheckUpdateWindows.parameters
				definitionGroups: []
				definitionVersion: '4.*.*'
			}
		]
	}
	{
		name: 'Deploy-Diagnostics-LogAnalytics'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Deploy-Diagnostics-LogAnalytics.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'ACIDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ACI'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.ACIDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'ACRDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ACR'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.ACRDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'AKSDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/6c66c325-74c8-42fd-a286-a74b0e2939d8'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.AKSDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'AnalysisServiceDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-AnalysisService'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.AnalysisServiceDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'APIforFHIRDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ApiForFHIR'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.APIforFHIRDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'APIMgmtDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-APIMgmt'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.APIMgmtDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'ApplicationGatewayDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ApplicationGateway'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.ApplicationGatewayDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'AppServiceDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-WebServerFarm'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.AppServiceDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'AppServiceWebappDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Website'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.AppServiceWebappDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'AutomationDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-AA'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.AutomationDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'AVDScalingPlansDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-AVDScalingPlans'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.AVDScalingPlansDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'BastionDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Bastion'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.BastionDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'BatchDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/c84e5349-db6d-4769-805e-e14037dab9b5'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.BatchDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'CDNEndpointsDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-CDNEndpoints'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.CDNEndpointsDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'CognitiveServicesDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-CognitiveServices'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.CognitiveServicesDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'CosmosDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-CosmosDB'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.CosmosDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'DatabricksDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Databricks'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.DatabricksDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'DataExplorerClusterDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-DataExplorerCluster'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.DataExplorerClusterDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'DataFactoryDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-DataFactory'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.DataFactoryDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'DataLakeAnalyticsDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-DLAnalytics'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.DataLakeAnalyticsDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'DataLakeStoreDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/d56a5a7c-72d7-42bc-8ceb-3baf4c0eae03'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.DataLakeStoreDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'EventGridSubDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-EventGridSub'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.EventGridSubDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'EventGridTopicDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-EventGridTopic'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.EventGridTopicDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'EventHubDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1f6e93e8-6b31-41b1-83f6-36e449a42579'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.EventHubDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'EventSystemTopicDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-EventGridSystemTopic'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.EventSystemTopicDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'ExpressRouteDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-ExpressRoute'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.ExpressRouteDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'FirewallDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Firewall'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.FirewallDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'FrontDoorDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-FrontDoor'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.FrontDoorDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'FunctionAppDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Function'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.FunctionAppDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'HDInsightDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-HDInsight'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.HDInsightDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'IotHubDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-iotHub'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.IotHubDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'KeyVaultDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/bef3f64c-5290-43b7-85b0-9b254eef4c47'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.KeyVaultDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'LoadBalancerDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-LoadBalancer'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.LoadBalancerDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'LogAnalyticsDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-LogAnalytics'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.LogAnalyticsDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'LogicAppsISEDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-LogicAppsISE'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.LogicAppsISEDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'LogicAppsWFDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b889a06c-ec72-4b03-910a-cb169ee18721'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.LogicAppsWFDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'MariaDBDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-MariaDB'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.MariaDBDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'MediaServiceDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-MediaService'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.MediaServiceDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'MlWorkspaceDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-MlWorkspace'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.MlWorkspaceDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'MySQLDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-MySQL'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.MySQLDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'NetworkNICDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-NIC'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.NetworkNICDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'NetworkPublicIPNicDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/752154a7-1e0f-45c6-a880-ac75a7e4f648'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.NetworkPublicIPNicDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'NetworkSecurityGroupsDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-NetworkSecurityGroups'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.NetworkSecurityGroupsDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'PostgreSQLDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-PostgreSQL'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.PostgreSQLDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'PowerBIEmbeddedDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-PowerBIEmbedded'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.PowerBIEmbeddedDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'RecoveryVaultDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/c717fb0c-d118-4c43-ab3d-ece30ac81fb3'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.RecoveryVaultDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'RedisCacheDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-RedisCache'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.RedisCacheDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'RelayDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-Relay'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.RelayDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'SearchServicesDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/08ba64b8-738f-4918-9686-730d2ed79c7d'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.SearchServicesDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'ServiceBusDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/04d53d87-841c-4f23-8a5b-21564380b55e'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.ServiceBusDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'SignalRDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SignalR'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.SignalRDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'SQLDatabaseDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b79fa14e-238a-4c2d-b376-442ce508fc84'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.SQLDatabaseDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'SQLElasticPoolsDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SQLElasticPools'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.SQLElasticPoolsDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'SQLMDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-SQLMI'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.SQLMDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'StorageAccountBlobServicesDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b4fe1a3b-0715-4c6c-a5ea-ffc33cf823cb'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.StorageAccountBlobServicesDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'StorageAccountDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/59759c62-9a22-4cdf-ae64-074495983fef'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.StorageAccountDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'StorageAccountFileServicesDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/25a70cc8-2bd4-47f1-90b6-1478e4662c96'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.StorageAccountFileServicesDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'StorageAccountQueueServicesDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/7bd000e3-37c7-4928-9f31-86c4b77c5c45'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.StorageAccountQueueServicesDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'StorageAccountTableServicesDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/2fb86bf3-d221-43d1-96d1-2434af34eaa0'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.StorageAccountTableServicesDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'StreamAnalyticsDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/237e0f7e-b0e8-4ec4-ad46-8c12cb66d673'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.StreamAnalyticsDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'TimeSeriesInsightsDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-TimeSeriesInsights'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.TimeSeriesInsightsDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'TrafficManagerDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-TrafficManager'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.TrafficManagerDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'VirtualMachinesDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VM'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.VirtualMachinesDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'VirtualNetworkDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VirtualNetwork'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.VirtualNetworkDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'VMSSDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VMSS'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.VMSSDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'VNetGWDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VNetGW'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.VNetGWDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'VWanS2SVPNGWDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-VWanS2SVPNGW'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.VWanS2SVPNGWDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'WVDAppGroupDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-WVDAppGroup'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.WVDAppGroupDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'WVDHostPoolsDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-WVDHostPools'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.WVDHostPoolsDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'WVDWorkspaceDeployDiagnosticLogDeployLogAnalytics'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Diagnostics-WVDWorkspace'
				definitionParameters: varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters.WVDWorkspaceDeployDiagnosticLogDeployLogAnalytics.parameters
				definitionGroups: []
				definitionVersion: ''
			}
		]
	}
	{
		name: 'Deploy-MDFC-Config_20240319'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Deploy-MDFC-Config_20240319.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'ascExport'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/ffb6f416-7bd2-4488-8828-56585fef2be9'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfig_20240319Parameters.ascExport.parameters
				definitionGroups: []
				definitionVersion: '4.*.*'
			}
			{
				definitionReferenceId: 'azurePolicyForKubernetes'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/a8eff44f-8c92-45c3-a3fb-9880802d67a7'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfig_20240319Parameters.azurePolicyForKubernetes.parameters
				definitionGroups: []
				definitionVersion: '4.*.*'
			}
			{
				definitionReferenceId: 'defenderForAppServices'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b40e7bcd-a1e5-47fe-b9cf-2f534d0bfb7d'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfig_20240319Parameters.defenderForAppServices.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'defenderForArm'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b7021b2b-08fd-4dc0-9de7-3c6ece09faf9'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfig_20240319Parameters.defenderForArm.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'defenderforContainers'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/c9ddb292-b203-4738-aead-18e2716e858f'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfig_20240319Parameters.defenderforContainers.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'defenderForCosmosDbs'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/82bf5b87-728b-4a74-ba4d-6123845cf542'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfig_20240319Parameters.defenderForCosmosDbs.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'defenderForCspm'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/72f8cee7-2937-403d-84a1-a4e3e57f3c21'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfig_20240319Parameters.defenderForCspm.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'defenderForKeyVaults'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1f725891-01c0-420a-9059-4fa46cb770b7'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfig_20240319Parameters.defenderForKeyVaults.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'defenderforKubernetes'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/64def556-fbad-4622-930e-72d1d5589bf5'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfig_20240319Parameters.defenderforKubernetes.parameters
				definitionGroups: []
				definitionVersion: '4.*.*'
			}
			{
				definitionReferenceId: 'defenderForOssDb'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/44433aa3-7ec2-4002-93ea-65c65ff0310a'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfig_20240319Parameters.defenderForOssDb.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'defenderForSqlPaas'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b99b73e7-074b-4089-9395-b7236f094491'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfig_20240319Parameters.defenderForSqlPaas.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'defenderForSqlServerVirtualMachines'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/50ea7265-7d8c-429e-9a7d-ca1f410191c3'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfig_20240319Parameters.defenderForSqlServerVirtualMachines.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'defenderForStorageAccountsV2'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/cfdc5972-75b3-4418-8ae1-7f5c36839390'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfig_20240319Parameters.defenderForStorageAccountsV2.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'defenderForVM'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/8e86a5b6-b9bd-49d1-8e21-4bb8a0862222'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfig_20240319Parameters.defenderForVM.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'defenderForVMVulnerabilityAssessment'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/13ce0167-8ca6-4048-8e6b-f996402e3c1b'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfig_20240319Parameters.defenderForVMVulnerabilityAssessment.parameters
				definitionGroups: []
				definitionVersion: '4.*.*'
			}
			{
				definitionReferenceId: 'migrateToMdeTvm'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/766e621d-ba95-4e43-a6f2-e945db3d7888'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfig_20240319Parameters.migrateToMdeTvm.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'securityEmailContact'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-ASC-SecurityContacts'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfig_20240319Parameters.securityEmailContact.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Deploy-MDFC-Config'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Deploy-MDFC-Config.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'ascExport'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/ffb6f416-7bd2-4488-8828-56585fef2be9'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfigParameters.ascExport.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'azurePolicyForKubernetes'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/a8eff44f-8c92-45c3-a3fb-9880802d67a7'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfigParameters.azurePolicyForKubernetes.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'defenderForApis'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/e54d2be9-5f2e-4d65-98e4-4f0e670b23d6'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfigParameters.defenderForApis.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'defenderForAppServices'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b40e7bcd-a1e5-47fe-b9cf-2f534d0bfb7d'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfigParameters.defenderForAppServices.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'defenderForArm'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b7021b2b-08fd-4dc0-9de7-3c6ece09faf9'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfigParameters.defenderForArm.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'defenderforContainers'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/c9ddb292-b203-4738-aead-18e2716e858f'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfigParameters.defenderforContainers.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'defenderForCosmosDbs'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/82bf5b87-728b-4a74-ba4d-6123845cf542'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfigParameters.defenderForCosmosDbs.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'defenderForCspm'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/689f7782-ef2c-4270-a6d0-7664869076bd'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfigParameters.defenderForCspm.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'defenderForDns'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/2370a3c1-4a25-4283-a91a-c9c1a145fb2f'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfigParameters.defenderForDns.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'defenderForKeyVaults'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1f725891-01c0-420a-9059-4fa46cb770b7'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfigParameters.defenderForKeyVaults.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'defenderforKubernetes'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/64def556-fbad-4622-930e-72d1d5589bf5'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfigParameters.defenderforKubernetes.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'defenderForOssDb'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/44433aa3-7ec2-4002-93ea-65c65ff0310a'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfigParameters.defenderForOssDb.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'defenderForSqlPaas'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b99b73e7-074b-4089-9395-b7236f094491'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfigParameters.defenderForSqlPaas.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'defenderForSqlServerVirtualMachines'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/50ea7265-7d8c-429e-9a7d-ca1f410191c3'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfigParameters.defenderForSqlServerVirtualMachines.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'defenderForStorageAccountsV2'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/cfdc5972-75b3-4418-8ae1-7f5c36839390'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfigParameters.defenderForStorageAccountsV2.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'defenderForVM'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/8e86a5b6-b9bd-49d1-8e21-4bb8a0862222'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfigParameters.defenderForVM.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'defenderForVMVulnerabilityAssessment'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/13ce0167-8ca6-4048-8e6b-f996402e3c1b'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfigParameters.defenderForVMVulnerabilityAssessment.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'migrateToMdeTvm'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/766e621d-ba95-4e43-a6f2-e945db3d7888'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfigParameters.migrateToMdeTvm.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'securityEmailContact'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-ASC-SecurityContacts'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCConfigParameters.securityEmailContact.parameters
				definitionGroups: []
				definitionVersion: ''
			}
		]
	}
	{
		name: 'Deploy-MDFC-DefenderSQL-AMA'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Deploy-MDFC-DefenderSQL-AMA.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'defenderForSqlAma'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-MDFC-SQL-AMA'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCDefenderSQLAMAParameters.defenderForSqlAma.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'defenderForSqlArcAma'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/3592ff98-9787-443a-af59-4505d0fe0786'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCDefenderSQLAMAParameters.defenderForSqlArcAma.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'defenderForSqlArcDcrAssociation'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-MDFC-Arc-SQL-DCR-Association'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCDefenderSQLAMAParameters.defenderForSqlArcDcrAssociation.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'defenderForSqlArcMdsql'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/65503269-6a54-4553-8a28-0065a8e6d929'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCDefenderSQLAMAParameters.defenderForSqlArcMdsql.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'defenderForSqlArcMdsqlDcr'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-MDFC-Arc-Sql-DefenderSQL-DCR'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCDefenderSQLAMAParameters.defenderForSqlArcMdsqlDcr.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'defenderForSqlMdsql'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-MDFC-SQL-DefenderSQL'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCDefenderSQLAMAParameters.defenderForSqlMdsql.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'defenderForSqlMdsqlDcr'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-MDFC-SQL-DefenderSQL-DCR'
				definitionParameters: varPolicySetDefinitionEsDeployMDFCDefenderSQLAMAParameters.defenderForSqlMdsqlDcr.parameters
				definitionGroups: []
				definitionVersion: ''
			}
		]
	}
	{
		name: 'Deploy-Private-DNS-Zones'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Deploy-Private-DNS-Zones.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-ACR'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/e9585a95-5b8c-4d03-b193-dc7eb5ac4c32'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-ACR'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-App'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/7a860e27-9ca2-4fc6-822d-c2d248c300df'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-App'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-AppServices'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b318f84a-b872-429b-ac6d-a01b96814452'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-AppServices'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Arc'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/55c4db33-97b0-437b-8469-c4f4498f5df9'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Arc'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Automation-DSCHybrid'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/6dd01e4f-1be1-4e80-9d0b-d109e04cb064'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Automation-DSCHybrid'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Automation-Webhook'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/6dd01e4f-1be1-4e80-9d0b-d109e04cb064'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Automation-Webhook'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Batch'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/4ec38ebc-381f-45ee-81a4-acbc4be878f8'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Batch'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-BotService'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/6a4e6f44-f2af-4082-9702-033c9e88b9f8'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-BotService'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-CognitiveSearch'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/fbc14a67-53e4-4932-abcc-2049c6706009'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-CognitiveSearch'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-CognitiveServices'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/c4bc6f10-cb41-49eb-b000-d5ab82e2a091'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-CognitiveServices'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Cosmos-Cassandra'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/a63cc0bd-cda4-4178-b705-37dc439d3e0f'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Cosmos-Cassandra'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Cosmos-Gremlin'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/a63cc0bd-cda4-4178-b705-37dc439d3e0f'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Cosmos-Gremlin'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Cosmos-MongoDB'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/a63cc0bd-cda4-4178-b705-37dc439d3e0f'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Cosmos-MongoDB'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Cosmos-SQL'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/a63cc0bd-cda4-4178-b705-37dc439d3e0f'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Cosmos-SQL'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Cosmos-Table'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/a63cc0bd-cda4-4178-b705-37dc439d3e0f'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Cosmos-Table'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Databricks-Browser-AuthN'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/0eddd7f3-3d9b-4927-a07a-806e8ac9486c'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Databricks-Browser-AuthN'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Databricks-UI-Api'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/0eddd7f3-3d9b-4927-a07a-806e8ac9486c'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Databricks-UI-Api'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-DataFactory'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/86cd96e1-1745-420d-94d4-d3f2fe415aa4'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-DataFactory'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-DataFactory-Portal'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/86cd96e1-1745-420d-94d4-d3f2fe415aa4'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-DataFactory-Portal'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-DiskAccess'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/bc05b96c-0b36-4ca9-82f0-5c53f96ce05a'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-DiskAccess'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-EventGridDomains'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/d389df0a-e0d7-4607-833c-75a6fdac2c2d'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-EventGridDomains'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-EventGridTopics'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/baf19753-7502-405f-8745-370519b20483'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-EventGridTopics'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-EventHubNamespace'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/ed66d4f5-8220-45dc-ab4a-20d1749c74e6'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-EventHubNamespace'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-File-Sync'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/06695360-db88-47f6-b976-7500d4297475'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-File-Sync'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-HDInsight'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/43d6e3bd-fc6a-4b44-8b4d-2151d8736a11'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-HDInsight'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-IoT'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/aaa64d2d-2fa3-45e5-b332-0b031b9b30e8'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-IoT'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-IoTCentral'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/d627d7c6-ded5-481a-8f2e-7e16b1e6faf6'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-IoTCentral'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-IoTDeviceupdate'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/a222b93a-e6c2-4c01-817f-21e092455b2a'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-IoTDeviceupdate'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-IoTHubs'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/c99ce9c1-ced7-4c3e-aca0-10e69ce0cb02'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-IoTHubs'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-KeyVault'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/ac673a9a-f77d-4846-b2d8-a57f8e1c01d4'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-KeyVault'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-MachineLearningWorkspace'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/ee40564d-486e-4f68-a5ca-7a621edae0fb'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-MachineLearningWorkspace'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-ManagedGrafanaWorkspace'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/4c8537f8-cd1b-49ec-b704-18e82a42fd58'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-ManagedGrafanaWorkspace'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-MediaServices-Key'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b4a7f6c1-585e-4177-ad5b-c2c93f4bb991'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-MediaServices-Key'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-MediaServices-Live'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b4a7f6c1-585e-4177-ad5b-c2c93f4bb991'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-MediaServices-Live'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-MediaServices-Stream'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b4a7f6c1-585e-4177-ad5b-c2c93f4bb991'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-MediaServices-Stream'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Migrate'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/7590a335-57cf-4c95-babd-ecbc8fafeb1f'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Migrate'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Monitor'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/437914ee-c176-4fff-8986-7e05eb971365'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Monitor'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-RedisCache'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/e016b22b-e0eb-436d-8fd7-160c4eaed6e2'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-RedisCache'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-ServiceBusNamespace'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/f0fcf93c-c063-4071-9668-c47474bd3564'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-ServiceBusNamespace'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-SignalR'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b0e86710-7fb7-4a6c-a064-32e9b829509e'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-SignalR'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Site-Recovery'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/942bd215-1a66-44be-af65-6a1c0318dbe2'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Site-Recovery'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*-preview'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Site-Recovery-Backup'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/af783da1-4ad1-42be-800d-d19c70038820'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Site-Recovery-Backup'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*-preview'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Storage-Blob'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/75973700-529f-4de2-b794-fb9b6781b6b0'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Storage-Blob'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Storage-Blob-Sec'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/d847d34b-9337-4e2d-99a5-767e5ac9c582'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Storage-Blob-Sec'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Storage-DFS'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/83c6fe0f-2316-444a-99a1-1ecd8a7872ca'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Storage-DFS'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Storage-DFS-Sec'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/90bd4cb3-9f59-45f7-a6ca-f69db2726671'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Storage-DFS-Sec'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Storage-File'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/6df98d03-368a-4438-8730-a93c4d7693d6'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Storage-File'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Storage-Queue'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/bcff79fb-2b0d-47c9-97e5-3023479b00d1'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Storage-Queue'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Storage-Queue-Sec'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/da9b4ae8-5ddc-48c5-b9c0-25f8abf7a3d6'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Storage-Queue-Sec'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Storage-StaticWeb'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/9adab2a5-05ba-4fbd-831a-5bf958d04218'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Storage-StaticWeb'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Storage-StaticWeb-Sec'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/d19ae5f1-b303-4b82-9ca8-7682749faf0c'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Storage-StaticWeb-Sec'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Storage-Table'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/028bbd88-e9b5-461f-9424-a1b63a7bee1a'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Storage-Table'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Storage-Table-Secondary'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/c1d634a5-f73d-4cdd-889f-2cc7006eb47f'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Storage-Table-Secondary'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Synapse-Dev'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1e5ed725-f16c-478b-bd4b-7bfa2f7940b9'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Synapse-Dev'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Synapse-SQL'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1e5ed725-f16c-478b-bd4b-7bfa2f7940b9'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Synapse-SQL'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Synapse-SQL-OnDemand'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1e5ed725-f16c-478b-bd4b-7bfa2f7940b9'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Synapse-SQL-OnDemand'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-VirtualDesktopHostpool'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/9427df23-0f42-4e1e-bf99-a6133d841c4a'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-VirtualDesktopHostpool'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-VirtualDesktopWorkspace'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/34804460-d88b-4922-a7ca-537165e060ed'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-VirtualDesktopWorkspace'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-Private-DNS-Azure-Web'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/0b026355-49cb-467b-8ac4-f777874e175a'
				definitionParameters: varPolicySetDefinitionEsDeployPrivateDNSZonesParameters['DINE-Private-DNS-Azure-Web'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Deploy-Sql-Security_20240529'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Deploy-Sql-Security_20240529.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'SqlDbAuditingSettingsDeploySqlSecurity'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-AuditingSettings'
				definitionParameters: varPolicySetDefinitionEsDeploySqlSecurity_20240529Parameters.SqlDbAuditingSettingsDeploySqlSecurity.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'SqlDbSecurityAlertPoliciesDeploySqlSecurity'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-SecurityAlertPolicies'
				definitionParameters: varPolicySetDefinitionEsDeploySqlSecurity_20240529Parameters.SqlDbSecurityAlertPoliciesDeploySqlSecurity.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'SqlDbTdeDeploySqlSecurity'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/86a912f6-9a06-4e26-b447-11b16ba8659f'
				definitionParameters: varPolicySetDefinitionEsDeploySqlSecurity_20240529Parameters.SqlDbTdeDeploySqlSecurity.parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'SqlDbVulnerabilityAssessmentsDeploySqlSecurity'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-vulnerabilityAssessments_20230706'
				definitionParameters: varPolicySetDefinitionEsDeploySqlSecurity_20240529Parameters.SqlDbVulnerabilityAssessmentsDeploySqlSecurity.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Deploy-Sql-Security'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Deploy-Sql-Security.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'SqlDbAuditingSettingsDeploySqlSecurity'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-AuditingSettings'
				definitionParameters: varPolicySetDefinitionEsDeploySqlSecurityParameters.SqlDbAuditingSettingsDeploySqlSecurity.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'SqlDbSecurityAlertPoliciesDeploySqlSecurity'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-SecurityAlertPolicies'
				definitionParameters: varPolicySetDefinitionEsDeploySqlSecurityParameters.SqlDbSecurityAlertPoliciesDeploySqlSecurity.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'SqlDbTdeDeploySqlSecurity'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/86a912f6-9a06-4e26-b447-11b16ba8659f'
				definitionParameters: varPolicySetDefinitionEsDeploySqlSecurityParameters.SqlDbTdeDeploySqlSecurity.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'SqlDbVulnerabilityAssessmentsDeploySqlSecurity'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Sql-vulnerabilityAssessments'
				definitionParameters: varPolicySetDefinitionEsDeploySqlSecurityParameters.SqlDbVulnerabilityAssessmentsDeploySqlSecurity.parameters
				definitionGroups: []
				definitionVersion: ''
			}
		]
	}
	{
		name: 'Enforce-ACSB'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-ACSB.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'GcIdentity'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/3cf2ab00-13f1-4d0c-8971-2ac904541a7e'
				definitionParameters: varPolicySetDefinitionEsEnforceACSBParameters.GcIdentity.parameters
				definitionGroups: []
				definitionVersion: '4.*.*'
			}
			{
				definitionReferenceId: 'GcLinux'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/331e8ea8-378a-410f-a2e5-ae22f38bb0da'
				definitionParameters: varPolicySetDefinitionEsEnforceACSBParameters.GcLinux.parameters
				definitionGroups: []
				definitionVersion: '3.*.*'
			}
			{
				definitionReferenceId: 'GcWindows'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/385f5831-96d4-41db-9a3c-cd3af78aaae6'
				definitionParameters: varPolicySetDefinitionEsEnforceACSBParameters.GcWindows.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'LinAcsb'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/fc9b3da7-8347-4380-8e70-0a0361d8dedd'
				definitionParameters: varPolicySetDefinitionEsEnforceACSBParameters.LinAcsb.parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'WinAcsb'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/72650e9f-97bc-4b2a-ab5f-9781a9fcecbc'
				definitionParameters: varPolicySetDefinitionEsEnforceACSBParameters.WinAcsb.parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
		]
	}
	{
		name: 'Enforce-ALZ-Decomm'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-ALZ-Decomm.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'DecomDenyResources'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/a08ec900-254a-4555-9bf5-e42af04b5c5c'
				definitionParameters: varPolicySetDefinitionEsEnforceALZDecommParameters.DecomDenyResources.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DecomShutdownMachines'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Vm-autoShutdown'
				definitionParameters: varPolicySetDefinitionEsEnforceALZDecommParameters.DecomShutdownMachines.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Enforce-ALZ-Sandbox'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-ALZ-Sandbox.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'SandboxDenyVnetPeering'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-VNET-Peer-Cross-Sub'
				definitionParameters: varPolicySetDefinitionEsEnforceALZSandboxParameters.SandboxDenyVnetPeering.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'SandboxNotAllowed'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/6c112d4e-5bc7-47ae-a041-ea2d9dccd749'
				definitionParameters: varPolicySetDefinitionEsEnforceALZSandboxParameters.SandboxNotAllowed.parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
		]
	}
	{
		name: 'Enforce-Backup'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Backup.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'BackupBVault-Immutability'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/2514263b-bc0d-4b06-ac3e-f262c0979018'
				definitionParameters: varPolicySetDefinitionEsEnforceBackupParameters['BackupBVault-Immutability'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*-preview'
			}
			{
				definitionReferenceId: 'BackupBVault-MUA'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/c58e083e-7982-4e24-afdc-be14d312389e'
				definitionParameters: varPolicySetDefinitionEsEnforceBackupParameters['BackupBVault-MUA'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*-preview'
			}
			{
				definitionReferenceId: 'BackupBVault-SoftDelete'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/9798d31d-6028-4dee-8643-46102185c016'
				definitionParameters: varPolicySetDefinitionEsEnforceBackupParameters['BackupBVault-SoftDelete'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*-preview'
			}
			{
				definitionReferenceId: 'BackupRVault-Immutability'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/d6f6f560-14b7-49a4-9fc8-d2c3a9807868'
				definitionParameters: varPolicySetDefinitionEsEnforceBackupParameters['BackupRVault-Immutability'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*-preview'
			}
			{
				definitionReferenceId: 'BackupRVault-MUA'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/c7031eab-0fc0-4cd9-acd0-4497bd66d91a'
				definitionParameters: varPolicySetDefinitionEsEnforceBackupParameters['BackupRVault-MUA'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*-preview'
			}
			{
				definitionReferenceId: 'BackupRVault-SoftDelete'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/31b8092a-36b8-434b-9af7-5ec844364148'
				definitionParameters: varPolicySetDefinitionEsEnforceBackupParameters['BackupRVault-SoftDelete'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*-preview'
			}
		]
	}
	{
		name: 'Enforce-Encryption-CMK_20250218'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Encryption-CMK_20250218.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'ACRCmkDeny'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/5b9159ae-1701-4a6f-9a7a-aa9c8ddd0580'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters.ACRCmkDeny.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'AksCmkDeny'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/7d7be79c-23ba-4033-84dd-45e2a5ccdd67'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters.AksCmkDeny.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'AzureBatchCMKEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/99e9ccd8-3db9-4592-b0d1-14b1715a4d8a'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters.AzureBatchCMKEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'CognitiveServicesCMK'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/67121cc7-ff39-4ab8-b7e3-95b84dab487d'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters.CognitiveServicesCMK.parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'CosmosCMKEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1f905d99-2ab7-462c-a6b0-f709acca6c8f'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters.CosmosCMKEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DataBoxCMKEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/86efb160-8de7-451d-bc08-5d475b0aadae'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters.DataBoxCMKEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Aa-Cmk'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/56a5ee18-2ae6-4810-86f7-18e39ce5629b'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters['Deny-Aa-Cmk'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Adf-Cmk'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/4ec52d6d-beb7-40c4-9a9e-fe753254690e'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters['Deny-Adf-Cmk'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-ADX-Cmk'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/81e74cea-30fd-40d5-802f-d72103c2aaaa'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters['Deny-ADX-Cmk'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Backup-Cmk'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/2e94d99a-8a36-4563-bc77-810d8893b671'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters['Deny-Backup-Cmk'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*-preview'
			}
			{
				definitionReferenceId: 'Deny-BotService-Cmk'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/51522a96-0869-4791-82f3-981000c2c67f'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters['Deny-BotService-Cmk'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-CognitiveSearch-Cmk'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/76a56461-9dc0-40f0-82f5-2453283afa2f'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters['Deny-CognitiveSearch-Cmk'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-ContainerInstance-Cmk'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/0aa61e00-0a01-4a3c-9945-e93cffedf0e6'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters['Deny-ContainerInstance-Cmk'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-EH-Cmk'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/a1ad735a-e96f-45d2-a7b2-9a4932cab7ec'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters['Deny-EH-Cmk'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-EH-Premium-CMK'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-EH-Premium-CMK'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters['Deny-EH-Premium-CMK'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-OsAndDataDisk-Cmk'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/702dd420-7fcc-42c5-afe8-4026edd20fe0'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters['Deny-OsAndDataDisk-Cmk'].parameters
				definitionGroups: []
				definitionVersion: '3.*.*'
			}
			{
				definitionReferenceId: 'Deny-Sb-Cmk'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/295fc8b1-dc9f-4f53-9c61-3f313ceab40a'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters['Deny-Sb-Cmk'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Sql-Managed-Cmk'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/ac01ad65-10e5-46df-bdd9-6b0cad13e1d2'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters['Deny-Sql-Managed-Cmk'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-Storage-Encryption-Cmk'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b5ec538c-daa0-4006-8596-35468b9148e8'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters['Deny-Storage-Encryption-Cmk'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Storage-Queue-Cmk'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/f0e5abd0-2554-4736-b7c0-4ffef23475ef'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters['Deny-Storage-Queue-Cmk'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Storage-Table-Cmk'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/7c322315-e26d-4174-a99e-f49d351b4688'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters['Deny-Storage-Table-Cmk'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'EncryptedVMDisksEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/0961003e-5a0a-4549-abde-af6a37f2724d'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters.EncryptedVMDisksEffect.parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'HealthcareAPIsCMKEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/051cba44-2429-45b9-9649-46cec11c7119'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters.HealthcareAPIsCMKEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'MySQLCMKEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/83cef61d-dbd1-4b20-a4fc-5fbc7da10833'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters.MySQLCMKEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'PostgreSQLCMKEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/18adea5e-f416-4d0f-8aa8-d24321e3e274'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters.PostgreSQLCMKEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'SqlServerTDECMKEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/0a370ff3-6cab-4e85-8995-295fd854c5b8'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters.SqlServerTDECMKEffect.parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'StorageCMKEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/6fac406b-40ca-413b-bf8e-0bf964659c25'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters.StorageCMKEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'StreamAnalyticsCMKEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/87ba29ef-1ab3-4d82-b763-87fcd4f531f7'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters.StreamAnalyticsCMKEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'SynapseWorkspaceCMKEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/f7d52b2d-e161-4dfa-a82b-55e564167385'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters.SynapseWorkspaceCMKEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'WorkspaceCMK'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/ba769a63-b8cc-4b2d-abf6-ac33c7204be8'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters.WorkspaceCMK.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Enforce-Encryption-CMK'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Encryption-CMK.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'ACRCmkDeny'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/5b9159ae-1701-4a6f-9a7a-aa9c8ddd0580'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters.ACRCmkDeny.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'AksCmkDeny'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/7d7be79c-23ba-4033-84dd-45e2a5ccdd67'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters.AksCmkDeny.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'AzureBatchCMKEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/99e9ccd8-3db9-4592-b0d1-14b1715a4d8a'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters.AzureBatchCMKEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'CognitiveServicesCMK'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/67121cc7-ff39-4ab8-b7e3-95b84dab487d'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters.CognitiveServicesCMK.parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'CosmosCMKEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1f905d99-2ab7-462c-a6b0-f709acca6c8f'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters.CosmosCMKEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DataBoxCMKEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/86efb160-8de7-451d-bc08-5d475b0aadae'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters.DataBoxCMKEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Aa-Cmk'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/56a5ee18-2ae6-4810-86f7-18e39ce5629b'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters['Deny-Aa-Cmk'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Adf-Cmk'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/4ec52d6d-beb7-40c4-9a9e-fe753254690e'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters['Deny-Adf-Cmk'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-ADX-Cmk'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/81e74cea-30fd-40d5-802f-d72103c2aaaa'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters['Deny-ADX-Cmk'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Backup-Cmk'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/2e94d99a-8a36-4563-bc77-810d8893b671'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters['Deny-Backup-Cmk'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*-preview'
			}
			{
				definitionReferenceId: 'Deny-BotService-Cmk'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/51522a96-0869-4791-82f3-981000c2c67f'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters['Deny-BotService-Cmk'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-CognitiveSearch-Cmk'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/76a56461-9dc0-40f0-82f5-2453283afa2f'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters['Deny-CognitiveSearch-Cmk'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-ContainerInstance-Cmk'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/0aa61e00-0a01-4a3c-9945-e93cffedf0e6'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters['Deny-ContainerInstance-Cmk'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-EH-Cmk'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/a1ad735a-e96f-45d2-a7b2-9a4932cab7ec'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters['Deny-EH-Cmk'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-EH-Premium-CMK'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-EH-Premium-CMK'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters['Deny-EH-Premium-CMK'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-OsAndDataDisk-Cmk'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/702dd420-7fcc-42c5-afe8-4026edd20fe0'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters['Deny-OsAndDataDisk-Cmk'].parameters
				definitionGroups: []
				definitionVersion: '3.*.*'
			}
			{
				definitionReferenceId: 'Deny-Sb-Cmk'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/295fc8b1-dc9f-4f53-9c61-3f313ceab40a'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters['Deny-Sb-Cmk'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Sql-Managed-Cmk'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/ac01ad65-10e5-46df-bdd9-6b0cad13e1d2'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters['Deny-Sql-Managed-Cmk'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-Storage-Encryption-Cmk'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b5ec538c-daa0-4006-8596-35468b9148e8'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters['Deny-Storage-Encryption-Cmk'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Storage-Queue-Cmk'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/f0e5abd0-2554-4736-b7c0-4ffef23475ef'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters['Deny-Storage-Queue-Cmk'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Storage-Table-Cmk'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/7c322315-e26d-4174-a99e-f49d351b4688'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters['Deny-Storage-Table-Cmk'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'EncryptedVMDisksEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/0961003e-5a0a-4549-abde-af6a37f2724d'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters.EncryptedVMDisksEffect.parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'HealthcareAPIsCMKEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/051cba44-2429-45b9-9649-46cec11c7119'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters.HealthcareAPIsCMKEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'MySQLCMKEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/83cef61d-dbd1-4b20-a4fc-5fbc7da10833'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters.MySQLCMKEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'PostgreSQLCMKEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/18adea5e-f416-4d0f-8aa8-d24321e3e274'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters.PostgreSQLCMKEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'SqlServerTDECMKEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/0a370ff3-6cab-4e85-8995-295fd854c5b8'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters.SqlServerTDECMKEffect.parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'StorageCMKEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/6fac406b-40ca-413b-bf8e-0bf964659c25'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters.StorageCMKEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'StreamAnalyticsCMKEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/87ba29ef-1ab3-4d82-b763-87fcd4f531f7'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters.StreamAnalyticsCMKEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'SynapseWorkspaceCMKEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/f7d52b2d-e161-4dfa-a82b-55e564167385'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters.SynapseWorkspaceCMKEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'WorkspaceCMK'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/ba769a63-b8cc-4b2d-abf6-ac33c7204be8'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptionCMKParameters.WorkspaceCMK.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Enforce-EncryptTransit_20240509'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-EncryptTransit_20240509.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'AKSIngressHttpsOnlyEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1a5b4dca-0b6f-4cf5-907c-56316bc1bf3d'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters.AKSIngressHttpsOnlyEffect.parameters
				definitionGroups: []
				definitionVersion: '8.*.*'
			}
			{
				definitionReferenceId: 'APIAppServiceHttpsEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-AppServiceApiApp-http'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters.APIAppServiceHttpsEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'AppServiceHttpEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Append-AppService-httpsonly'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters.AppServiceHttpEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'AppServiceminTlsVersion'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Append-AppService-latestTLS'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters.AppServiceminTlsVersion.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'ContainerAppsHttpsOnlyEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/0e80e269-43a4-4ae9-b5bc-178126b8a5cb'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters.ContainerAppsHttpsOnlyEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-AppService-Apps-Https'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/a4af4a39-4135-47fb-b175-47fbdf85311d'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters['Deny-AppService-Apps-Https'].parameters
				definitionGroups: []
				definitionVersion: '4.*.*'
			}
			{
				definitionReferenceId: 'Deny-AppService-Slots-Https'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/ae1b9a8c-dfce-4605-bd91-69213b4a26fc'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters['Deny-AppService-Slots-Https'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-AppService-Tls'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/d6545c6b-dd9d-4265-91e6-0b451e2f1c50'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters['Deny-AppService-Tls'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-ContainerApps-Https'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/0e80e269-43a4-4ae9-b5bc-178126b8a5cb'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters['Deny-ContainerApps-Https'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-EH-minTLS'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-EH-minTLS'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters['Deny-EH-minTLS'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-FuncAppSlots-Https'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/5e5dbe3f-2702-4ffc-8b1e-0cae008a5c71'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters['Deny-FuncAppSlots-Https'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-FunctionApp-Https'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/6d555dd1-86f2-4f1c-8ed7-5abae7c6cbab'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters['Deny-FunctionApp-Https'].parameters
				definitionGroups: []
				definitionVersion: '5.*.*'
			}
			{
				definitionReferenceId: 'Deny-LogicApp-Without-Https'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-LogicApps-Without-Https'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters['Deny-LogicApp-Without-Https'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Sql-Db-Tls'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/32e6bbec-16b6-44c2-be37-c5b672d103cf'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters['Deny-Sql-Db-Tls'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-Sql-Managed-Tls-Version'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/a8793640-60f7-487c-b5c3-1d37215905c4'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters['Deny-Sql-Managed-Tls-Version'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Storage-Tls'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/fe83a0eb-a853-422d-aac2-1bffd182c5d0'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters['Deny-Storage-Tls'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Synapse-Tls-Version'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/cb3738a6-82a2-4a18-b87b-15217b9deff4'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters['Deny-Synapse-Tls-Version'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deploy-LogicApp-TLS'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-LogicApp-TLS'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters['Deploy-LogicApp-TLS'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Dine-AppService-Apps-Tls'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/ae44c1d1-0df2-4ca9-98fa-a3d3ae5b409d'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters['Dine-AppService-Apps-Tls'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-AppService-AppSlotTls'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/014664e7-e348-41a3-aeb9-566e4ff6a9df'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters['DINE-AppService-AppSlotTls'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Dine-Function-Apps-Slots-Tls'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/fa3a6357-c6d6-4120-8429-855577ec0063'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters['Dine-Function-Apps-Slots-Tls'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Dine-FunctionApp-Tls'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1f01f1c7-539c-49b5-9ef4-d4ffa37d22e0'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters['Dine-FunctionApp-Tls'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'FunctionLatestTlsEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/f9d614c5-c173-4d56-95a7-b4437057d193'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters.FunctionLatestTlsEffect.parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'FunctionServiceHttpsEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-AppServiceFunctionApp-http'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters.FunctionServiceHttpsEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'MySQLEnableSSLDeployEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-MySQL-sslEnforcement'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters.MySQLEnableSSLDeployEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'MySQLEnableSSLEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-MySql-http'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters.MySQLEnableSSLEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'PostgreSQLEnableSSLDeployEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-PostgreSQL-sslEnforcement'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters.PostgreSQLEnableSSLDeployEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'PostgreSQLEnableSSLEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-PostgreSql-http'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters.PostgreSQLEnableSSLEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'RedisDenyhttps'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-Redis-http'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters.RedisDenyhttps.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'RedisdisableNonSslPort'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Append-Redis-disableNonSslPort'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters.RedisdisableNonSslPort.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'RedisTLSDeployEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Append-Redis-sslEnforcement'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters.RedisTLSDeployEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'SQLManagedInstanceTLSDeployEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-SqlMi-minTLS'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters.SQLManagedInstanceTLSDeployEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'SQLManagedInstanceTLSEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-SqlMi-minTLS'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters.SQLManagedInstanceTLSEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'SQLServerTLSDeployEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-SQL-minTLS'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters.SQLServerTLSDeployEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'SQLServerTLSEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-Sql-minTLS'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters.SQLServerTLSEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'StorageDeployHttpsEnabledEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Storage-sslEnforcement'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters.StorageDeployHttpsEnabledEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'WebAppServiceHttpsEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-AppServiceWebApp-http'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters.WebAppServiceHttpsEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'WebAppServiceLatestTlsEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters.WebAppServiceLatestTlsEffect.parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
		]
	}
	{
		name: 'Enforce-EncryptTransit_20241211'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-EncryptTransit_20241211.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'AKSIngressHttpsOnlyEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1a5b4dca-0b6f-4cf5-907c-56316bc1bf3d'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters.AKSIngressHttpsOnlyEffect.parameters
				definitionGroups: []
				definitionVersion: '8.*.*'
			}
			{
				definitionReferenceId: 'APIAppServiceHttpsEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-AppServiceApiApp-http'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters.APIAppServiceHttpsEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'AppServiceHttpEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Append-AppService-httpsonly'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters.AppServiceHttpEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'AppServiceminTlsVersion'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Append-AppService-latestTLS'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters.AppServiceminTlsVersion.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'ContainerAppsHttpsOnlyEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/0e80e269-43a4-4ae9-b5bc-178126b8a5cb'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters.ContainerAppsHttpsOnlyEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-AppService-Apps-Https'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/a4af4a39-4135-47fb-b175-47fbdf85311d'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters['Deny-AppService-Apps-Https'].parameters
				definitionGroups: []
				definitionVersion: '4.*.*'
			}
			{
				definitionReferenceId: 'Deny-AppService-Slots-Https'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/ae1b9a8c-dfce-4605-bd91-69213b4a26fc'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters['Deny-AppService-Slots-Https'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-AppService-Tls'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/d6545c6b-dd9d-4265-91e6-0b451e2f1c50'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters['Deny-AppService-Tls'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-EH-minTLS'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-EH-minTLS'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters['Deny-EH-minTLS'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-FuncAppSlots-Https'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/5e5dbe3f-2702-4ffc-8b1e-0cae008a5c71'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters['Deny-FuncAppSlots-Https'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-FunctionApp-Https'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/6d555dd1-86f2-4f1c-8ed7-5abae7c6cbab'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters['Deny-FunctionApp-Https'].parameters
				definitionGroups: []
				definitionVersion: '5.*.*'
			}
			{
				definitionReferenceId: 'Deny-LogicApp-Without-Https'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-LogicApps-Without-Https'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters['Deny-LogicApp-Without-Https'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Sql-Db-Tls'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/32e6bbec-16b6-44c2-be37-c5b672d103cf'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters['Deny-Sql-Db-Tls'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-Sql-Managed-Tls-Version'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/a8793640-60f7-487c-b5c3-1d37215905c4'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters['Deny-Sql-Managed-Tls-Version'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Storage-Tls'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/fe83a0eb-a853-422d-aac2-1bffd182c5d0'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters['Deny-Storage-Tls'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Synapse-Tls-Version'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/cb3738a6-82a2-4a18-b87b-15217b9deff4'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters['Deny-Synapse-Tls-Version'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deploy-LogicApp-TLS'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-LogicApp-TLS'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters['Deploy-LogicApp-TLS'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Dine-AppService-Apps-Tls'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/ae44c1d1-0df2-4ca9-98fa-a3d3ae5b409d'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters['Dine-AppService-Apps-Tls'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-AppService-AppSlotTls'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/014664e7-e348-41a3-aeb9-566e4ff6a9df'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters['DINE-AppService-AppSlotTls'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Dine-Function-Apps-Slots-Tls'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/fa3a6357-c6d6-4120-8429-855577ec0063'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters['Dine-Function-Apps-Slots-Tls'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Dine-FunctionApp-Tls'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1f01f1c7-539c-49b5-9ef4-d4ffa37d22e0'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters['Dine-FunctionApp-Tls'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'FunctionLatestTlsEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/f9d614c5-c173-4d56-95a7-b4437057d193'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters.FunctionLatestTlsEffect.parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'FunctionServiceHttpsEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-AppServiceFunctionApp-http'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters.FunctionServiceHttpsEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'MySQLEnableSSLDeployEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-MySQL-sslEnforcement'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters.MySQLEnableSSLDeployEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'MySQLEnableSSLEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-MySql-http'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters.MySQLEnableSSLEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'PostgreSQLEnableSSLDeployEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-PostgreSQL-sslEnforcement'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters.PostgreSQLEnableSSLDeployEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'PostgreSQLEnableSSLEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-PostgreSql-http'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters.PostgreSQLEnableSSLEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'RedisDenyhttps'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-Redis-http'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters.RedisDenyhttps.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'RedisdisableNonSslPort'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Append-Redis-disableNonSslPort'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters.RedisdisableNonSslPort.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'RedisTLSDeployEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Append-Redis-sslEnforcement'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters.RedisTLSDeployEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'SQLManagedInstanceTLSDeployEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-SqlMi-minTLS'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters.SQLManagedInstanceTLSDeployEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'SQLManagedInstanceTLSEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-SqlMi-minTLS'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters.SQLManagedInstanceTLSEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'SQLServerTLSDeployEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-SQL-minTLS'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters.SQLServerTLSDeployEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'SQLServerTLSEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-Sql-minTLS'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters.SQLServerTLSEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'StorageDeployHttpsEnabledEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Storage-sslEnforcement'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters.StorageDeployHttpsEnabledEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'WebAppServiceHttpsEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-AppServiceWebApp-http'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters.WebAppServiceHttpsEffect.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'WebAppServiceLatestTlsEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters.WebAppServiceLatestTlsEffect.parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
		]
	}
	{
		name: 'Enforce-EncryptTransit'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-EncryptTransit.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'AKSIngressHttpsOnlyEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1a5b4dca-0b6f-4cf5-907c-56316bc1bf3d'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.AKSIngressHttpsOnlyEffect.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'APIAppServiceHttpsEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-AppServiceApiApp-http'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.APIAppServiceHttpsEffect.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'AppServiceHttpEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Append-AppService-httpsonly'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.AppServiceHttpEffect.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'AppServiceminTlsVersion'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Append-AppService-latestTLS'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.AppServiceminTlsVersion.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'ContainerAppsHttpsOnlyEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/0e80e269-43a4-4ae9-b5bc-178126b8a5cb'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.ContainerAppsHttpsOnlyEffect.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'FunctionLatestTlsEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/f9d614c5-c173-4d56-95a7-b4437057d193'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.FunctionLatestTlsEffect.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'FunctionServiceHttpsEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-AppServiceFunctionApp-http'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.FunctionServiceHttpsEffect.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'MySQLEnableSSLDeployEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-MySQL-sslEnforcement'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.MySQLEnableSSLDeployEffect.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'MySQLEnableSSLEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-MySql-http'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.MySQLEnableSSLEffect.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'PostgreSQLEnableSSLDeployEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-PostgreSQL-sslEnforcement'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.PostgreSQLEnableSSLDeployEffect.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'PostgreSQLEnableSSLEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-PostgreSql-http'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.PostgreSQLEnableSSLEffect.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'RedisDenyhttps'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-Redis-http'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.RedisDenyhttps.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'RedisdisableNonSslPort'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Append-Redis-disableNonSslPort'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.RedisdisableNonSslPort.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'RedisTLSDeployEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Append-Redis-sslEnforcement'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.RedisTLSDeployEffect.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'SQLManagedInstanceTLSDeployEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-SqlMi-minTLS'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.SQLManagedInstanceTLSDeployEffect.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'SQLManagedInstanceTLSEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-SqlMi-minTLS'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.SQLManagedInstanceTLSEffect.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'SQLServerTLSDeployEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-SQL-minTLS'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.SQLServerTLSDeployEffect.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'SQLServerTLSEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-Sql-minTLS'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.SQLServerTLSEffect.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'StorageDeployHttpsEnabledEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deploy-Storage-sslEnforcement'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.StorageDeployHttpsEnabledEffect.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'StorageHttpsEnabledEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-Storage-minTLS'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.StorageHttpsEnabledEffect.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'WebAppServiceHttpsEffect'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-AppServiceWebApp-http'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.WebAppServiceHttpsEffect.parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'WebAppServiceLatestTlsEffect'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/f0e6e85b-9b9f-4a4b-b67b-f730d42f1b0b'
				definitionParameters: varPolicySetDefinitionEsEnforceEncryptTransitParameters.WebAppServiceLatestTlsEffect.parameters
				definitionGroups: []
				definitionVersion: ''
			}
		]
	}
	{
		name: 'Enforce-Guardrails-APIM'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-APIM.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'Deny-Api-subscription-scope'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/3aa03346-d8c5-4994-a5bc-7652c2a2aef1'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAPIMParameters['Deny-Api-subscription-scope'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Apim-Authn'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/c15dcc82-b93c-4dcb-9332-fbf121685b54'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAPIMParameters['Deny-Apim-Authn'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Apim-Cert-Validation'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/92bb331d-ac71-416a-8c91-02f2cb734ce4'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAPIMParameters['Deny-Apim-Cert-Validation'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Apim-Direct-Endpoint'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b741306c-968e-4b67-b916-5675e5c709f4'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAPIMParameters['Deny-Apim-Direct-Endpoint'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Apim-Protocols'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/ee7495e7-3ba7-40b6-bfee-c29e22cc75d4'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAPIMParameters['Deny-Apim-Protocols'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-Apim-Sku-Vnet'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/73ef9241-5d81-4cd4-b483-8443d1730fe5'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAPIMParameters['Deny-Apim-Sku-Vnet'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-APIM-TLS'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-APIM-TLS'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAPIMParameters['Deny-APIM-TLS'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Apim-Version'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/549814b6-3212-4203-bdc8-1548d342fb67'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAPIMParameters['Deny-Apim-Version'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Apim-without-Kv'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/f1cc7827-022c-473e-836e-5a51cae0b249'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAPIMParameters['Deny-Apim-without-Kv'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Apim-without-Vnet'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/ef619a2c-cc4d-4d03-b2ba-8c94a834d85b'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAPIMParameters['Deny-Apim-without-Vnet'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Dine-Apim-Public-NetworkAccess'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/7ca8c8ac-3a6e-493d-99ba-c5fa35347ff2'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAPIMParameters['Dine-Apim-Public-NetworkAccess'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Enforce-Guardrails-AppServices'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-AppServices.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'Deny-AppServ-FtpAuth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/572e342c-c920-4ef5-be2e-1ed3c6a51dc5'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAppServicesParameters['Deny-AppServ-FtpAuth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-AppServ-Routing'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/5747353b-1ca9-42c1-a4dd-b874b894f3d4'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAppServicesParameters['Deny-AppServ-Routing'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-AppServ-SkuPl'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/546fe8d2-368d-4029-a418-6af48a7f61e5'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAppServicesParameters['Deny-AppServ-SkuPl'].parameters
				definitionGroups: []
				definitionVersion: '4.*.*'
			}
			{
				definitionReferenceId: 'Deny-AppService-Byoc'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-AppService-without-BYOC'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAppServicesParameters['Deny-AppService-Byoc'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-AppService-Latest-Version'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/eb4d34ab-0929-491c-bbf3-61e13da19f9a'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAppServicesParameters['Deny-AppService-Latest-Version'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-AppService-Rfc'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/f5c0bfb3-acea-47b1-b477-b0edcdf6edc1'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAppServicesParameters['Deny-AppService-Rfc'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-AppService-Slots-Remote-Debugging'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/cca5adfe-626b-4cc6-8522-f5b6ed2391bd'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAppServicesParameters['Deny-AppService-Slots-Remote-Debugging'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-AppService-Vnet-Routing'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/801543d1-1953-4a90-b8b0-8cf6d41473a5'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAppServicesParameters['Deny-AppService-Vnet-Routing'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-AppServiceApps-Rfc'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/a691eacb-474d-47e4-b287-b4813ca44222'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAppServicesParameters['Deny-AppServiceApps-Rfc'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Dine-AppService-Apps-Remote-Debugging'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/a5e3fe8f-f6cd-4f1d-bbf6-c749754a724b'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAppServicesParameters['Dine-AppService-Apps-Remote-Debugging'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-AppService-Debugging'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/25a5046c-c423-4805-9235-e844ae9ef49b'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAppServicesParameters['DINE-AppService-Debugging'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-AppService-LocalAuth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/2c034a29-2a5f-4857-b120-f800fe5549ae'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAppServicesParameters['DINE-AppService-LocalAuth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-AppService-ScmAuth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/5e97b776-f380-4722-a9a3-e7f0be029e79'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAppServicesParameters['DINE-AppService-ScmAuth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'DINE-FuncApp-Debugging'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/70adbb40-e092-42d5-a6f8-71c540a5efdb'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAppServicesParameters['DINE-FuncApp-Debugging'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-AppService-App-Public-Network-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/c6c3e00e-d414-4ca4-914f-406699bb8eee'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAppServicesParameters['Modify-AppService-App-Public-Network-Access'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-AppService-Apps-Public-Network-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/2374605e-3e0b-492b-9046-229af202562c'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAppServicesParameters['Modify-AppService-Apps-Public-Network-Access'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-AppService-Https'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/0f98368e-36bc-4716-8ac2-8f8067203b63'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAppServicesParameters['Modify-AppService-Https'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Modify-Function-Apps-Slots-Https'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/08cf2974-d178-48a0-b26d-f6b8e555748b'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAppServicesParameters['Modify-Function-Apps-Slots-Https'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Modify-Function-Apps-Slots-Public-Network-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/242222f3-4985-4e99-b5ef-086d6a6cb01c'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAppServicesParameters['Modify-Function-Apps-Slots-Public-Network-Access'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Enforce-Guardrails-Automation'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-Automation.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'Deny-Aa-Local-Auth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/48c5f1cb-14ad-4797-8e3b-f78ab3f8d700'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAutomationParameters['Deny-Aa-Local-Auth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Aa-Managed-Identity'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/dea83a72-443c-4292-83d5-54a2f98749c0'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAutomationParameters['Deny-Aa-Managed-Identity'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Aa-Variables-Encrypt'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/3657f5a0-770e-44a3-b44e-9431ba1e9735'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAutomationParameters['Deny-Aa-Variables-Encrypt'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Windows-Vm-HotPatch'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/6d02d2f7-e38b-4bdc-96f3-adc0a8726abc'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAutomationParameters['Deny-Windows-Vm-HotPatch'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-Aa-Local-Auth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/30d1d58e-8f96-47a5-8564-499a3f3cca81'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAutomationParameters['Modify-Aa-Local-Auth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-Aa-Public-Network-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/23b36a7c-9d26-4288-a8fd-c1d2fa284d8c'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsAutomationParameters['Modify-Aa-Public-Network-Access'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Enforce-Guardrails-BotService'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-BotService.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'Audit-BotService-Private-Link'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/ad5621d6-a877-4407-aa93-a950b428315e'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsBotServiceParameters['Audit-BotService-Private-Link'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-BotService-Isolated-Mode'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/52152f42-0dda-40d9-976e-abb1acdd611e'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsBotServiceParameters['Deny-BotService-Isolated-Mode'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-BotService-Local-Auth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/ffea632e-4e3a-4424-bf78-10e179bb2e1a'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsBotServiceParameters['Deny-BotService-Local-Auth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-BotService-Valid-Uri'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/6164527b-e1ee-4882-8673-572f425f5e0a'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsBotServiceParameters['Deny-BotService-Valid-Uri'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Enforce-Guardrails-CognitiveServices'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-CognitiveServices.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'Aine-Cognitive-Services-Resource-Logs'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b4330a05-a843-4bc8-bf9a-cacce50c67f4'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsCognitiveServicesParameters['Aine-Cognitive-Services-Resource-Logs'].parameters
				definitionGroups: []
				definitionVersion: '5.*.*'
			}
			{
				definitionReferenceId: 'Deny-Cognitive-Services-Customer-Storage'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/46aa9b05-0e60-4eae-a88b-1e9d374fa515'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsCognitiveServicesParameters['Deny-Cognitive-Services-Customer-Storage'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-Cognitive-Services-Managed-Identity'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/fe3fd216-4f83-4fc1-8984-2bbec80a3418'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsCognitiveServicesParameters['Deny-Cognitive-Services-Managed-Identity'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-CognitiveSearch-SKU'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/a049bf77-880b-470f-ba6d-9f21c530cf83'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsCognitiveServicesParameters['Deny-CognitiveSearch-SKU'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-CongitiveSearch-LocalAuth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/6300012e-e9a4-4649-b41f-a85f5c43be91'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsCognitiveServicesParameters['Deny-CongitiveSearch-LocalAuth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-Cognitive-Services-Local-Auth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/14de9e63-1b31-492e-a5a3-c3f7fd57f555'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsCognitiveServicesParameters['Modify-Cognitive-Services-Local-Auth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-Cognitive-Services-Public-Network-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/47ba1dd7-28d9-4b07-a8d5-9813bed64e0c'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsCognitiveServicesParameters['Modify-Cognitive-Services-Public-Network-Access'].parameters
				definitionGroups: []
				definitionVersion: '3.*.*'
			}
			{
				definitionReferenceId: 'Modify-CogntiveSearch-LocalAuth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/4eb216f2-9dba-4979-86e6-5d7e63ce3b75'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsCognitiveServicesParameters['Modify-CogntiveSearch-LocalAuth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-CogntiveSearch-PublicEndpoint'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/9cee519f-d9c1-4fd9-9f79-24ec3449ed30'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsCognitiveServicesParameters['Modify-CogntiveSearch-PublicEndpoint'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Enforce-Guardrails-Compute'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-Compute.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'Deny-Disk-Double-Encryption'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/ca91455f-eace-4f96-be59-e6e2c35b4816'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsComputeParameters['Deny-Disk-Double-Encryption'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-VmAndVmss-Encryption-Host'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/fc4d8e41-e223-45ea-9bf5-eada37891d87'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsComputeParameters['Deny-VmAndVmss-Encryption-Host'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Enforce-Guardrails-ContainerApps'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-ContainerApps.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'Deny-ContainerApp-Vnet-Injection'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/8b346db6-85af-419b-8557-92cee2c0f9bb'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsContainerAppsParameters['Deny-ContainerApp-Vnet-Injection'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-ContainerApps-Managed-Identity'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b874ab2d-72dd-47f1-8cb5-4a306478a4e7'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsContainerAppsParameters['Deny-ContainerApps-Managed-Identity'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Enforce-Guardrails-ContainerInstance'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-ContainerInstance.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'Deny-ContainerInstance-Vnet'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/8af8f826-edcb-4178-b35f-851ea6fea615'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsContainerInstanceParameters['Deny-ContainerInstance-Vnet'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
		]
	}
	{
		name: 'Enforce-Guardrails-ContainerRegistry'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-ContainerRegistry.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'Deny-ContainerRegistry-Anonymous-Auth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/9f2dea28-e834-476c-99c5-3507b4728395'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsContainerRegistryParameters['Deny-ContainerRegistry-Anonymous-Auth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-ContainerRegistry-Arm-Audience'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/42781ec6-6127-4c30-bdfa-fb423a0047d3'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsContainerRegistryParameters['Deny-ContainerRegistry-Arm-Audience'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-ContainerRegistry-Exports'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/524b0254-c285-4903-bee6-bb8126cde579'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsContainerRegistryParameters['Deny-ContainerRegistry-Exports'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-ContainerRegistry-Local-Auth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/dc921057-6b28-4fbe-9b83-f7bec05db6c2'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsContainerRegistryParameters['Deny-ContainerRegistry-Local-Auth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-ContainerRegistry-Repo-Token'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/ff05e24e-195c-447e-b322-5e90c9f9f366'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsContainerRegistryParameters['Deny-ContainerRegistry-Repo-Token'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-ContainerRegistry-Sku-PrivateLink'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/bd560fc0-3c69-498a-ae9f-aa8eb7de0e13'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsContainerRegistryParameters['Deny-ContainerRegistry-Sku-PrivateLink'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-ContainerRegistry-Unrestricted-Network-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/d0793b48-0edc-4296-a390-4c75d1bdfd71'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsContainerRegistryParameters['Deny-ContainerRegistry-Unrestricted-Network-Access'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Modify-ContainerRegistry-Anonymous-Auth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/cced2946-b08a-44fe-9fd9-e4ed8a779897'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsContainerRegistryParameters['Modify-ContainerRegistry-Anonymous-Auth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-ContainerRegistry-Arm-Audience'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/785596ed-054f-41bc-aaec-7f3d0ba05725'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsContainerRegistryParameters['Modify-ContainerRegistry-Arm-Audience'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-ContainerRegistry-Local-Auth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/79fdfe03-ffcb-4e55-b4d0-b925b8241759'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsContainerRegistryParameters['Modify-ContainerRegistry-Local-Auth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-ContainerRegistry-Public-Network-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/a3701552-92ea-433e-9d17-33b7f1208fc9'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsContainerRegistryParameters['Modify-ContainerRegistry-Public-Network-Access'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-ContainerRegistry-Repo-Token'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/a9b426fe-8856-4945-8600-18c5dd1cca2a'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsContainerRegistryParameters['Modify-ContainerRegistry-Repo-Token'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Enforce-Guardrails-CosmosDb'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-CosmosDb.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'Append-CosmosDb-Metadata'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/4750c32b-89c0-46af-bfcb-2e4541a818d5'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsCosmosDbParameters['Append-CosmosDb-Metadata'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-CosmosDb-Fw-Rules'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/862e97cf-49fc-4a5c-9de4-40d4e2e7c8eb'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsCosmosDbParameters['Deny-CosmosDb-Fw-Rules'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-CosmosDb-Local-Auth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/5450f5bd-9c72-4390-a9c4-a7aba4edfdd2'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsCosmosDbParameters['Deny-CosmosDb-Local-Auth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Dine-CosmosDb-Atp'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b5f04e03-92a3-4b09-9410-2cc5e5047656'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsCosmosDbParameters['Dine-CosmosDb-Atp'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-CosmosDb-Local-Auth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/dc2d41d1-4ab1-4666-a3e1-3d51c43e0049'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsCosmosDbParameters['Modify-CosmosDb-Local-Auth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-CosmosDb-Public-Network-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/da69ba51-aaf1-41e5-8651-607cd0b37088'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsCosmosDbParameters['Modify-CosmosDb-Public-Network-Access'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Enforce-Guardrails-DataExplorer'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-DataExplorer.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'Deny-ADX-Double-Encryption'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/ec068d99-e9c7-401f-8cef-5bdde4e6ccf1'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsDataExplorerParameters['Deny-ADX-Double-Encryption'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-ADX-Encryption'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/f4b53539-8df9-40e4-86c6-6b607703bd4e'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsDataExplorerParameters['Deny-ADX-Encryption'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-ADX-Sku-without-PL-Support'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1fec9658-933f-4b3e-bc95-913ed22d012b'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsDataExplorerParameters['Deny-ADX-Sku-without-PL-Support'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-ADX-Public-Network-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/7b32f193-cb28-4e15-9a98-b9556db0bafa'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsDataExplorerParameters['Modify-ADX-Public-Network-Access'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Enforce-Guardrails-DataFactory'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-DataFactory.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'Deny-Adf-Git'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/77d40665-3120-4348-b539-3192ec808307'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsDataFactoryParameters['Deny-Adf-Git'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Adf-Linked-Service-Key-Vault'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/127ef6d7-242f-43b3-9eef-947faf1725d0'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsDataFactoryParameters['Deny-Adf-Linked-Service-Key-Vault'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Adf-Managed-Identity'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/f78ccdb4-7bf4-4106-8647-270491d2978a'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsDataFactoryParameters['Deny-Adf-Managed-Identity'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-Adf-Sql-Integration'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/0088bc63-6dee-4a9c-9d29-91cfdc848952'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsDataFactoryParameters['Deny-Adf-Sql-Integration'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Modify-Adf-Public-Network-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/08b1442b-7789-4130-8506-4f99a97226a7'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsDataFactoryParameters['Modify-Adf-Public-Network-Access'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Enforce-Guardrails-EventGrid'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-EventGrid.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'Deny-EventGrid-Local-Auth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/8bfadddb-ee1c-4639-8911-a38cb8e0b3bd'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsEventGridParameters['Deny-EventGrid-Local-Auth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-EventGrid-Partner-Namespace-Local-Auth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/8632b003-3545-4b29-85e6-b2b96773df1e'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsEventGridParameters['Deny-EventGrid-Partner-Namespace-Local-Auth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-EventGrid-Topic-Local-Auth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/ae9fb87f-8a17-4428-94a4-8135d431055c'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsEventGridParameters['Deny-EventGrid-Topic-Local-Auth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-EventGrid-Domain-Local-Auth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/8ac2748f-3bf1-4c02-a3b6-92ae68cf75b1'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsEventGridParameters['Modify-EventGrid-Domain-Local-Auth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-EventGrid-Domain-Public-Network-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/898e9824-104c-4965-8e0e-5197588fa5d4'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsEventGridParameters['Modify-EventGrid-Domain-Public-Network-Access'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-EventGrid-Partner-Namespace-Local-Auth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/2dd0e8b9-4289-4bb0-b813-1883298e9924'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsEventGridParameters['Modify-EventGrid-Partner-Namespace-Local-Auth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-EventGrid-Topic-Local-Auth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1c8144d9-746a-4501-b08c-093c8d29ad04'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsEventGridParameters['Modify-EventGrid-Topic-Local-Auth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-EventGrid-Topic-Public-Network-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/36ea4b4b-0f7f-4a54-89fa-ab18f555a172'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsEventGridParameters['Modify-EventGrid-Topic-Public-Network-Access'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Enforce-Guardrails-EventHub'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-EventHub.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'Deny-EH-Auth-Rules'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b278e460-7cfc-4451-8294-cccc40a940d7'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsEventHubParameters['Deny-EH-Auth-Rules'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-EH-Double-Encryption'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/836cd60e-87f3-4e6a-a27c-29d687f01a4c'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsEventHubParameters['Deny-EH-Double-Encryption'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-EH-Local-Auth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/5d4e3c65-4873-47be-94f3-6f8b953a3598'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsEventHubParameters['Deny-EH-Local-Auth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-EH-Local-Auth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/57f35901-8389-40bb-ac49-3ba4f86d889d'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsEventHubParameters['Modify-EH-Local-Auth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Enforce-Guardrails-KeyVault-Sup'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-KeyVault-Sup.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'Modify-KV-Fw'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/ac673a9a-f77d-4846-b2d8-a57f8e1c01dc'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultSupParameters['Modify-KV-Fw'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-KV-PublicNetworkAccess'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/84d327c3-164a-4685-b453-900478614456'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultSupParameters['Modify-KV-PublicNetworkAccess'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*-preview'
			}
		]
	}
	{
		name: 'Enforce-Guardrails-KeyVault'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-KeyVault.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'Deny-keyVaultManagedHsm-RSA-Keys-without-MinKeySize'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/86810a98-8e91-4a44-8386-ec66d0de5d57'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters['Deny-keyVaultManagedHsm-RSA-Keys-without-MinKeySize'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*-preview'
			}
			{
				definitionReferenceId: 'Deny-Kv-Cert-Expiration-Within-Specific-Number-Days'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/f772fb64-8e40-40ad-87bc-7706e1949427'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters['Deny-Kv-Cert-Expiration-Within-Specific-Number-Days'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-KV-Cert-Period'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/0a075868-4c26-42ef-914c-5bc007359560'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters['Deny-KV-Cert-Period'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-KV-Cryptographic-Type'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/75c4f823-d65c-4f29-a733-01d0077fdbcb'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters['Deny-KV-Cryptographic-Type'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-KV-Curve-Names'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/ff25f3c8-b739-4538-9d07-3d6d25cfb255'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters['Deny-KV-Curve-Names'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-KV-Elliptic-Curve'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/bd78111f-4953-4367-9fd5-7e08808b54bf'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters['Deny-KV-Elliptic-Curve'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-KV-Hms-Key-Expire'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1d478a74-21ba-4b9f-9d8f-8e6fced0eec5'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters['Deny-KV-Hms-Key-Expire'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*-preview'
			}
			{
				definitionReferenceId: 'Deny-KV-Hms-PurgeProtection'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/c39ba22d-4428-4149-b981-70acb31fc383'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters['Deny-KV-Hms-PurgeProtection'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Kv-Hsm-Curve-Names'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/e58fd0c1-feac-4d12-92db-0a7e9421f53e'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters['Deny-Kv-Hsm-Curve-Names'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*-preview'
			}
			{
				definitionReferenceId: 'Deny-Kv-Hsm-MinimumDays-Before-Expiration'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/ad27588c-0198-4c84-81ef-08efd0274653'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters['Deny-Kv-Hsm-MinimumDays-Before-Expiration'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*-preview'
			}
			{
				definitionReferenceId: 'Deny-Kv-Integrated-Ca'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/8e826246-c976-48f6-b03e-619bb92b3d82'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters['Deny-Kv-Integrated-Ca'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-KV-Key-Active'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/c26e4b24-cf98-4c67-b48b-5a25c4c69eb9'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters['Deny-KV-Key-Active'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-KV-Key-Types'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1151cede-290b-4ba0-8b38-0ad145ac888f'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters['Deny-KV-Key-Types'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-KV-Keys-Expire'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/49a22571-d204-4c91-a7b6-09b1a586fbc9'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters['Deny-KV-Keys-Expire'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Kv-Non-Integrated-Ca'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/a22f4a40-01d3-4c7d-8071-da157eeff341'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters['Deny-Kv-Non-Integrated-Ca'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-KV-RSA-Keys-without-MinCertSize'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/cee51871-e572-4576-855c-047c820360f0'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters['Deny-KV-RSA-Keys-without-MinCertSize'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-KV-RSA-Keys-without-MinKeySize'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/82067dbb-e53b-4e06-b631-546d197452d9'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters['Deny-KV-RSA-Keys-without-MinKeySize'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-KV-Secret-ActiveDays'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/e8d99835-8a06-45ae-a8e0-87a91941ccfe'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters['Deny-KV-Secret-ActiveDays'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Kv-Secret-Content-Type'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/75262d3e-ba4a-4f43-85f8-9f72c090e5e3'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters['Deny-Kv-Secret-Content-Type'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-KV-Secrets-ValidityDays'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/342e8053-e12e-4c44-be01-c3c2f318400f'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters['Deny-KV-Secrets-ValidityDays'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-KV-without-ArmRbac'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/12d4fa5e-1f9f-4c21-97a9-b99b3c6611b5'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters['Deny-KV-without-ArmRbac'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'KvCertLifetime'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/12ef42cb-9903-4e39-9c26-422d29570417'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters.KvCertLifetime.parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'KvFirewallEnabled'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/55615ac9-af46-4a59-874e-391cc3dfb490'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters.KvFirewallEnabled.parameters
				definitionGroups: []
				definitionVersion: '3.*.*'
			}
			{
				definitionReferenceId: 'KvKeysExpire'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/152b15f7-8e1f-4c1f-ab71-8c010ba5dbc0'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters.KvKeysExpire.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'KvKeysLifetime'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/5ff38825-c5d8-47c5-b70e-069a21955146'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters.KvKeysLifetime.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'KvPurgeProtection'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/0b60c0b2-2dc2-4e1c-b5c9-abbed971de53'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters.KvPurgeProtection.parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'KvSecretsExpire'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/98728c90-32c7-4049-8429-847dc0f4fe37'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters.KvSecretsExpire.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'KvSecretsLifetime'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b0eb591a-5e70-4534-a8bf-04b9c489584a'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters.KvSecretsLifetime.parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'KvSoftDelete'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1e66c121-a66a-4b1f-9b83-0fd99bf0fc2d'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters.KvSoftDelete.parameters
				definitionGroups: []
				definitionVersion: '3.*.*'
			}
		]
	}
	{
		name: 'Enforce-Guardrails-Kubernetes'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-Kubernetes.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'Deny-Aks-Allowed-Capabilities'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/c26596ff-4d70-4e6a-9a30-c2506bd2f80c'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKubernetesParameters['Deny-Aks-Allowed-Capabilities'].parameters
				definitionGroups: []
				definitionVersion: '6.*.*'
			}
			{
				definitionReferenceId: 'Deny-Aks-Cni'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/46238e2f-3f6f-4589-9f3f-77bed4116e67'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKubernetesParameters['Deny-Aks-Cni'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Aks-Default-Namespace'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/9f061a12-e40d-4183-a00e-171812443373'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKubernetesParameters['Deny-Aks-Default-Namespace'].parameters
				definitionGroups: []
				definitionVersion: '4.*.*'
			}
			{
				definitionReferenceId: 'Deny-Aks-Internal-Lb'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/3fc4dc25-5baf-40d8-9b05-7fe74c1bc64e'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKubernetesParameters['Deny-Aks-Internal-Lb'].parameters
				definitionGroups: []
				definitionVersion: '8.*.*'
			}
			{
				definitionReferenceId: 'Deny-Aks-Kms'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/dbbdc317-9734-4dd8-9074-993b29c69008'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKubernetesParameters['Deny-Aks-Kms'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Aks-Local-Auth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/993c2fcd-2b29-49d2-9eb0-df2c3a730c32'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKubernetesParameters['Deny-Aks-Local-Auth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Aks-Naked-Pods'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/65280eef-c8b4-425e-9aec-af55e55bf581'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKubernetesParameters['Deny-Aks-Naked-Pods'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-Aks-Priv-Containers'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/95edb821-ddaf-4404-9732-666045e056b4'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKubernetesParameters['Deny-Aks-Priv-Containers'].parameters
				definitionGroups: []
				definitionVersion: '9.*.*'
			}
			{
				definitionReferenceId: 'Deny-Aks-Priv-Escalation'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1c6e92c9-99f0-4e55-9cf2-0c234dc48f99'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKubernetesParameters['Deny-Aks-Priv-Escalation'].parameters
				definitionGroups: []
				definitionVersion: '7.*.*'
			}
			{
				definitionReferenceId: 'Deny-Aks-Private-Cluster'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/040732e8-d947-40b8-95d6-854c95024bf8'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKubernetesParameters['Deny-Aks-Private-Cluster'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Aks-ReadinessOrLiveness-Probes'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/b1a9997f-2883-4f12-bdff-2280f99b5915'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKubernetesParameters['Deny-Aks-ReadinessOrLiveness-Probes'].parameters
				definitionGroups: []
				definitionVersion: '3.*.*'
			}
			{
				definitionReferenceId: 'Deny-Aks-Shared-Host-Process-Namespace'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/47a1ee2f-2a2a-4576-bf2a-e0e36709c2b8'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKubernetesParameters['Deny-Aks-Shared-Host-Process-Namespace'].parameters
				definitionGroups: []
				definitionVersion: '5.*.*'
			}
			{
				definitionReferenceId: 'Deny-Aks-Temp-Disk-Encryption'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/41425d9f-d1a5-499a-9932-f8ed8453932c'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKubernetesParameters['Deny-Aks-Temp-Disk-Encryption'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Aks-Windows-Container-Administrator'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/5485eac0-7e8f-4964-998b-a44f4f0c1e75'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKubernetesParameters['Deny-Aks-Windows-Container-Administrator'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Dine-Aks-Command-Invoke'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1b708b0a-3380-40e9-8b79-821f9fa224cc'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKubernetesParameters['Dine-Aks-Command-Invoke'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Dine-Aks-Policy'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/a8eff44f-8c92-45c3-a3fb-9880802d67a7'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsKubernetesParameters['Dine-Aks-Policy'].parameters
				definitionGroups: []
				definitionVersion: '4.*.*'
			}
		]
	}
	{
		name: 'Enforce-Guardrails-MachineLearning'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-MachineLearning.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'Aine-ML-Resource-Logs'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/afe0c3be-ba3b-4544-ba52-0c99672a8ad6'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsMachineLearningParameters['Aine-ML-Resource-Logs'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Audit-ML-Private-Link'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/45e05259-1eb5-4f70-9574-baf73e9d219b'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsMachineLearningParameters['Audit-ML-Private-Link'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Audit-ML-Virtual-Network'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/7804b5c7-01dc-4723-969b-ae300cc07ff1'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsMachineLearningParameters['Audit-ML-Virtual-Network'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-ML-Allowed-Module'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/53c70b02-63dd-11ea-bc55-0242ac130003'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsMachineLearningParameters['Deny-ML-Allowed-Module'].parameters
				definitionGroups: []
				definitionVersion: '6.*.*-preview'
			}
			{
				definitionReferenceId: 'Deny-ML-Allowed-Python'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/77eeea86-7e81-4a7d-9067-de844d096752'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsMachineLearningParameters['Deny-ML-Allowed-Python'].parameters
				definitionGroups: []
				definitionVersion: '5.*.*-preview'
			}
			{
				definitionReferenceId: 'Deny-ML-Allowed-Registries'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/5853517a-63de-11ea-bc55-0242ac130003'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsMachineLearningParameters['Deny-ML-Allowed-Registries'].parameters
				definitionGroups: []
				definitionVersion: '6.*.*-preview'
			}
			{
				definitionReferenceId: 'Deny-ML-Allowed-Registry-Deploy'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/19539b54-c61e-4196-9a38-67598701be90'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsMachineLearningParameters['Deny-ML-Allowed-Registry-Deploy'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*-preview'
			}
			{
				definitionReferenceId: 'Deny-ML-Idle-Shutdown'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/679ddf89-ab8f-48a5-9029-e76054077449'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsMachineLearningParameters['Deny-ML-Idle-Shutdown'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-ML-Legacy-Mode'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/e413671a-dd10-4cc1-a943-45b598596cb7'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsMachineLearningParameters['Deny-ML-Legacy-Mode'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-ML-Local-Auth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/e96a9a5f-07ca-471b-9bc5-6a0f33cbd68f'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsMachineLearningParameters['Deny-ML-Local-Auth'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-ML-Outdated-Os'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/f110a506-2dcb-422e-bcea-d533fc8c35e2'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsMachineLearningParameters['Deny-ML-Outdated-Os'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-ML-User-Assigned-Identity'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/5f0c7d88-c7de-45b8-ac49-db49e72eaa78'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsMachineLearningParameters['Deny-ML-User-Assigned-Identity'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-ML-Local-Auth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/a6f9a2d0-cff7-4855-83ad-4cd750666512'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsMachineLearningParameters['Modify-ML-Local-Auth'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Modify-ML-Public-Network-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/a10ee784-7409-4941-b091-663697637c0f'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsMachineLearningParameters['Modify-ML-Public-Network-Access'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Enforce-Guardrails-MySQL'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-MySQL.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'Deny-MySql-Infra-Encryption'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/3a58212a-c829-4f13-9872-6371df2fd0b4'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsMySQLParameters['Deny-MySql-Infra-Encryption'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Dine-MySql-Adv-Threat-Protection'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/80ed5239-4122-41ed-b54a-6f1fa7552816'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsMySQLParameters['Dine-MySql-Adv-Threat-Protection'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Enforce-Guardrails-Network'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-Network.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'Deny-AppGw-Without-Tls'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-AppGw-Without-Tls'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsNetworkParameters['Deny-AppGw-Without-Tls'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-AppGw-Without-Waf'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/564feb30-bf6a-4854-b4bb-0d2d2d1e6c66'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsNetworkParameters['Deny-AppGw-Without-Waf'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-FW-AllIDPSS'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/610b6183-5f00-4d68-86d2-4ab4cb3a67a5'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsNetworkParameters['Deny-FW-AllIDPSS'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-FW-EmpIDPSBypass'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/f516dc7a-4543-4d40-aad6-98f76a706b50'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsNetworkParameters['Deny-FW-EmpIDPSBypass'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-FW-TLS-AllApp'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/a58ac66d-92cb-409c-94b8-8e48d7a96596'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsNetworkParameters['Deny-FW-TLS-AllApp'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-FW-TLS-Inspection'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/711c24bb-7f18-4578-b192-81a6161e1f17'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsNetworkParameters['Deny-FW-TLS-Inspection'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Ip-Forwarding'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/88c0b9da-ce96-4b03-9635-f29a937e2900'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsNetworkParameters['Deny-Ip-Forwarding'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Mgmt-From-Internet'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-MgmtPorts-From-Internet'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsNetworkParameters['Deny-Mgmt-From-Internet'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Nsg-GW-subnet'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/35f9c03a-cc27-418e-9c0c-539ff999d010'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsNetworkParameters['Deny-Nsg-GW-subnet'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Subnet-with-Service-Endpoints'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-Service-Endpoints'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsNetworkParameters['Deny-Subnet-with-Service-Endpoints'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Subnet-Without-NSG'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-Subnet-Without-Nsg'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsNetworkParameters['Deny-Subnet-Without-NSG'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Subnet-Without-Udr'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-Subnet-Without-Udr'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsNetworkParameters['Deny-Subnet-Without-Udr'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-vNic-Pip'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/83a86a26-fd1f-447c-b59d-e51f44264114'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsNetworkParameters['Deny-vNic-Pip'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-VPN-AzureAD'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/21a6bc25-125e-4d13-b82d-2e19b7208ab7'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsNetworkParameters['Deny-VPN-AzureAD'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Waf-Afd-Enabled'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/055aa869-bc98-4af8-bafc-23f1ab6ffe2c'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsNetworkParameters['Deny-Waf-Afd-Enabled'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Waf-AppGw-mode'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/12430be1-6cc8-4527-a9a8-e3d38f250096'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsNetworkParameters['Deny-Waf-AppGw-mode'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Waf-Fw-rules'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/632d3993-e2c0-44ea-a7db-2eca131f356d'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsNetworkParameters['Deny-Waf-Fw-rules'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Waf-IDPS'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/6484db87-a62d-4327-9f07-80a2cbdf333a'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsNetworkParameters['Deny-Waf-IDPS'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Waf-mode'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/425bea59-a659-4cbb-8d31-34499bd030b8'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsNetworkParameters['Deny-Waf-mode'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-Nsg'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Modify-NSG'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsNetworkParameters['Modify-Nsg'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-Udr'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Modify-UDR'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsNetworkParameters['Modify-Udr'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-vNet-DDoS'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/94de2ad3-e0c1-4caf-ad78-5d47bbc83d3d'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsNetworkParameters['Modify-vNet-DDoS'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Enforce-Guardrails-OpenAI'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-OpenAI.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'Aine-AzureAI-Diag-Settings'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/1b4d1c4e-934c-4703-944c-27c82c06bebb'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsOpenAIParameters['Aine-AzureAI-Diag-Settings'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Audit-AzureAI-Private-Link'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/d6759c02-b87f-42b7-892e-71b3f471d782'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsOpenAIParameters['Audit-AzureAI-Private-Link'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-AzureAI-Network-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/037eea7a-bd0a-46c5-9a66-03aea78705d3'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsOpenAIParameters['Deny-AzureAI-Network-Access'].parameters
				definitionGroups: []
				definitionVersion: '3.*.*'
			}
			{
				definitionReferenceId: 'Deny-Cognitive-Services-Cust-Storage'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/46aa9b05-0e60-4eae-a88b-1e9d374fa515'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsOpenAIParameters['Deny-Cognitive-Services-Cust-Storage'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Deny-Cognitive-Services-Local-Auth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/71ef260a-8f18-47b7-abcb-62d0673d94dc'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsOpenAIParameters['Deny-Cognitive-Services-Local-Auth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Cognitive-Services-Managed-Identity'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/fe3fd216-4f83-4fc1-8984-2bbec80a3418'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsOpenAIParameters['Deny-Cognitive-Services-Managed-Identity'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-OpenAi-NetworkAcls'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-CognitiveServices-NetworkAcls'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsOpenAIParameters['Deny-OpenAi-NetworkAcls'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-OpenAi-OutboundNetworkAccess'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-CognitiveServices-RestrictOutboundNetworkAccess'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsOpenAIParameters['Deny-OpenAi-OutboundNetworkAccess'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Dine-AzureAI-Local-Key'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/d45520cb-31ca-44ba-8da2-fcf914608544'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsOpenAIParameters['Dine-AzureAI-Local-Key'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Dine-AzureAI-Local-Key2'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/55eff01b-f2bd-4c32-9203-db285f709d30'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsOpenAIParameters['Dine-AzureAI-Local-Key2'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-Cognitive-Services-Local-Auth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/14de9e63-1b31-492e-a5a3-c3f7fd57f555'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsOpenAIParameters['Modify-Cognitive-Services-Local-Auth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Enforce-Guardrails-PostgreSQL'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-PostgreSQL.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'Dine-PostgreSql-Adv-Threat-Protection'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/db048e65-913c-49f9-bb5f-1084184671d3'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsPostgreSQLParameters['Dine-PostgreSql-Adv-Threat-Protection'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Enforce-Guardrails-ServiceBus'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-ServiceBus.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'Deny-Sb-Authz-Rules'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/a1817ec0-a368-432a-8057-8371e17ac6ee'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsServiceBusParameters['Deny-Sb-Authz-Rules'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Sb-Encryption'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/ebaf4f25-a4e8-415f-86a8-42d9155bef0b'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsServiceBusParameters['Deny-Sb-Encryption'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Sb-LocalAuth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/cfb11c26-f069-4c14-8e36-56c394dae5af'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsServiceBusParameters['Deny-Sb-LocalAuth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-Sb-LocalAuth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/910711a6-8aa2-4f15-ae62-1e5b2ed3ef9e'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsServiceBusParameters['Modify-Sb-LocalAuth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Enforce-Guardrails-SQL'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-SQL.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'Deny-Sql-Aad-Only'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/abda6d70-9778-44e7-84a8-06713e6db027'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsSQLParameters['Deny-Sql-Aad-Only'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Sql-Managed-Aad-Only'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/78215662-041e-49ed-a9dd-5385911b3a1f'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsSQLParameters['Deny-Sql-Managed-Aad-Only'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Dine-Sql-Adv-Data'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/6134c3db-786f-471e-87bc-8f479dc890f6'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsSQLParameters['Dine-Sql-Adv-Data'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Dine-Sql-Managed-Defender'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/c5a62eb0-c65a-4220-8a4d-f70dd4ca95dd'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsSQLParameters['Dine-Sql-Managed-Defender'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Modify-Sql-PublicNetworkAccess'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/28b0b1e5-17ba-4963-a7a4-5a1ab4400a0b'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsSQLParameters['Modify-Sql-PublicNetworkAccess'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Enforce-Guardrails-Storage'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-Storage.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'Deny-Storage-Account-Encryption'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/bfecdea6-31c4-4045-ad42-71b9dc87247d'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsStorageParameters['Deny-Storage-Account-Encryption'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Storage-Account-Keys-Expire'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/044985bb-afe1-42cd-8a36-9d5d42424537'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsStorageParameters['Deny-Storage-Account-Keys-Expire'].parameters
				definitionGroups: []
				definitionVersion: '3.*.*'
			}
			{
				definitionReferenceId: 'Deny-Storage-Classic'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/37e0d2fe-28a5-43d6-a273-67d37d1f5606'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsStorageParameters['Deny-Storage-Classic'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Storage-ContainerDeleteRetentionPolicy'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-Storage-ContainerDeleteRetentionPolicy'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsStorageParameters['Deny-Storage-ContainerDeleteRetentionPolicy'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Storage-CopyScope'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-Storage-CopyScope'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsStorageParameters['Deny-Storage-CopyScope'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Storage-CorsRules'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-Storage-CorsRules'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsStorageParameters['Deny-Storage-CorsRules'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Storage-Cross-Tenant'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/92a89a79-6c52-4a7e-a03f-61306fc49312'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsStorageParameters['Deny-Storage-Cross-Tenant'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Storage-Infra-Encryption'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/4733ea7b-a883-42fe-8cac-97454c2a9e4a'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsStorageParameters['Deny-Storage-Infra-Encryption'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Storage-LocalUser'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-Storage-LocalUser'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsStorageParameters['Deny-Storage-LocalUser'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Storage-NetworkAclsBypass'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-Storage-NetworkAclsBypass'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsStorageParameters['Deny-Storage-NetworkAclsBypass'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Storage-NetworkAclsVirtualNetworkRules'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-Storage-NetworkAclsVirtualNetworkRules'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsStorageParameters['Deny-Storage-NetworkAclsVirtualNetworkRules'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Storage-NetworkRules'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/2a1a9cdf-e04d-429a-8416-3bfb72a1b26f'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsStorageParameters['Deny-Storage-NetworkRules'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Storage-ResourceAccessRulesResourceId'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-Storage-ResourceAccessRulesResourceId'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsStorageParameters['Deny-Storage-ResourceAccessRulesResourceId'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Storage-ResourceAccessRulesTenantId'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-Storage-ResourceAccessRulesTenantId'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsStorageParameters['Deny-Storage-ResourceAccessRulesTenantId'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Storage-Restrict-NetworkRules'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/34c877ad-507e-4c82-993e-3452a6e0ad3c'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsStorageParameters['Deny-Storage-Restrict-NetworkRules'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Storage-ServicesEncryption'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-Storage-ServicesEncryption'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsStorageParameters['Deny-Storage-ServicesEncryption'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Storage-SFTP'
				definitionId: '${varTargetManagementGroupResourceId}/providers/Microsoft.Authorization/policyDefinitions/Deny-Storage-SFTP'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsStorageParameters['Deny-Storage-SFTP'].parameters
				definitionGroups: []
				definitionVersion: ''
			}
			{
				definitionReferenceId: 'Deny-Storage-Shared-Key'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/8c6a50c6-9ffd-4ae7-986f-5fa6111f9a54'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsStorageParameters['Deny-Storage-Shared-Key'].parameters
				definitionGroups: []
				definitionVersion: '2.*.*'
			}
			{
				definitionReferenceId: 'Dine-Storage-Threat-Protection'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/361c2074-3595-4e5d-8cab-4f21dffc835c'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsStorageParameters['Dine-Storage-Threat-Protection'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-Blob-Storage-Account-PublicEndpoint'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/13502221-8df0-4414-9937-de9c5c4e396b'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsStorageParameters['Modify-Blob-Storage-Account-PublicEndpoint'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-Storage-Account-PublicEndpoint'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/a06d0189-92e8-4dba-b0c4-08d7669fce7d'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsStorageParameters['Modify-Storage-Account-PublicEndpoint'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-Storage-FileSync-PublicEndpoint'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/0e07b2e9-6cd9-4c40-9ccb-52817b95133b'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsStorageParameters['Modify-Storage-FileSync-PublicEndpoint'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Enforce-Guardrails-Synapse'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-Synapse.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'Deny-Synapse-Data-Traffic'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/3484ce98-c0c5-4c83-994b-c5ac24785218'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsSynapseParameters['Deny-Synapse-Data-Traffic'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Synapse-Fw-Rules'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/56fd377d-098c-4f02-8406-81eb055902b8'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsSynapseParameters['Deny-Synapse-Fw-Rules'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Synapse-Local-Auth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/2158ddbe-fefa-408e-b43f-d4faef8ff3b8'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsSynapseParameters['Deny-Synapse-Local-Auth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Synapse-Managed-Vnet'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/2d9dbfa3-927b-4cf0-9d0f-08747f971650'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsSynapseParameters['Deny-Synapse-Managed-Vnet'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Deny-Synapse-Tenant-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/3a003702-13d2-4679-941b-937e58c443f0'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsSynapseParameters['Deny-Synapse-Tenant-Access'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Dine-Synapse-Defender'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/951c1558-50a5-4ca3-abb6-a93e3e2367a6'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsSynapseParameters['Dine-Synapse-Defender'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-Synapse-Local-Auth'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/c3624673-d2ff-48e0-b28c-5de1c6767c3c'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsSynapseParameters['Modify-Synapse-Local-Auth'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-Synapse-Public-Network-Access'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/5c8cad01-ef30-4891-b230-652dadb4876a'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsSynapseParameters['Modify-Synapse-Public-Network-Access'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-Synapse-Tls-Version'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/8b5c654c-fb07-471b-aa8f-15fea733f140'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsSynapseParameters['Modify-Synapse-Tls-Version'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
	{
		name: 'Enforce-Guardrails-VirtualDesktop'
		libSetDefinition: loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-VirtualDesktop.json')
		libSetChildDefinitions: [
			{
				definitionReferenceId: 'Modify-Hostpool-PublicNetworkAccess'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/2a0913ff-51e7-47b8-97bb-ea17127f7c8d'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsVirtualDesktopParameters['Modify-Hostpool-PublicNetworkAccess'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
			{
				definitionReferenceId: 'Modify-Workspace-PublicNetworkAccess'
				definitionId: '/providers/Microsoft.Authorization/policyDefinitions/ce6ebf1d-0b94-4df9-9257-d8cacc238b4f'
				definitionParameters: varPolicySetDefinitionEsEnforceGuardrailsVirtualDesktopParameters['Modify-Workspace-PublicNetworkAccess'].parameters
				definitionGroups: []
				definitionVersion: '1.*.*'
			}
		]
	}
]


// Policy Set/Initiative Definition Parameter Variables

var varPolicySetDefinitionEsAuditTrustedLaunchParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Audit-TrustedLaunch.parameters.json')

var varPolicySetDefinitionEsAuditUnusedResourcesCostOptimizationParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Audit-UnusedResourcesCostOptimization.parameters.json')

var varPolicySetDefinitionEsDenyPublicPaaSEndpointsParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Deny-PublicPaaSEndpoints.parameters.json')

var varPolicySetDefinitionEsDenyActionDeleteProtectionParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_DenyAction-DeleteProtection.parameters.json')

var varPolicySetDefinitionEsDeployAUMCheckUpdatesParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Deploy-AUM-CheckUpdates.parameters.json')

var varPolicySetDefinitionEsDeployDiagnosticsLogAnalyticsParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Deploy-Diagnostics-LogAnalytics.parameters.json')

var varPolicySetDefinitionEsDeployMDFCConfig_20240319Parameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Deploy-MDFC-Config_20240319.parameters.json')

var varPolicySetDefinitionEsDeployMDFCConfigParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Deploy-MDFC-Config.parameters.json')

var varPolicySetDefinitionEsDeployMDFCDefenderSQLAMAParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Deploy-MDFC-DefenderSQL-AMA.parameters.json')

var varPolicySetDefinitionEsDeployPrivateDNSZonesParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Deploy-Private-DNS-Zones.parameters.json')

var varPolicySetDefinitionEsDeploySqlSecurity_20240529Parameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Deploy-Sql-Security_20240529.parameters.json')

var varPolicySetDefinitionEsDeploySqlSecurityParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Deploy-Sql-Security.parameters.json')

var varPolicySetDefinitionEsEnforceACSBParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-ACSB.parameters.json')

var varPolicySetDefinitionEsEnforceALZDecommParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-ALZ-Decomm.parameters.json')

var varPolicySetDefinitionEsEnforceALZSandboxParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-ALZ-Sandbox.parameters.json')

var varPolicySetDefinitionEsEnforceBackupParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Backup.parameters.json')

var varPolicySetDefinitionEsEnforceEncryptionCMK_20250218Parameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Encryption-CMK_20250218.parameters.json')

var varPolicySetDefinitionEsEnforceEncryptionCMKParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Encryption-CMK.parameters.json')

var varPolicySetDefinitionEsEnforceEncryptTransit_20240509Parameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-EncryptTransit_20240509.parameters.json')

var varPolicySetDefinitionEsEnforceEncryptTransit_20241211Parameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-EncryptTransit_20241211.parameters.json')

var varPolicySetDefinitionEsEnforceEncryptTransitParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-EncryptTransit.parameters.json')

var varPolicySetDefinitionEsEnforceGuardrailsAPIMParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-APIM.parameters.json')

var varPolicySetDefinitionEsEnforceGuardrailsAppServicesParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-AppServices.parameters.json')

var varPolicySetDefinitionEsEnforceGuardrailsAutomationParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-Automation.parameters.json')

var varPolicySetDefinitionEsEnforceGuardrailsBotServiceParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-BotService.parameters.json')

var varPolicySetDefinitionEsEnforceGuardrailsCognitiveServicesParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-CognitiveServices.parameters.json')

var varPolicySetDefinitionEsEnforceGuardrailsComputeParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-Compute.parameters.json')

var varPolicySetDefinitionEsEnforceGuardrailsContainerAppsParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-ContainerApps.parameters.json')

var varPolicySetDefinitionEsEnforceGuardrailsContainerInstanceParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-ContainerInstance.parameters.json')

var varPolicySetDefinitionEsEnforceGuardrailsContainerRegistryParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-ContainerRegistry.parameters.json')

var varPolicySetDefinitionEsEnforceGuardrailsCosmosDbParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-CosmosDb.parameters.json')

var varPolicySetDefinitionEsEnforceGuardrailsDataExplorerParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-DataExplorer.parameters.json')

var varPolicySetDefinitionEsEnforceGuardrailsDataFactoryParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-DataFactory.parameters.json')

var varPolicySetDefinitionEsEnforceGuardrailsEventGridParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-EventGrid.parameters.json')

var varPolicySetDefinitionEsEnforceGuardrailsEventHubParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-EventHub.parameters.json')

var varPolicySetDefinitionEsEnforceGuardrailsKeyVaultSupParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-KeyVault-Sup.parameters.json')

var varPolicySetDefinitionEsEnforceGuardrailsKeyVaultParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-KeyVault.parameters.json')

var varPolicySetDefinitionEsEnforceGuardrailsKubernetesParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-Kubernetes.parameters.json')

var varPolicySetDefinitionEsEnforceGuardrailsMachineLearningParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-MachineLearning.parameters.json')

var varPolicySetDefinitionEsEnforceGuardrailsMySQLParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-MySQL.parameters.json')

var varPolicySetDefinitionEsEnforceGuardrailsNetworkParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-Network.parameters.json')

var varPolicySetDefinitionEsEnforceGuardrailsOpenAIParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-OpenAI.parameters.json')

var varPolicySetDefinitionEsEnforceGuardrailsPostgreSQLParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-PostgreSQL.parameters.json')

var varPolicySetDefinitionEsEnforceGuardrailsServiceBusParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-ServiceBus.parameters.json')

var varPolicySetDefinitionEsEnforceGuardrailsSQLParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-SQL.parameters.json')

var varPolicySetDefinitionEsEnforceGuardrailsStorageParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-Storage.parameters.json')

var varPolicySetDefinitionEsEnforceGuardrailsSynapseParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-Synapse.parameters.json')

var varPolicySetDefinitionEsEnforceGuardrailsVirtualDesktopParameters = loadJsonContent('lib/policy_set_definitions/policy_set_definition_es_Enforce-Guardrails-VirtualDesktop.parameters.json')

// Customer Usage Attribution Id
var varCuaid = '2b136786-9881-412e-84ba-f4c2822e1ac9'

resource resPolicyDefinitions 'Microsoft.Authorization/policyDefinitions@2025-01-01' = [for policy in varCustomPolicyDefinitionsArray: {
  name: policy.libDefinition.name
  properties: {
    description: policy.libDefinition.properties.description
    displayName: policy.libDefinition.properties.displayName
    metadata: policy.libDefinition.properties.metadata
    mode: policy.libDefinition.properties.mode
    parameters: policy.libDefinition.properties.parameters
    policyType: policy.libDefinition.properties.policyType
    policyRule: policy.libDefinition.properties.policyRule
  }
}]

resource resPolicySetDefinitions 'Microsoft.Authorization/policySetDefinitions@2025-01-01' = [for policySet in varCustomPolicySetDefinitionsArray: {
  dependsOn: [
    resPolicyDefinitions // Must wait for policy definitons to be deployed before starting the creation of Policy Set/Initiative Defininitions
  ]
  name: policySet.libSetDefinition.name
  properties: {
    description: policySet.libSetDefinition.properties.description
    displayName: policySet.libSetDefinition.properties.displayName
    metadata: policySet.libSetDefinition.properties.metadata
    parameters: policySet.libSetDefinition.properties.parameters
    policyType: policySet.libSetDefinition.properties.policyType
    policyDefinitions: [for policySetDef in policySet.libSetChildDefinitions: {
      policyDefinitionReferenceId: policySetDef.definitionReferenceId
      policyDefinitionId: policySetDef.definitionId
      parameters: policySetDef.definitionParameters
      groupNames: policySetDef.definitionGroups
			definitionVersion: !(empty(policySetDef.definitionVersion)) ? policySetDef.definitionVersion : null
    }]
    policyDefinitionGroups: policySet.libSetDefinition.properties.policyDefinitionGroups
  }
}]

// Optional Deployment for Customer Usage Attribution
module modCustomerUsageAttribution '../../../CRML/customerUsageAttribution/cuaIdManagementGroup.bicep' = if (!parTelemetryOptOut) {
  #disable-next-line no-loc-expr-outside-params //Only to ensure telemetry data is stored in same location as deployment. See https://github.com/Azure/ALZ-Bicep/wiki/FAQ#why-are-some-linter-rules-disabled-via-the-disable-next-line-bicep-function for more information
  name: 'pid-${varCuaid}-${uniqueString(deployment().location)}'
  params: {}
}
