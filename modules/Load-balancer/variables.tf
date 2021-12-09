variable "vpc_id" { }

variable "instance_id" {
    
    type = list(string)
    default = []
  
}

variable "public_subnet" {
  
      type = list(string)

}

variable "ec2_count" {}

variable "security_groups" {
    type = string
  
}