terraform {
  backend "s3" {
    bucket = "s3bucketforeksterraform"      # Replace with your actual S3 bucket name
    key    = "EKS/terraform.tfstate"
    region = "ap-south-1"
  }
}
