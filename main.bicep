param location string = 'eastus'
param resourceGroupName string = 'bicep-test-rg'

module rg 'modules/resourceGroup.bicep' = {
  scope: subscription()
  name: 'rg-${uniqueString(subscription().subscriptionId)})}}'
  params: {
    location: location
    resourceGroupName: resourceGroupName
  }
}

module sa 'modules/storageAccount.bicep' = {
  scope: resourceGroup(resourceGroupName)
  name: 'sa-${uniqueString(resourceGroup().id)})}}'
  params: {
    location: location
    storageAccountName: 'biceptest${uniqueString(resourceGroup().id)})}}'
  }
}


