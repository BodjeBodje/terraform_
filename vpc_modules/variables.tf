variable "cidr" {
    description = "The CIDR block for the VPC"
    type        = string
}

variable "subnet_cidr" {
    description = "The CIDR block for the subnet"
    type        = string
}

variable "availability_zone" {
    description = "The availability zone for the subnet"
    type        = string
}

variable "map_public_ip_" {
    description = "Whether to assign a public IP on launch"
    type        = bool
    default     = true
}

variable "security_group_name" {
    description = "The name of the security group"
    type        = string
    default     = "web-sg"
}