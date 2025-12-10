1. Install terraform
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

2. Terraform providers
https://registry.terraform.io/providers/hashicorp/aws/latest
    terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.22.1"
    }
  }
}

provider "aws" {
    region = "us-east-1" #use your region
  # Configuration options
}


3. Terraform init
terraform init
and 
    Test your terraform
    #terraform validate

    Plan terraform
    #terraform plan

    Run terraform 
    #terraform apply

    Destroy terraform.tfstate
    #terraform destroy OR terraform destroy --auto-approve


Add keypair:
  Create file to your project here and copy your key pair content from path an past in your new file key pair like ubuntu-keypair.pem
---------------------------------------------
Key concepts
  - provider - Plugin that let tf talk to services
  - Resources - infra components defined with IaC
  - Sate -How tf keeps track of what it created in a file called state file

  Provisioners - used to execute scripts on a local or remote machine as part of resource creation or destruction.
    local-exec - runs commands on the machine where tf is executed
    remote-exec - runs commands on the remote resource being created (like EC2 instance)
    file - used to copy files from local machine to remote resource (like EC2 instance)
  - Variables - input variables to make tf code dynamic and reusable
  - Outputs - used to extract and display information about your infrastructure after it has been created.
  - Modules - container for multiple resources that are used together.  
    you write module once and reuse it multiple times.
    use variables to pass values into module and outputs to get values out of module.
  - Backend - where tf state is stored. Local or remote (S3, Terraform Cloud, etc)
  - Workspaces - allow you to manage multiple instances of a single tf configuration. Each workspace has its own state file.
4. Useful terraform commands
    terraform fmt  - to format the code
    terraform validate - to validate the code
    terraform plan - to see what changes will be made
    terraform apply - to apply the changes
    terraform destroy - to destroy the infrastructure
5. Useful links
  - https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-get-started
  - https://registry.terraform.io/providers/hashicorp/aws/latest/docs
  - https://www.terraform.io/docs/language/index.html
  - https://www.terraform.io/docs/cli/index.html
  - https://www.terraform.io/docs/language/resources/provisioners/index.html
  - https://www.terraform.io/docs/language/values/variables.html
  - https://www.terraform.io/docs/language/values/outputs.html
  - https://www.terraform.io/docs/language/modules/index.html
  - https://www.terraform.io/docs/language/state/index.html
  - https://www.terraform.io/docs/language/workspaces/index.html
  - https://learn.hashicorp.com/collections/terraform/aws-get-started
