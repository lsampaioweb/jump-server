project     = "Jump-Server"
environment = "Production"

vm_instances = {
  "01" = {
    # VM
    vcpus   = 3
    startup = "order=10"
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
