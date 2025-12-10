/*
output "instance_id" {
    description = "ID of the EC2 instance"
    value       = aws_instance.instance.id
}*/

output "public_ip" {
    description = "Public IPv4 address of the EC2 instance"
    value       = [for instance in aws_instance.example_instance: instance.public_ip]
}

/*
output "public_dns" {
    description = "Public DNS name of the EC2 instance"
    value       = aws_instance.instance.public_dns
}*/

output "private_ip" {
    description = "Private IPv4 address of the EC2 instance"
    value       = [for instance in aws_instance.example_instance: instance.private_ip]
    #sensitive   = false
}

/*
output "availability_zone" {
    description = "AZ where the EC2 instance is running"
    value       = aws_instance.instance.availability_zone
}

output "instance_type" {
    description = "EC2 instance type"
    value       = aws_instance.instance.instance_type
}

output "ami" {
    description = "AMI used for the EC2 instance"
    value       = aws_instance.instance.ami
}

output "vpc_security_group_ids" {
    description = "List of VPC security group IDs attached to the instance"
    value       = aws_instance.instance.vpc_security_group_ids
}

output "tags" {
    description = "Tags assigned to the EC2 instance"
    value       = aws_instance.instance.tags
}*/