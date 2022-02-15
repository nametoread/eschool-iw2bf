param location string = resourceGroup().location

param asPlanName string
param asPlanSkuTier string = 'Basic'
param asPlanSkuName string = 'B1'

param asName string

param crName string
param crImageName string = 'eschool'

resource asPlan 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: asPlanName
  location: location
  kind: 'linux'
  properties: {
    reserved: true
    zoneRedundant: false
  }
  sku: {
    tier: asPlanSkuTier
    name: asPlanSkuName
  }
}

resource appService 'Microsoft.Web/sites@2021-02-01' = {
  name: asName
  location: location
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'DOCKER_REGISTRY_SERVER_URL'
          value: 'https://${crName}.azurecr.io'
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_USERNAME'
          value: crName
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_PASSWORD'
          value: null
        }
        {
          name: 'WEBSITES_ENABLE_APP_SERVICE_STORAGE'
          value: 'false'
        }
      ]
      linuxFxVersion: 'DOCKER|${crName}.azurecr.io/${crImageName}:latest'
      alwaysOn: false
    }
    serverFarmId: asPlan.id 
    clientAffinityEnabled: false
  }
}
