terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-0431" # Replace with your bucket
    key            = "ec2/terraform.tfstate"
    region         = var.aws_region
    encrypt        = true
    use_locking    = true   # <-- Native state locking (Terraform v1.10+)
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "example" {
  ami           = "ami-02d26659fd82cf299" # ubuntu (ap-south-1)
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-EC2"
  }
}
