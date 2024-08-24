variable "vm_instances" {
  description = "Specific values for this or these virtual machines."
  type = map(object({
    # Project
    state    = optional(string)
    priority = optional(number)

    # VM
    ## General
    target_node = optional(string)
    name        = optional(string)
    vmid        = optional(number)
    bios        = optional(string)
    onboot      = optional(bool)
    startup     = optional(string)
    vm_state    = optional(string)
    protection  = optional(bool)
    description = optional(string)
    pool        = optional(string)

    ## Clone
    os_type      = optional(string)
    clone        = optional(string, "ubuntu-24-04-desktop-standard")
    full_clone   = optional(bool)
    force_create = optional(bool)

    ## OS
    tablet  = optional(bool)
    boot    = optional(string)
    agent   = optional(number)
    qemu_os = optional(string)
    numa    = optional(bool)
    hotplug = optional(string)
    scsihw  = optional(string)
    tags    = optional(string)
    vga = optional(object({
      type   = optional(string)
      memory = optional(number)
    }))

    ## CPU
    cpu     = optional(string)
    sockets = optional(number)
    cores   = optional(number)
    vcpus   = optional(number)

    ## Memory
    memory  = optional(number)
    balloon = optional(number)

    ## Networks
    define_connection_info = optional(bool)
    os_network_config      = optional(string)

    networks = optional(map(object({
      model    = optional(string)
      bridge   = optional(string)
      tag      = optional(number)
      firewall = optional(bool)
      macaddr  = optional(string)
    })))

    ## High Availability
    hagroup = optional(string)
    hastate = optional(string)

    ## Hard Disk
    disks = optional(object({
      scsi = object({
        # disk0 (required)
        scsi0 = object({
          disk = list(object({
            backup     = optional(bool)
            cache      = optional(string)
            discard    = optional(bool)
            emulatessd = optional(bool)
            format     = optional(string)
            iothread   = optional(bool)
            replicate  = optional(bool)
            size       = optional(string)
            storage    = optional(string)
          }))
        })

        # disk1 (optional)
        scsi1 = optional(object({
          disk = optional(list(object({
            backup     = optional(bool)
            cache      = optional(string)
            discard    = optional(bool)
            emulatessd = optional(bool)
            format     = optional(string)
            iothread   = optional(bool)
            replicate  = optional(bool)
            size       = optional(string)
            storage    = optional(string)
          })), [])
        }), {})

        # disk2 (optional)
        scsi2 = optional(object({
          disk = optional(list(object({
            backup     = optional(bool)
            cache      = optional(string)
            discard    = optional(bool)
            emulatessd = optional(bool)
            format     = optional(string)
            iothread   = optional(bool)
            replicate  = optional(bool)
            size       = optional(string)
            storage    = optional(string)
          })), [])
        }), {})

        # disk3 (optional)
        scsi3 = optional(object({
          disk = optional(list(object({
            backup     = optional(bool)
            cache      = optional(string)
            discard    = optional(bool)
            emulatessd = optional(bool)
            format     = optional(string)
            iothread   = optional(bool)
            replicate  = optional(bool)
            size       = optional(string)
            storage    = optional(string)
          })), [])
        }), {})

        # init-cloud drive (optional)
        scsi10 = optional(object({
          cloudinit = optional(list(object({
            storage = optional(string)
          })), [])
        }), {})

      })
    }))

    ## Cloud Init
    cloud_init = optional(object({
      cicustom     = optional(string)
      ciuser       = optional(string)
      ci_wait      = optional(number)
      cipassword   = optional(string)
      searchdomain = optional(string)
      nameserver   = optional(string)
      sshkeys      = optional(string)
      ipconfig0    = optional(string)
      ipconfig1    = optional(string)
      ipconfig2    = optional(string)
      ipconfig3    = optional(string)
      ipconfig4    = optional(string)
      ipconfig5    = optional(string)
      ipconfig6    = optional(string)
      ipconfig7    = optional(string)
      ipconfig8    = optional(string)
      ipconfig9    = optional(string)
      ipconfig10   = optional(string)
      ipconfig11   = optional(string)
      ipconfig12   = optional(string)
      ipconfig13   = optional(string)
      ipconfig14   = optional(string)
      ipconfig15   = optional(string)
    }))

  }))
}
