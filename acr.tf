resource "azurerm_resource_group" "rgrp" {
    name = var.resourceGroup
    location = var.location
    tags = {
        Project = "Assignment"
  }
}

resource "azurerm_container_registry" "acr" {
  name                = var.myContainerRegistry
  resource_group_name = azurerm_resource_group.rgrp.name
  location            = azurerm_resource_group.rgrp.location
  sku                 = "Basic"
  admin_enabled       = true
  tags = {
    Project = "Assignment"
  }
}


# resource "azurerm_key_vault" "akv" {
#   name                = "mykeyvaultqwerty"
#   location            = azurerm_resource_group.rgrp.location
#   resource_group_name = azurerm_resource_group.rgrp.name

#   sku_name = "standard"

#   tenant_id = data.azurerm_client_config.current.tenant_id
#   access_policy {
#     tenant_id = data.azurerm_client_config.current.tenant_id
#     object_id = data.azurerm_client_config.current.object_id

#     secret_permissions = [
#       "Get",
#       "List",
#       "Set",
#       "Delete",
#     ]
#   }
# }

# resource "azurerm_key_vault_secret" "acr_admin_password" {
#   name         = "acrAdminPassword"
#   value        = azurerm_container_registry.acr.admin_password
#   key_vault_id = azurerm_key_vault.akv.id
# }


# resource "azurerm_kubernetes_cluster" "aks" {
#   name                = "myAKSCluster"
#   location            = azurerm_resource_group.rgrp.location
#   resource_group_name = azurerm_resource_group.rgrp.name
#   dns_prefix          = "myprefixaks"

#   default_node_pool {
#     name       = "default"
#     node_count = 1
#     vm_size    = "Standard_B1s"
#   }

#   identity {
#     type = "SystemAssigned"
#   }

#   network_profile {
#     network_plugin = "azure"
#   }

#   tags = {
#     Project = "Assignment"
#   }
# }

# resource "azurerm_role_assignment" "roleAssignment" {
#   principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
#   role_definition_name             = "AcrPull"
#   scope                            = azurerm_container_registry.acr.id
#   skip_service_principal_aad_check = true
# }