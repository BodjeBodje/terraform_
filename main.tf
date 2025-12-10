
data "aws_ami" "ubuntu-latest" { # Use the latest Amazon Linux 2 AMI
    most_recent = true
    owners     = ["099720109477"] # Canonical
    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"] # Ubuntu 20.04 LTS

    }

    filter {
        name   = "architecture"
        values = ["x86_64"]
    }
}

#-------------------------------------------------
module "ec2_instance" {
    source           = "./ec2-instance" # Path to the EC2 instance module ./ec2-instance
    #ami_value       = "ami-0f5fcdfbd140e4ab7" # Example AMI ID
    ami_value       = data.aws_ami.ubuntu-latest.id # Use the latest Ubuntu AMI
    instance_type   = "t2.micro" # Example instance type
    subnet          = "subnet-0253f715ca47bb3d2" # Example subnet ID
}

# module "vpc" {
#     source = "./vpc_modules" # Path to the VPC module ./vpc_modules
#     cidr   = "10.0.0.0/16" # Example CIDR block for the VPC
#     subnet_cidr = "10.0.1.0/24" # Example CIDR block for the subnet
#     availability_zone = "us-east-2a" # Example availability zone
#     map_public_ip_on_launch = true # Example setting for public IP mapping
#     security_group_name = "main_security_group" # Example security group name
# }