# main.tf

module "util" {
  source            = "./util"
}

module "libvirt" {
  source            = "./libvirt"
  hostnames         = var.hostnames
  libvirt_admin     = var.libvirt_admin
  libvirt_ip        = var.libvirt_ip
  latitude          = var.latitude
  longitude         = var.longitude
  token             = var.token
  clustername       = var.clustername
}

module "volterraedge" {
  source = "./volterraedge"
#  depends_on = [
#    module.libvirt.vm1,
#    module.libvirt.vm2,
#    module.libvirt.vm3
#  ]
  VES_P12_PASSWORD  = var.VES_P12_PASSWORD
  VOLT_API_KEY      = var.VOLT_API_KEY
  VOLT_API_CERT     = var.VOLT_API_CERT
  VOLT_API_P12_FILE = var.VOLT_API_P12_FILE
  namespace         = var.namespace
  projectName       = var.projectName
  projectPrefix     = module.util.env_prefix
  tenant            = var.tenant
  clustername       = var.clustername
  hostnames         = var.hostnames
  latitude          = var.latitude
  longitude         = var.longitude
  token             = var.token
}
