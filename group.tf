# data "azuread_client_config" "current" {}

# resource "azuread_user" "aduser" {
#   for_each = var.users
#   display_name        = each.value.display_name
#   user_principal_name = each.value.user_principal_name
#   password            = each.value.password
#   force_password_change = false
# }

# resource "azuread_group" "adgroup" {
#   for_each         = var.groups
#   display_name     = each.value.name
#   owners           = [data.azuread_client_config.current.object_id]
#   security_enabled = true

#   members = [
#     for user in azuread_user.aduser : user.id
#   ]
# }
