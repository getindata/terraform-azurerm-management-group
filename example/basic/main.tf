module "this_management_group" {
  source  = "../../"
  context = module.this.context

  parent_management_group_id = var.parent_management_group_id
}
