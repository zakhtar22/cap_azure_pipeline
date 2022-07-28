######################
###VARIABLES##########

# variable "cidr_block" {
#   type        = string
#   description = "cidr_block for VPC"
# }

variable "resource_name" {
  description = "Name of VM"
  type        = string
}

variable "location" {
  type        = string
  description = "Azure Region"
}

variable "azure_resource_group_name" {
  type        = string
  description = "Resource Group Name"
}

# variable "azure_vpc" {
#   type        = string
#   description = "Name for Azure VPC"
# }

# variable "azure_nic" {
#   type        = string
#   description = "Name for Azure NIC"
# }


variable "azure_vm_size" {
  type        = string
  description = "The Size of our Azure Virtual Machine"
}

variable "sku_vm" {
  type        = string
  description = "The SKU of our Virtual Machine"
}

variable "admin_username" {
  type        = string
  description = "Username for our VM"
  default     = "Graduates"
}

/* variable "admin_password" {
  type        = string
  description = "The admin password for our VM"
  default     = "Pa55w0rd$$$"
}
*/

variable "resource_instance_count" {
  type        = string
  description = "Number of VMs to deploy"
}

variable "network_address" {
  description = "Network address space"
  type        = string
}

variable "network_name" {
  description = "Name of network"
  type        = string
  default     = "servernetwork"
}


variable "subnet_name" {
  type        = string
  description = "name of subnet"
  default     = "serversubnet"
}

variable "vm_disk_size" {
  description = "Size of vm disk"
  type        = string
  default     = "32"
}

variable "vm_disk_type" {
  description = "Type of vm disk"
  type        = string
  default     = "Standard_LRS"
}

# variable "deployment" {
#   description = "Deployment Identifier"
#   type        = string
# }

variable "platform_location_az_count" {
  description = "Number of availability zones in the location"
  type        = map(string)
  default = {
    "UK South"     = 3
    "North Europe" = 3
  }
}

variable "vm_environment" {
  description = "Environment of VM"
  type        = string
  default     = "Production"
}

variable "vm_data_disk_count" {
  description = "Desired size for the provisioned resources for each service"
  type        = number
  default     = 0
}

variable "vm_data_disk_size" {
  description = "Desired sized for provisioned resources"
  type        = number
  default     = 0
}
