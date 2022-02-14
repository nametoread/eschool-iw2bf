param domain string

resource dnsZone 'Microsoft.Network/dnsZones@2018-05-01' = {
  name: domain
  location: 'global'
}
