######################
###VARIABLES##########


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

# variable "resource_instance_count" {
#   type        = string
#   description = "Number of VMs to deploy"
# }

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
    "France Central" = 3
  }
}

variable "resource_environment" {
  description = "Desired environment for disk resources"
  type        = string
}

variable "resource_zone" {
  description = "desired zone to provision resources"
  type        = any
}

variable "resource_vm_id" {
  description = "source vm id"
  type        = string
}

variable "vm_data_disk_size" {
  description = "Desired sized for provisioned resources"
  type        = number
}

variable "vm_data_disk_count" {
  description = "Desired size for provisioned resources for each service"
  type        = string
}