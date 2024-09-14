project     = "Jump-Server"
environment = "Staging"

vm_instances = {
  "01" = {
    # VM
    target_node = "edge-pve-01"
    vmid        = 1000
    vcpus       = 4
    memory      = 6144
    startup     = "order=10"
    vga = {
      type   = "virtio-gl"
      memory = 256
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
            size    = "20G"
            storage = "Ceph_Gold"
          }]
        }
        # cloud-init disk (optional)
        # Can be removed after the VM is created.
        # scsi10 = {
        #   cloudinit = [{}]
        # }
      }
    }

    networks = {
      "01" = {
        bridge  = "vmbr101"
        macaddr = "6E:4C:7C:0B:7D:79"
      }
    }
  }
}
