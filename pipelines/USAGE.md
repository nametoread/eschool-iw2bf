# Overview

There is one **global group** with following variables:

- `azureConnection` - name of Azure Resource Manager connection
- `vmImage` - agent label name (ex. `ubuntu-latest`)

Also for each pipeline **separate group** should be created. Hence every pipeline require:

- `globalGroup` - global group name
- `moduleGroup` - module group name

# Pipelines

## 0-missionctl

Creation of base infrastructure.

### Group variables

- `dnsDomain` - domain name for DNS Zone

### Pipeline variables

Only required.
