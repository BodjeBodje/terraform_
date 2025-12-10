
#create your first ec2 instance
resource "aws_instance" "example_instance" {
    count = var.instance_count
    ami =           var.ami
    instance_type = var.instance_type
    key_name =      var.key_name

    #connection block for SSH access
    connection {
      type        = "ssh" #Connection type
      user        = var.user#"ubuntu" #Your instance's SSH user
      private_key = file(var.key_pem_path) #Your private key path here
      host        = self.public_ip

    }

    #tags for the instance
    tags = {
      Name  = "web-server-${count.index + 1}"
      Env   = "dev"
      App   = "Fin"
    }

    #local-exec provisioner to run commands on the local machine after the instance is created
    provisioner "local-exec" {
      command = "echo ${self.private_ip} >> resource.txt"
    }

    # remote-exec provisioner to run commands on the instance after it's created
    provisioner "remote-exec" {
      inline = [
        "sudo apt update -y", #Update package lists
        "sudo apt install nginx -y" #Install Nginx web server and start the service automatically. Copy your public ip address and paste it into your web browser (like http://<public_ip>) to see the Nginx welcome page.
        #"sudo systemctl start nginx"
      ]
    }

    # provisioner "file" {
    #   source      = "index.html" #Make sure you have an index.html file in the same directory as your terraform files.
    #   destination = "/var/www/html/index.html"
    # }
    # file copying  provisioner to copy a file from local machine to the instance
    provisioner "file" {
      source      = var.src
      destination = var.dest
    }


}