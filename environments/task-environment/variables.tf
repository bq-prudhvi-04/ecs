
variable "region" {
  description = "The AWS region to create things in."
  default     = "us-east-1"
}

variable "environment" {
  description = "environment name"
  default     = "task"
}

variable "application" {
  description = "Application name"
  default     = "demo"
}

## VPC variables

variable "availability_zone-1" {
  default = "us-east-1a"
}

variable "availability_zone-2" {
  default = "us-east-1b"
}

variable "availability_zone-3" {
  default = "us-east-1c"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_cidr-1" {
  default = "10.0.1.0/24"
}

variable "public_cidr-2" {
  default = "10.0.2.0/24"
}

variable "private_cidr-1" {
  default = "10.0.3.0/24"
}

variable "private_cidr-2" {
  default = "10.0.4.0/24"
}

variable "private_cidr-3" {
  default = "10.0.5.0/24"
}

## EC2-WEBSERVER-AUTO-SACLE

variable "image_id" {
  default = "ami-0fe19057e9cb4efd8"
}

variable "instance_type" {
  default = "t2.micro"

}


variable "key_name" {
  description = "select the key pair"
  default     = "demo"
}

#########
#ALB variables 
variable "ec2_count" {

  default = "3"

}
