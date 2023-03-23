targetScope = 'subscription'

param resourceGroupName string = 'org-jcetina-repo-learn-bicep-rg'

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' existing =  {
  name: resourceGroupName
}

module sa 'modules/storageAccount.bicep' = {
  name: 'sa${uniqueString(rg.id)}'
  scope: rg
  params: {
    storageAccountName: 'sa${uniqueString(rg.id)}'
    location: rg.location
  }
}
