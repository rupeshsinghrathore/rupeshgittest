module "rg" {
  source      = "../module/rg"
  rg-location = var.rg-rg
}

module "vnet" {
  depends_on = [module.rg]
  source     = "../module/vnet"
}

module "subnet" {
  depends_on = [module.vnet]
  source     = "../module/subnet"
  subnet     = var.subnet
}

module "nic" {
  depends_on = [module.subnet]
  source     = "../module/nic"
  nic        = var.nic
}
module "asso" {
  source     = "../module/asso"
  depends_on = [module.nic]
  nic-aso    = var.nic-aso
}
module "nsg" {
  depends_on = [module.rg]
  source     = "../module/nsg"

}
module "vm" {
  depends_on = [module.rg, module.nic]
  source     = "../module/vm"
  vm         = var.vm
}
module "pip" {
  depends_on = [module.rg]
  source     = "../module/pip"
  pip        = var.pip
}