project     = "JumpServer"
environment = "Staging"

vm_instance = {
  "01" = {
    # VM
    vcpus   = 3
    startup = "order=2000"
    networks = {
      "01" = {
        tag = 100
      }
    }
    vga = {
      memory = 32
    }
  }
}
