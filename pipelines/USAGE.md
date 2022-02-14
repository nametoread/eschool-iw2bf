# Overview

There is one global library with following variables:

- `azureConnection` - name of Azure Resource Manager connection
- `vmImage` - agent label name (ex. `ubuntu-latest`)

Also for each pipeline separate library should be created. Hence every pipeline require:

- `globalLibrary` - name of global library
- `specificLibrary` - per-pipeline library

# Pipelines

## 0-missionctl

Creation of base infrastructure.

### Library variables

- `dnsDomain` - domain name for DNS Zone

### Pipeline variables

Only required.
