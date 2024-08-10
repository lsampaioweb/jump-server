project     = "Jump-Server"
environment = "Home"

vm_instances = {
  "01" = {
    # VM
    vcpus   = 3
    startup = "order=10"
    networks = {
      "01" = {
        tag = 101
      }
    }
    vga = {
      memory = 32
    }
  }
}
