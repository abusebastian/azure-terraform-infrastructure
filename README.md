# How to configure the pipeline to deploy the App

---
Create a Azure Resource Manager Service connection Manually

    1) Go to Entra ID
    2) Click on App registrations
    3) Add a new registration 
    4) Go to Certificates and Secrets
    5) Add new client secret 
    6) Go to the subscription and click on IAM
    7) Add a role assignments and give "Owner" permission to the App registation which you created in step 3 (Allow user to assign all roles except privileged administrator roles Owner, UAA, RBAC (Recommended) )
    8) Configure Azure Resource Manager Service connection manually using these details in Azure DevOps (Default name used is : exodus)
        - Click on 'New service connection '
        - Click on 'Service principal (manual)'
        - Configure the 'Subscription Name' and 'Subscription Id'
        - Configure 'Service Principal Id' which is the 'Application (client) ID' in the result of step 3
        - Configure 'Service principal key' which is the 'Secret Value' in the result of step 5  
        - Configure 'Tenant ID '
        - Click 'Verify'
        - Configure 'Service connection name' (Default name used is : exodus)
        - Click 'Grant access permission to all pipelines'
        - Click 'Save'
---
Configuring the pipeline.

    1) Configure the repo with azure-pipeline.yml present in the root folder
    2) Give the service connection created previously as a parameter to 'armServiceConnection' field. (Default name used is : exodus)
    3) Run the pipeline
    4) It will create below
        - Resource Group: myrg
        - Storage account : myterraformstgaccount
        - Storage Container : myassignmentinfra-statefile
        - Resource group : myAssignmentrg
        - Managed Identity : containerappmidentity
        - Role assignment
        - ACR : exodusacr
        - Container App Environment : mycontainerappenv
---
    Create a Service connection for Azure Container Registry

    1) Configure Service connection for Azure container registry(Default name used is : exodus)
    2) Choose the same subscription used to create resource manger service principal in previous step.
    3) Select the container registry created in previous step   (Default name used is : exodusacr)
    4) Give Service connection name same as ACR name. (Default name used is : exodusacr)
    5)Grant access permission to all pipelines and Create/ Save
---

# Destroy Functionality

On pipeline trigger select isdetroy to true to destroy the infrastructure. Please note to destroy the app using the azure-terraform-app pipeline.
