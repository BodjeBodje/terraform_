variable "ami_value" {
    description = "AMI ID to use for the EC2 instance"
    type        = string
}

variable "instance_type" {
    description = "EC2 instance type"
    type        = string
}

variable "subnet" {
    description = "Subnet ID to launch the EC2 instance in"
    type        = string
}