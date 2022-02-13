# eSchool + Azure DevOps

## Prerequisites

### Azure Cloud

1. Create **Management group** and **Subscription**
2. Create _Group / Users_ in **Azure AD**, grant access to **Subscription**
3. Create **Service Principle**
   ```sh
   az ad sp create-for-rbac --name AzureDevOpsServicePrincipal --role Owner
   ```

### Azure DevOps

1. Create **Organization**
2. Create _Azure Resource Manager_ **Service connection** with _Service principal (manual)_
3. Add _infrastructure_ and _source code_ repos from **GitHub**
