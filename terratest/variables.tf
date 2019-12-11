variable "region" {
  description = "The region used to launch this module resources."
  default     = ""
}

variable "slb" {
  description = "The ID of the SLB instance."
  default     = ""
}

variable "name" {
  description = "The name of the server group."
  default     = "terraform-alicloud-slb-server-group"
}
