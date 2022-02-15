# Library

There is one **global group** (named `globalGroup`) with following common variables:

- `azureConnection` - name of Azure Resource Manager connection
- `vmImage` - agent label name (ex. `ubuntu-latest`)

Also for each pipeline **separate group** should be created (lookup name in module).

# Pipelines

## 0-missionctl

- _Description:_ Creation of base infrastructure (DNS Zone, Container Registry).
- _Group:_ `missionCtlGroup`
  - `dnsDomain` - domain name for DNS Zone

## 1-ci

- _Description:_ Continious integration. App image build and push to Container registry.
- _Group:_ `ciGroup`
  - **currently not in use**

# Notes

`bicep-deploy` module require **Administrator** role in `globalGroup`

# Misc

- Powershell support env variables like `$(Variable.Name)` or `$Env:VARIABLE_NAME`
