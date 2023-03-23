targetScope = 'subscription'

param resourceGroupName string = 'rg-learn-bicep-${location}'
param location string = 'eastus2'

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: location
}

module sa 'modules/storageAccount.bicep' = {
  name: 'sa${uniqueString(rg.id)}'
  scope: rg
  params: {
    storageAccountName: 'sa${uniqueString(rg.id)}'
    location: location
  }
}
