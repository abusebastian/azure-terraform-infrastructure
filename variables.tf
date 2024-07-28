variable "location" {
    type = string
    default = "Location"
}

variable "resourceGroup" {
    type = string
    description = "Resource Group"
}

variable "managedIdentityAcr" {
    type = string
    description = "MI used for ACR"
}

variable "myContainerRegistry" {
    type = string
    description = "Name of Container Registry"
}

variable "myContainerApp" {
    type = string
    description = "Name of Container App"
}

variable "myLogAnalytics" {
    type = string
    description = "Name of Log Analytics"
}

# variable "groups" {
#   type = map(object({
#     name        = string
#   }))
# }

# variable "users" {
#   type = map(object({
#     display_name        = string
#     user_principal_name = string
#     password            = string
#   }))
# }

variable "myContainerAppEnv" {
    type = string
    description = "Name of Conatiner App Environment"
}