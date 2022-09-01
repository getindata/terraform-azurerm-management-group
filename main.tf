resource "azurerm_management_group" "this" {
  count = module.this.enabled ? 1 : 0

  name = local.name_from_descriptor
  display_name = (var.display_name != null
    ? var.display_name
  : title(replace(module.this.name, "-", " ")))

  parent_management_group_id = var.parent_management_group_id

  subscription_ids = var.subscription_ids
  lifecycle {
    ignore_changes = [subscription_ids]
  }
}

resource "azurerm_management_group_policy_assignment" "this" {
  for_each = module.this.enabled ? var.management_group_policies : {}

  name = each.key

  management_group_id  = local.management_group_id
  policy_definition_id = each.value.policy_definition_id
  parameters           = jsonencode(each.value.parameters)
}

resource "azurerm_management_group_subscription_association" "this" {
  count = module.this.enabled ? length(var.subscription_ids) : 0

  management_group_id = local.management_group_id
  subscription_id     = format("/subscriptions/%s", var.subscription_ids[count.index])
}
