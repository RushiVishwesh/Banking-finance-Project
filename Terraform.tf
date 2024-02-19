provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAT2TTRW233LHWBVNJ"
  secret_key = "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"
}

resource "aws_security_group" "Project_sg" {
  name = "Project_sg"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "Project" {
  ami             = "ami-0a7cf821b91bcccbc"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.Project_sg.name]
  key_name        = "Project"
  count           = 6
}