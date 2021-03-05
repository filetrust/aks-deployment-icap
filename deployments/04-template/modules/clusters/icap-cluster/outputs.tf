output "resource_group" {
	value = azurerm_resource_group.resource_group.name
}

output "cluster_name" {
	value = azurerm_kubernetes_cluster.icap-deploy.name
}

output "cluster_dns" {
	value = azurerm_kubernetes_cluster.icap-deploy.dns_prefix
}

output "client_key" {
    value = azurerm_kubernetes_cluster.icap-deploy.kube_config.0.client_key
}

output "client_certificate" {
    value = azurerm_kubernetes_cluster.icap-deploy.kube_config.0.client_certificate
}

output "cluster_ca_certificate" {
    value = azurerm_kubernetes_cluster.icap-deploy.kube_config.0.cluster_ca_certificate
}

output "cluster_username" {
    value = azurerm_kubernetes_cluster.icap-deploy.kube_config.0.username
}

output "cluster_password" {
    value = azurerm_kubernetes_cluster.icap-deploy.kube_config.0.password
}

output "kube_config" {
    value = azurerm_kubernetes_cluster.icap-deploy.kube_config_raw
}
