//********************** General Variables **************************//

variable "location" {
  description = "The location/region where resources will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
  type = string
}

//********************** SQLServer Variables **************************//

variable "sqlname" {
  description = "Azure Resource Group name to build into"
  type = string
}
