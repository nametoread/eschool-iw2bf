param dnsDomain string

param crName string = uniqueString(subscription().subscriptionId)
param crSku string = 'Basic'

resource dnsZone 'Microsoft.Network/dnsZones@2018-05-01' = {
  name: dnsDomain
  location: 'global'
}

resource cr 'Microsoft.ContainerRegistry/registries@2021-09-01' = {
  name: crName
  location: resourceGroup().location
  sku: {
    name: crSku
  }
  properties: {
    adminUserEnabled: true
  }
}

output crName string = crName
