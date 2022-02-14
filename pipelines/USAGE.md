# Common rules

Every pipeline should include:

- `globalLibrary` - name of global library
- `specificLibrary` - per-pipeline library

## Global library variables

- `azureConnection` - name of Azure Resource Manager connection
- `vmImage` - agent label name (ex. `ubuntu-latest`)

# Pipelines configuration

## `missionctl`

### Variables

### Specific library

- `dnsDomain` - domain name for DNS Zone
- `location` - deployment location

## `data`
