param location string = resourceGroup().location

param vnName string
param vnAddressSpaceIp string
param vnAddressSpacePrefix int = 16
param vnDefaultSubnetPrefix int = 24

param dbName string
param dbSubnetAddressIp string
param dbAdminLogin string
param dbAdminPassword string
param dbSkuName string = 'Standard_B1ms'
param dbSkuTier string = 'Burstable'

param kvName string

resource vnet 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: vnName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '${vnAddressSpaceIp}/${vnAddressSpacePrefix}'
      ]
    }
    subnets: [
      {
        name: 'default'
        properties: {
          addressPrefix: '${vnAddressSpaceIp}/${vnDefaultSubnetPrefix}'
        }
      }
    ]
  }
}

resource dbSubnet 'Microsoft.Network/virtualNetworks/subnets@2021-05-01' = {
  parent: vnet
  name: 'mysqldb'
  properties: {
    addressPrefix: '${dbSubnetAddressIp}/${vnDefaultSubnetPrefix}'
    delegations: [
      {
        name: 'dlg-Microsoft.DBforMySQL-flexibleServers'
        properties: {
          serviceName: 'Microsoft.DBforMySQL/flexibleServers'
        }
      }
    ]
  }
}

resource dbDnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' = {
  name: '${dbName}.private.mysql.database.azure.com'
  location: 'global'
}

resource dbVnetLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = {
  parent: dbDnsZone
  name: 'mysqlDbLink'
  location: 'global'
  properties: {
    virtualNetwork: {
      id: vnet.id
    }
    // registrationEnabled: false
  }
}

resource mysqlFlexible 'Microsoft.DBforMySQL/flexibleServers@2021-05-01' = {
  name: dbName
  location: location
  properties: {
    version: '8.0.21'
    administratorLogin: dbAdminLogin
    administratorLoginPassword: dbAdminPassword
    network: {
      delegatedSubnetResourceId: dbSubnet.id
      privateDnsZoneResourceId: dbDnsZone.id
    }
  }
  sku: {
    name: dbSkuName
    tier: dbSkuTier
  }
  dependsOn: [
    dbVnetLink
  ]
}
