terraform{
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
    
  }
}
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web_server" {
  ami = "ami-0ac7b260cf76d8865"
  instance_type = "t2.micro"
  tags = {
    Name = "Web-server"
  }
} 
