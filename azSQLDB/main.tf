resource "azurerm_resource_group" "main" {
    name     = "MyDB-RG"
    location = var.location
}

resource "azurerm_sql_server" "main" {
    name                         = var.sqlname
    resource_group_name          = "${azurerm_resource_group.main.name}"
    location                     = "${azurerm_resource_group.main.location}"
    version                      = "12.0"
    administrator_login          = "4dm1n157r470r"
    administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

resource "azurerm_sql_firewall_rule" "main" {
  name                = "AlllowAzureServices"
  resource_group_name = "${azurerm_resource_group.main.name}"
  server_name         = "${azurerm_sql_server.main.name}"
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "255.255.255.255"
}

resource "azurerm_sql_database" "main" {
  name                             = var.sqlname
  resource_group_name              = "${azurerm_resource_group.main.name}"
  location                         = "${azurerm_resource_group.main.location}"
  server_name                      = "${azurerm_sql_server.main.name}"
  edition                          = "Standard"
  requested_service_objective_name = "S0"
}