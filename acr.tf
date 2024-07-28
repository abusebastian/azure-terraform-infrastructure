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

