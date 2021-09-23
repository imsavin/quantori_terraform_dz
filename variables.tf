variable "aws_region" {us-west-1}
variable "aws_key_name" {"SavinCloudLab"}
variable "public_az" {us-west-1a}
variable "private_az" {us-west-1b}

## VPC
variable "vpc_1_cidr" {
    description = "CIDR for the whole VPC"
    default = "172.20.0.0/16"
}

variable "vpc_2_cidr" {
    description = "CIDR for the whole VPC"
    default = "172.21.0.0/16"
}

variable "vpc_1_cidr_public" {
    description = "CIDR for the Public subnet"
    default = "172.20.0.0/24"
}

variable "vpc_2_cidr_private" {
    description = "CIDR for the Private subnet"
    default = "172.20.1.0/24"
}

variable "vpc_1_cidr_public" {
    description = "CIDR for the Public subnet"
    default = "172.21.0.0/24"
}

variable "vpc_2_cidr_private" {
    description = "CIDR for the Private subnet"
    default = "172.21.1.0/24"
}
