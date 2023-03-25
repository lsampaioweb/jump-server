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
