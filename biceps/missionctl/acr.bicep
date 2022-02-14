param name string
param sku string

resource cr 'Microsoft.ContainerRegistry/registries@2021-09-01' = {
  name: name
  location: resourceGroup().location
  sku: {
    name: sku
  }
  properties: {
    adminUserEnabled: true
  }
}
