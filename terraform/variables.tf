variable "aws_region"{
    description = "Aws Region for cluster"
    type = string
    default = "ap-south-1"
}

variable "environment" {
    description = "Environment"
    type = string
    default = "devops"
  
}

variable "cluster_name" {
    description = "This contains eks cluster name"
    type = string
    default = "devsecops-eks"
  
}

variable "cluster_version" {
    type = string
    default = "1.32"
  
}

variable "vpc_cidr" {
    description = "Cidr range for vpc"
    type = string
    default = "192.168.0.0/16"
}