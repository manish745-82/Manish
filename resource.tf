# To import the resource group 'main':
# terraform import azurerm_resource_group.main /subscriptions/{subscription_id}/resourceGroups/{resource_group_name}
resource "azurerm_resource_group" "main" {
  location = var.az_rg_location-east
  name     = var.az_rg_east

}
# To import the resource group 'main1':
# terraform import azurerm_resource_group.main1 /subscriptions/{subscription_id}/resourceGroups/{resource_group_name}
resource "azurerm_resource_group" "main1" {
  location = var.az_rg_location-west
  name     = var.az_rg_west
}

resource "azurerm_resource_group" "main2" {
  location = var.az_rg_location-asia
  name     = var.az_rg_asia
}
# To import the virtual network 'main':
# terraform import azurerm_virtual_network.main /subscriptions/{subscription_id}/resourceGroups/{resource_group_name}/providers/Microsoft.Network/virtualNetworks/{vnet_name}


resource "azurerm_virtual_network" "main" {
  name                           = "az_vnet_east"
  location                       = var.az_rg_location-east
  resource_group_name            = var.az_rg_east
  address_space                  = ["10.12.0.0/16"]
  dns_servers                    = ["10.12.0.100", "10.12.0.101"]
}

# To import the virtual network 'main1':
# terraform import azurerm_virtual_network.main1 /subscriptions/{subscription_id}/resourceGroups/{resource_group_name}/providers/Microsoft.Network/virtualNetworks/{vnet_name}
resource "azurerm_virtual_network" "main1" {
  name                           = "az_vnet_west"
  location                       = var.az_rg_location-west
  resource_group_name            = var.az_rg_west
  address_space                  = ["10.12.0.0/16"]
  dns_servers                    = ["10.12.0.100", "10.12.0.101"]

}

# To import the virtual network 'main1':
# terraform import azurerm_virtual_network.main1 /subscriptions/{subscription_id}/resourceGroups/{resource_group_name}/providers/Microsoft.Network/virtualNetworks/{vnet_name}
resource "azurerm_virtual_network" "main2" {
  name                           = "az_vnet_asia"
  location                       = var.az_rg_location-asia
  resource_group_name            = var.az_rg_asia
  address_space                  = ["10.12.0.0/16"]
  dns_servers                    = ["10.12.0.100", "10.12.0.101"]

}
# To import the network interface 'main':
# terraform import azurerm_network_interface.main /subscriptions/{subscription_id}/resourceGroups/{resource_group_name}/providers/Microsoft.Network/networkInterfaces/{nic_name}
resource "azurerm_network_interface" "main" {
  name                = "test-nic-east"
  location            = "east us"
  resource_group_name = var.az_rg_east
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.main.id
    private_ip_address_allocation = "Dynamic"
  }
}
# To import the network interface 'main1':
# terraform import azurerm_network_interface.main1 /subscriptions/{subscription_id}/resourceGroups/{resource_group_name}/providers/Microsoft.Network/networkInterfaces/{nic_name}
resource "azurerm_network_interface" "main1" {
  name                = "test-nic-west"
  location            = "west us"
  resource_group_name = var.az_rg_west
  
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.main1.id
    private_ip_address_allocation = "Dynamic"
  }
}
# To import the network interface 'main2':
# terraform import azurerm_network_interface.main1 /subscriptions/{subscription_id}/resourceGroups/{resource_group_name}/providers/Microsoft.Network/networkInterfaces/{nic_name}
resource "azurerm_network_interface" "main2" {
  name                = "test-nic-asia"
  location            = "south india"
  resource_group_name = var.az_rg_asia
  
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.main2.id
    private_ip_address_allocation = "Dynamic"
  }
}
# To import the subnet 'main':
# terraform import azurerm_subnet.main "/subscriptions/{subscription_id}/resourceGroups/{resource_group_name}/providers/Microsoft.Network/virtualNetworks/{vnet_name}/subnets/{subnet_name}"
resource "azurerm_subnet" "main" {
  name                 = "az_subnet_east"
  resource_group_name  = var.az_rg_east
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.12.1.0/24"]
}

output "subnet_id_east" {
    value = "255.255.255.0"
}

# To import the subnet 'main':
# terraform import azurerm_subnet.main "/subscriptions/{subscription_id}/resourceGroups/{resource_group_name}/providers/Microsoft.Network/virtualNetworks/{vnet_name}/subnets/{subnet_name}"
resource "azurerm_subnet" "main1" {
  name                 = "az_subnet_west"
  resource_group_name  = var.az_rg_west
  virtual_network_name = azurerm_virtual_network.main1.name
  address_prefixes     = ["10.12.1.0/24"]
}

output "subnet_id_west" {
    value = "255.255.255.0"
}
# To import the subnet 'main':
# terraform import azurerm_subnet.main "/subscriptions/{subscription_id}/resourceGroups/{resource_group_name}/providers/Microsoft.Network/virtualNetworks/{vnet_name}/subnets/{subnet_name}"
resource "azurerm_subnet" "main2" {
  name                 = "az_subnet_asia"
  resource_group_name  = var.az_rg_asia
  virtual_network_name = azurerm_virtual_network.main2.name
  address_prefixes     = ["10.12.1.0/24"]
}

output "subnet_id_asia" {
    value = "255.255.255.0"
}
