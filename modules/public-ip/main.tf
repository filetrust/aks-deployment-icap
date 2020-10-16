
resource "azurerm_public_ip" "public_ip" {
  name                = "${var.service_name}-public-ip"
  location            = var.region
  resource_group_name = var.resource_group
  sku 				  = "standard"
  allocation_method   = "Static"
  tags = {
    org          = var.organisation
    environment  = var.environment
    service_name = var.service_name    
    service_type = var.service_type
  }
}
