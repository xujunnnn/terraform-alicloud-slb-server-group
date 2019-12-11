variable "region" {
  description = "The region used to launch this module resources."
  default     = ""
}

variable "slb" {
  description = "The ID of the SLB instance."
}

variable "name" {
  description = "The name of the server group."
  default     = "terraform-alicloud-slb-server-group"
}

variable "servers" {
  description = "A list of ECS instances to be added. It contains three sub-fields as: server_ids(A list backend server ID), port(The port used by the backend server.), weight(Weight of the backend server), type(Type of the backend server. Valid value ecs, eni. Defa.ult to ecs)"
  type        = list(map(string))
}


