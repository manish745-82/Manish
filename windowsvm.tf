resource "azurerm_windows_virtual_machine" "main" {
  name                = "winvm-east"
  resource_group_name = var.az_rg_east
  location            = var.az_rg_location-east
  size                = "Standard_B1s"
  admin_username      = "azureuser"
  admin_password      = "P@ssword1234!"
  network_interface_ids = [azurerm_network_interface.main.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "winvm-osdisk"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}
resource "azurerm_windows_virtual_machine" "main1" {
  name                = "winvm-west"
  resource_group_name = var.az_rg_west
  location            = var.az_rg_location-west
  size                = "Standard_B1s"
  admin_username      = "azureuser"
  admin_password      = "P@ssword1234!"
  network_interface_ids = [azurerm_network_interface.main1.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "winvm-osdisk"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"

  }
}