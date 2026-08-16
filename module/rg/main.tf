resource "azurerm_resource_group" "rg"{
    for_each = var.rg-location
    name = each.value.name
    location = each.value.location
}

variable "rg-location" {
}
