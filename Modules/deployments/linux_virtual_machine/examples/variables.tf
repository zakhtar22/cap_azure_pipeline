######################
###VARIABLES##########

variable "location" {
  type        = list(string)
  description = "Azure Region"
  default = ["UK South",
  "France Central"]
}

variable "azure_resource_group_name" {
  type        = string
  description = "Resource Group Name"
  default     = "example-resources"
}

variable "resource_name" {
  type        = string
  description = "Name For The Azure Virtual Machine"
  default     = "terraform-session"
}

variable "azure_vm_size" {
  type        = string
  description = "The Size of our Azure Virtual Machine"
  default     = "Standard_F2"
}

/* variable "sku_vm" {
  type        = string
  description = "The SKU of our Virtual Machine"
  default     = "2019-Datacenter-smalldisk"
}
*/
variable "resource_instance_count" {
  type        = string
  description = "Number of VMs to deploy"
  default     = 2
}

variable "network_address" {
  type        = map(string)
  description = "Network address space"
  default = {
    "UK South"     = "10.0.0.0/22"
    "France Central" = "10.1.0.0/22"
  }
}

variable "vm_data_disk_size" {
  description = "Desired sized for provisioned resources"
  type        = number
  default     = 32
}

variable "data_disk_count" {
  description = "Desired size for provisioned resources for each service"
  type        = number
  default     = 0
}

variable "platform_location_az_count" {
  description = "Number of availability zones in the location"
  type        = map(string)
  default = {
    "UK South"     = 3
    "France Central" = 3
  }
}

variable "unique_ID" {
  description = "Unique ID"
  type = string
  default = "001"
}