Modules link

https://registry.terraform.io/namespaces/terraform-aws-modules

github

https://github.com/terraform-aws-modules
https://github.com/cloudposse

CREATE DYNAMODB

aws dynamodb create-table \
  --table-name class24_tfstate_lock \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST

  a. Create backend.tf

    terraform {
    required_version = ">= 1.0.0"
    backend "s3" {
            
        bucket         = "class24-tfstate-lock"
        key            = "module/terraform.tfstate" 
        region         = "us-east-2"
        dynamodb_table = "class24_tfstate_lock"  #table name class24_tfstate_lock
}
}

b. Create S3 backet on aws
    bucket : class24-tfstate-lock

c. Go aws check your dynamodb and bucket if you file is created or not, and try to destroy terraform file from server.
