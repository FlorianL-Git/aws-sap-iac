# Ansible inventory
resource "local_file" "AnsibleInventory" {
    content = templatefile("${path.module}/inventory.tmpl",
    {
        ascs-hostname = module.ascs.fqdn,
        ascs-ip = module.ascs.ip_address,
        appserver-hostnames = module.appserver.*.fqdn,
        appserver-ips = module.appserver.*.ip_address,
        hdb-hostname = module.hdb.fqdn,
        hdb-ip = module.hdb.ip_address
    }
    )
    filename = "inventory"
}