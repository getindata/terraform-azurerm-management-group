locals {
  name_from_descriptor = replace(lookup(module.this.descriptors, "management-group", module.this.id), "/--+/", "-")

  management_group_id                         = one(azurerm_management_group.this[*].id)
  management_group_name                       = one(azurerm_management_group.this[*].name)
  management_group_parent_management_group_id = one(azurerm_management_group.this[*].parent_management_group_id)
}
