data "aws_availability_zones" "available" {}

data "aws_ami" "cheers"{
  most_recent = true
  owners = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "myInstance" {
  ami = data.aws_ami.cheers.id
  instance_type = "t2.micro"
  availability_zone = data.aws_availability_zones.available.names[1]
  security_groups = var.Security_Group
  tags = {
    Name = "CustomImage"
  }

}
