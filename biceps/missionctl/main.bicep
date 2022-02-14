targetScope = 'subscription'

param timestamp string = utcNow()

param rgName string = 'missionctl'
param rgLocation string = 'West Europe'

param dnsDomain string

param acrName string = uniqueString(subscription().subscriptionId)
param acrSku string = 'Basic'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${rgName}'
  location: rgLocation
}

module dnsZone 'dns_zone.bicep' = {
  name: 'deploy-${rgName}-dnszone-${timestamp}'
  scope: rg
  params: {
    domain: dnsDomain
  }
}

module acr 'acr.bicep'= {
  name: 'deploy-${rgName}-acr-${timestamp}'
  scope: rg
  params: {
    name: acrName
    sku: acrSku
  }
}

output acrName string = acrName
