//********************** General Variables **************************//

variable "location" {
  description = "The location/region where resources will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
  type = string
  default = "East US"
}

variable "resource_group_name_tpot" {
  description = "Azure Resource Group name to build into"
  type = string
  default = "TestVM"
}

variable tpot-machinesize {
    description = "Set the machine size"
    default = "Standard_A2_v2"
}

variable myipaddress {
    description = "Set your public IP address"
}

variable ssh-public {
    description = "Public SSH key"
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAlrrfJxWKMdZ7vxxVQDT3P3ROiyAU6ThIrVDxlS5HPDJ+Dpr4tUgfmGo7UI/rH0imvX+cu30yTxcJLimGQTnlBL7+HqK/0DQZM2w1/KYsGZZ2k/og/mobsm6SZEL7pb+OqYBQvieSPj4qLsrqSLywWJHip1lp0bOMq3QZkl1gfYsHGiQI6eWInX/M4LccgUQ53zNIqNOSfX5tOGotVmtiSX/M/OYOSQomdtc3WXLiD8xP23AfS2j/1cH4pCKXDyt/vGj9Ae6ywQrxuBOZfrU78m+HVQu1Xe9VTyCIodqNJN0A+cpg63iWQe2Ln1OJj9y5Dp76GhQUX7feq/zEEpAojQ== Azure Key"
}

## cloud-init configuration ##
variable "timezone" {
  default = "UTC"
}

variable "linux_password" {
  default = "LiNuXuSeRPaSs#"
  description = "Set a password for the default user"

  validation {
    condition     = length(var.linux_password) > 0
    error_message = "Please specify a password for the default user."
  }
}

## These will go in the generated tpot.conf file ##
variable "tpot_flavor" {
  default     = "NEXTGEN"
  description = "Specify your tpot flavor [STANDARD, SENSOR, INDUSTRIAL, COLLECTOR, NEXTGEN, MEDICAL]"
}

variable "web_user" {
  default     = "webuser"
  description = "Set a username for the web user"
}

variable "web_password" {
  default = "w3b$ecret"
  description = "Set a password for the web user"

  validation {
    condition     = length(var.web_password) > 0
    error_message = "Please specify a password for the web user."
  }
}