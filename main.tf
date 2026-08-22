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
  key_name = "my-existing-key"
  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install httpd -y
    service httpd start
    chkconfig httpd on
    cd /var/www/html
    echo "<html><body>IP address of this instance: $(hostname)" > index.html
  EOF
  data "aws_security_group" "my-sg" {
    id = "sg-0619036717cd195a5"
  }
  tags = {
    Name = "Web-server"
    description = "testing"
    env = "dev"
  }
} 
