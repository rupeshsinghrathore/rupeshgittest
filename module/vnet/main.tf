resource "azurerm_virtual_network" "vnet"{
    name = "vnet1" 
    location = data.azurerm_resource_group.rg.location
    resource_group_name = data.azurerm_resource_group.rg.name
    address_space = ["10.10.0.0/16"]
}

data "azurerm_resource_group" "rg"{
    name = "rupesh"
}