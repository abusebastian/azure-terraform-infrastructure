
# resource "azurerm_log_analytics_workspace" "logAnalytics" {
#   name                = var.myLogAnalytics
#   location            = azurerm_resource_group.rgrp.location
#   resource_group_name = azurerm_resource_group.rgrp.name
#   sku                 = "Free" #changeit
#   retention_in_days   = 30
# }

resource "azurerm_user_assigned_identity" "containerapp" {
  location            = azurerm_resource_group.rgrp.location
  name                = var.managedIdentityAcr
  resource_group_name = azurerm_resource_group.rgrp.name
}
 
resource "azurerm_role_assignment" "containerapp" {
  scope                = azurerm_resource_group.rgrp.id
  role_definition_name = "acrpull"
  principal_id         = azurerm_user_assigned_identity.containerapp.principal_id
  depends_on = [
    azurerm_user_assigned_identity.containerapp
  ]
}

resource "azurerm_container_app_environment" "mycontainerappenv" {
  name                = var.myContainerAppEnv
  resource_group_name = azurerm_resource_group.rgrp.name
  location            = azurerm_resource_group.rgrp.location
  # log_analytics_workspace_id = azurerm_log_analytics_workspace.logAnalytics.id
}
