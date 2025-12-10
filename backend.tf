terraform {
    required_version = ">= 1.0.0"
    backend "s3" {
            
        bucket         = "class24-tfstate-lock" # S3 bucket name for storing the state file
        key            = "module/terraform.tfstate" # Path within the S3 bucket to the state file
        region         = "us-east-2"
        dynamodb_table = "class24_tfstate_lock" # DynamoDB table for state locking
}
}