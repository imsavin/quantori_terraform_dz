#aws_region = "us-east-1"

#variable "aws_key_name" = "SavinCloudLab" 

#variable "public_az" "us-east-1a"

#variable "private_az"= "us-east-1b"

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

variable "vpc_1_cidr_private" {
    description = "CIDR for the Private subnet"
    default = "172.20.1.0/24"
}

variable "vpc_11_cidr_private" {
    description = "CIDR for the Private subnet"
    default = "172.20.5.0/24"
}


variable "vpc_2_cidr_public" {
    description = "CIDR for the Public subnet"
    default = "172.21.0.0/24"
}

variable "vpc_2_cidr_private" {
    description = "CIDR for the Private subnet"
    default = "172.21.1.0/24"
}

variable "vpc_3_cidr_public" {
    description = "CIDR for the Public subnet"
    default = "172.20.10.0/24"
}