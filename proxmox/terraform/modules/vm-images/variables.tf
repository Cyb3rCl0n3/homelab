variable "vmid" {
  type        = number
}

variable "name" {
  type        = string
}

variable "image_filename" {
  type        = string
}

variable "cores" {
  type    = number
  default = 2
}

variable "memory" {
  type    = number
  default = 2048
}

variable "disk_size" {
  type    = number
  default = 20
}
