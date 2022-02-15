param location string = resourceGroup().location

param dnsDomain string

param crName string = uniqueString(resourceGroup().name, subscription().subscriptionId)
param crSku string = 'Basic'

resource dnsZone 'Microsoft.Network/dnsZones@2018-05-01' = {
  name: dnsDomain
  location: 'global'
}

resource cr 'Microsoft.ContainerRegistry/registries@2021-09-01' = {
  name: crName
  location: location
  sku: {
    name: crSku
  }
  properties: {
    adminUserEnabled: true
  }
}

output crName string = crName
output crSku string = crSku
