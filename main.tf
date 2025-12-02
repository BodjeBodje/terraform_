module "ec2_instance" {
    source           = "./ec2-instance" # Path to the EC2 instance module ./ec2-instance
    ami_value       = "ami-0f5fcdfbd140e4ab7" # Example AMI ID
    instance_type   = "t2.micro" # Example instance type
    subnet          = "subnet-0253f715ca47bb3d2" # Example subnet ID
}

module "vpc" {
    source = "./vpc_modules" # Path to the VPC module ./vpc_modules
    cidr   = "10.0.0.0/16" # Example CIDR block for the VPC
    subnet_cidr = "10.0.1.0/24" # Example CIDR block for the subnet
    availability_zone = "us-east-2a" # Example availability zone
    map_public_ip_on_launch = true # Example setting for public IP mapping
    security_group_name = "main_security_group" # Example security group name
}