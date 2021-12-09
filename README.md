# Prerequisites

Knowledge in AWS cloud and Terraform modules.

Terraform version used is v1.0.11 For running code, the platform used is Ubuntu:20.04

# Installation instructions for terraform
Download terraform from the official site based on your platform. In this project, I have used the ubuntu:18.04 version platform.

In Ubuntu, installation steps follow.
```
 wget https://releases.hashicorp.com/terraform/1.0.11/terraform_1.0.11_linux_amd64.zip
 unzip terraform_1.0.11_linux_amd64.zip
 mv terraform /usr/bin/
 #check for terraform version   
 terraform version
 ```

# Project Explanation
This Project creates an AWS infrastructure with the help of Terraform tool.

AWS infrastructure created are VPC, Security Group, Auto Scaling Group, and Load Balancer. 

NGINX Webserver was created with an auto-scaling group with help of a launch template. The Nginx web servers are launched under private subnets.

To access this Nginx web server application load balancer is used.

Coming to Terraform code, each AWS infrastructure resource is declared in the form of Modules. The main terraform code file is in the environments/task-environment folder.
    
Each Module resource is explained below

# VPC Module

It creates a new VPC with two public, three private subnets, a public route table, a private route table, IGW, NAT Gateway, and Elastic IP. CDIR blocks for VPC, public and private subnets are mentioned in variables.tf file

Public subnets are attached to the Default Public route table and the internet gateway is attached to it

Private subnets are attached to the Private route table and nat gateway is attached for internet connection.

NAT gateway is created in the public subnet and Elastic IP is attached to it.


# Security Groups Module
A Web server security group with inbound rule ports 80 and 443 are opened to anywhere IPV4 address and outbound rule, all ports are opened to anywhere.

# EC2-Web Server-auto-scale 

It creates an EC2 instance of Ubuntu:20.04 version on top of it, Nginx web server is installed. In this module web server is created with an auto-scaling group with a launch template that has predefined user data of Nginx web server installation configuration.

Auto-scaling of web servers is done by targeting by CPU utilization metric.

# Load balancer module
 
 An Application load balancer is created with a target group that is attached to the Autoscaling module, which listens at port 80 HTTP protocol.


 # How to run this Project
Create a workspace or a folder and pull the above code to that folder.
First, configure the AWS credentials in your server, or U can directly pass credentials in the AWS provider section in provider.tf file like shown below.
```
provider "aws" {
  region = "us-west-2"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}
```
Go to the environments/task-environment folder and run the following terraform lifecycle commands to create AWS infrastructure 

1) Terraform init command will download the provider plugins of the latest version.
```
terraform init
```
2) Terraform fmt command will Terraform configuration files to a canonical format and style
```
terraform fmt
```
3) Terraform validate command will validate the configuration files in a directory and check for any errors in code.
```
terraform validate
```
4) Terraform plan command creates an execution plan, it is like a dry run mode that shows which resources will be created.
```
terraform plan
```
5) This command will create the following resources, which are mentioned above.
```
terraform apply --auto-approve
``` 




