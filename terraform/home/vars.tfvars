project     = "Jump-Server"
environment = "Staging"

vm_instances = {
  "01" = {
    # VM
    vcpus   = 4
    memory  = 6144
    startup = "order=10"
    vga = {
      memory = 32
    }
  }
}
