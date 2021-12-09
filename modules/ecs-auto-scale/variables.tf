variable "instance_type" {}

variable "image_id" {}

variable "security_groups" {
    type = string
}

variable "private_subnet" {
    type = list(string)
}


variable "key_name" {}

variable "aws_lb_target_group" {
  
}
  