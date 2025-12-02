resource "aws_instance" "server" {
    ami           = var.ami_value
    instance_type = var.instance_type
    subnet_id     = var.subnet
}