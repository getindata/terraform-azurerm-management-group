variable "display_name" {
  type        = string
  default     = null
  description = "A friendly name for this Management Group. If not specified, this will be the same as the name"
}

variable "parent_management_group_id" {
  type        = string
  description = "The ID of the Parent Management Group. If null, the management group will be provided under the Root Tenant management group"
  default     = null
}

variable "management_group_policies" {
  type = map(object({
    policy_definition_id : string
    parameters : any
  }))
  default     = {}
  description = "List of Azure policy IDs and their respective parameters to be attached to the Management Group"
}

variable "subscription_ids" {
  type        = list(string)
  default     = []
  description = "List of subscription IDs placed in the Management Group"
}
