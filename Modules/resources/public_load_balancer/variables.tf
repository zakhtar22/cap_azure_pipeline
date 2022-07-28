variable "resource_name" {
  description = "Name of VM"
  type        = string
}

variable "azure_resource_group_name" {
  type        = string
  description = "Resource Group Name"
}

variable "vm_environment" {
  description = "Environment of VM"
  type        = string
}

variable "location" {
  type        = string
  description = "Azure Region"
}

/*variable "location_zone_support" {
  description = "Whether the current location supports zones"
  type = bool
}*/

variable "platform_location_az_count" {
  description = "Number of availability zones in the location"
  default = {
    "uksouth"     = ["1", "2", "3"]
    "northeurope" = ["1", "2", "3"]
  }
}

variable "vm_network_id" {
  description = "Network ID for the provisioned resources"
  type        = string
}

variable "network_address" {
  description = "Network Address space"
  type        = string
}

variable "resource_instance_count" {
  description = "Number of VMs to deploy"
  type        = string
}

variable "azure_tmp" {
  description = "Name for Azure Traffic Manager Profile"
  type        = string
  default     = "tmp1"
}

variable "azure_tm_endpoints" {
  description = "Name for the Azure Traffic Manager Endpoints"
  type        = string
  default     = "example-tm-endpoints"
}

variable "unique_ID" {
  description = "Unique ID"
  type        = string
  default     = "001"
}
