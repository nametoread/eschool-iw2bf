# Library

There is one **global group** (named `globalGroup`) with following common variables:

- `azureConnection` - name of Azure Resource Manager connection
- `vmImage` - agent label name (ex. `ubuntu-latest`)

Also for each pipeline **separate group** should be created (lookup name in module).

# Pipelines

## 0-missionctl

- _Description:_ Creation of base infrastructure (DNS Zone, Container Registry).
- _Group:_ `missionCtlGroup`
  - `rgName` - resource group name
  - `rgLocation` - resource group region
  - `dnsDomain` - domain name for DNS Zone

## 1-ci

- _Description:_ Continious integration. App image build and push to Container registry.
- _Group:_ `ciGroup`
  - **currently not in use**

## 2-data

- _Description:_ Storage infrastructure (MySQL Flexible, Key Vault)
- _Group:_ `dataGroup`
  - `rgName` - resource group name
  - `rgLocation` - resource group region
  - `vnName` - virtual network name
  - `vnAddressSpaceIp` - virtual network address space (IPv4 only, default prefix is 16)
  - `dbSubnetAddressIp` - subnet IPv4 address dedicated to database
  - `dbName` - database name (ex. `few-random-words`)
  - `dbAdminLogin` - database admin login
  - `dbAdminPassword` - database admin password (temporary)
  - `kvName` - key vault name

## 3-app

- _Description:_ Storage infrastructure (MySQL Flexible, Key Vault)
- _Group:_ `appGroup`
  - `rgName` - resource group name
  - `rgLocation` - resource group region
  - `asPlanName` - app service plan name
  - `asName` - app service name (also subdomain, ex. `few-random-words`)

# Notes

`bicep-deploy` module require **Administrator** role in `globalGroup`

# Misc

- Powershell support env variables like `$(Variable.Name)` or `$Env:VARIABLE_NAME`
