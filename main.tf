resource "azurerm_resource_group" "example" {
  name     = "akstest"
  location = "West Europe"

}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "moaks"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "moaks"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"


  }

  identity {

    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "kubenet"
  }
}
