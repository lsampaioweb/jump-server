project     = "Jump-Server"
environment = "Staging"

vm_instances = {
  "01" = {
    # VM
    vmid    = 1000
    vcpus   = 4
    memory  = 6144
    startup = "order=10"
    vga = {
      memory = 32
    }

    disks = {
      scsi = {
        # disk0 (required)
        scsi0 = {
          disk = [{}]
        }
        # disk1 (optional)
        scsi1 = {
          disk = [{
            size    = "15G"
            storage = "Ceph_Gold"
          }]
        }
        # cloud-init disk (optional)
        # scsi10 = {
        #   cloudinit = [{}]
        # }
      }
    }
  }
}
