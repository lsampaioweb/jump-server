variable "project" {
  description = "The name of the project e.g Firewall or Load Balancer."
  type        = string

  validation {
    condition     = length(var.project) >= 3
    error_message = "The project name must have at least 3 characters."
  }
}

variable "environment" {
  description = "The name of the environment e.g Staging or Production."
  type        = string

  validation {
    condition     = length(regexall("[^a-zA-Z0-9-]", var.environment)) == 0
    error_message = "The environment name must only contain letters, numbers, and hyphens."
  }
}

variable "vm_instances" {
  description = "Specific values for this or these virtual machines."
  type = map(object({
    # VM
    ## General
    target_node = optional(string)
    name        = optional(string)
    vmid        = optional(number)
    description = optional(string)
    bios        = optional(string)
    onboot      = optional(bool, true)
    startup     = optional(string)
    oncreate    = optional(bool)
    pool        = optional(string)

    ## Clone
    os_type      = optional(string)
    clone        = optional(string, "ubuntu-22-04-desktop-standard")
    full_clone   = optional(bool)
    force_create = optional(bool)

    # ## OS
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
    }), {})

    ## CPU
    cpu     = optional(string)
    sockets = optional(number)
    cores   = optional(number)
    vcpus   = optional(number)

    ## Memory
    memory  = optional(number)
    balloon = optional(number)

    ## Hard Disk
    disks = optional(map(object({
      type      = optional(string)
      storage   = optional(string)
      size      = optional(string)
      format    = optional(string)
      cache     = optional(string)
      backup    = optional(bool)
      iothread  = optional(number)
      replicate = optional(number)
      ssd       = optional(number)
      discard   = optional(string)
      })), {
      "01" = {}
    })

    ## Networks
    networks = optional(map(object({
      model    = optional(string)
      bridge   = optional(string)
      tag      = optional(number)
      firewall = optional(bool)
      macaddr  = optional(string)
      })), {
      "01" = {}
    })

    ## High Availability
    hagroup = optional(string)
    hastate = optional(string)
  }))
}
