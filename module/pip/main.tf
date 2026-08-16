resource "azurerm_public_ip" "pbip" {
  for_each = var.pip
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  allocation_method   = "Static"
}

data "azurerm_resource_group" "rg"{
    name = "rupesh"
}

variable "pip"{}