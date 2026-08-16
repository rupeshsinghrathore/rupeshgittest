rg-rg = {
  rg1 = {
    name     = "chnadu"
    location = "centralIndia"
  }
    rg2 = {
    name     = "rupesh"
    location = "centralIndia"
  }
}
subnet = {
  sub1 = {
    name    = "frontend-sub"
    address = ["10.10.10.0/24"]
  }
  sub2 = {
    name    = "backend-sub"
    address = ["10.10.20.0/24"]
  }
}

nic = {
  nic1 = {
    name        = "frontend-nic"
    pip-name    = "frontend-pip"
    subnet-name = "frontend-sub"
  }
  nic2 = {
    name        = "backend-nic"
    pip-name    = "backend-pip"
    subnet-name = "backend-sub"

  }
}
nic-aso = {
  aso1 = {
    nic = "frontend-nic"
  }
  aso2 = {
    nic = "backend-nic"
  }
}
vm = {
  vm1 = {
    name = "frontend-vm"
    nic  = "frontend-nic"
  }
  vm2 = {
    name = "backend-vm"
    nic  = "backend-nic"
  }
}
pip = {
  pip1 = {
    name = "frontend-pip"
  }
  pip2 = {
    name = "backend-pip"
  }
}