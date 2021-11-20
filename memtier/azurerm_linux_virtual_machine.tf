resource "azurerm_linux_virtual_machine" "redisgeek" {
  name                = format("memtier-vm-%s", var.random_id)
  resource_group_name = data.azurerm_resource_group.redisgeek.name
  location            = data.azurerm_resource_group.redisgeek.location
  size                = "Standard_D48ds_v4"
  admin_username      = "adminuser"
  custom_data         = data.template_cloudinit_config.cloud_init.rendered
  network_interface_ids = [
    azurerm_network_interface.redisgeek.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  tags = data.azurerm_resource_group.redisgeek.tags
}