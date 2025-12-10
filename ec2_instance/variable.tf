# AWS region variable
variable "aws_region" {
    description = "AWS region to create resources in"
    type        = string
    default     = "us-east-1"
}

# Instance count variable
variable "instance_count" {
    description = "This is the number count of the instance"
    default     = "2"
}

# AMI ID variable
variable "ami" {
    description = "AMI ID to use for the EC2 instance (no default; set via tfvars or CLI)"
    type        = string
    default =   "ami-0f5fcdfbd140e4ab7"
}

# Instance type variable
variable "instance_type" {
    description = "EC2 instance type"
    type        = string
    default     = "t2.micro"
}

# Key pair name variable
variable "key_name" {
    description = "Name of the EC2 key pair for SSH access (optional)"
    type        = string
    default     = "ubuntu-keypair" #Your key pair name here and make sure the key pair is created in the specified region
}

variable "user" {
    description = "This is the ssh user name for ec2 instance"
    type        = string
    default     = "ubuntu"
}

variable "key_pem_path"{
    description = "Path to the private key file for SSH access (optional)"
    type        = string
    default     = "/home/ubuntu/teraform/ec2_instance/ubuntu-keypair.pem" #Your private key path here
}
# Copy file provisioner variables
variable "src" {
    description = "Source file path to be copied to the instance"
    type        = string
    default     = "/home/ubuntu/teraform/ec2_instance/resource.txt" # Your source file path here, like you principal server and you want to copy this file to the ec2 instance
}

variable "dest"{
    description = "Destination file path on the instance"
    type        = string
    default     = "/home/ubuntu/resource.txt" # Your destination file path here, like you want to copy the source file to this path on ec2 instance
}

# Additional variables for security groups and IAM roles
variable "vpc_security_group_ids" {
    description = "List of security group IDs to attach to the instance"
    type        = list(string)
    default     = []
}

variable "iam_instance_profile" {
    description = "IAM instance profile name or ARN to attach to the instance (optional)"
    type        = string
    default     = ""
}

variable "tags" {
    description = "Tags to apply to the EC2 instance and related resources"
    type        = map(string)
    default = {
        Name        = "terraform-ec2-instance"
        Environment = "dev"
        Owner       = "team"
    }
}