resource "aws_vpc" "main_vpc" {
    cidr_block = var.cidr
}

resource "aws_subnet" "main_subnet" {
    vpc_id     = aws_vpc.main_vpc.id # Associate subnet with the VPC created above ("aws_vpc" "main_vpc")
    cidr_block = var.subnet_cidr
    availability_zone = var.availability_zone
    map_public_ip_on_launch = var.map_public_ip_
}

resource "aws_internet_gateway" "main_igw" {
    vpc_id = aws_vpc.main_vpc.id # Attach IGW to the VPC created above ("aws_vpc" "main_vpc")
}
resource "aws_route_table" "main_route_table" {
    vpc_id = aws_vpc.main_vpc.id # Associate route table with the VPC created above ("aws_vpc" "main_vpc")
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = internet_gateway.main_igw.id # Route traffic to IGW created above 
    }
}

resource "aws_route_table_association" "a" {
    subnet_id      = aws_subnet.main_subnet.id # Associate route table with the subnet created above ("aws_subnet" "main_subnet")
    route_table_id = aws_route_table.main_route_table.id # Associate route table with the route table created above ("aws_route_table" "main_route_table")
}

resource "aws_security_group" "main_sg" {
    name        = var.security_group_name
    # description = "Allow HTTP and SSH inbound traffic"
    vpc_id      = aws_vpc.main_vpc.id # Associate security group with the VPC created above ("aws_vpc" "main_vpc")
    ingress {
        description = "HTTP from anywhere"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks  = ["0.0.0.0/0"]
    }

    ingress {
        description = "ssh from anywhere"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks  = ["0.0.0.0/0"]
    }

    egress {
        description = "All outbound traffic"
        from_port   = 0
        to_port     = 0
        protocol    = "tcp"
        cidr_blocks  = ["0.0.0.0/0"]

    }
}