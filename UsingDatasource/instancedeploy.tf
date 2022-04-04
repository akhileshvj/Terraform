data "aws_availability_zones" "available" {}

data "aws_ami" "cheers"{
  most_recent = true
  owners = ["063491364108"]
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "myInstance" {
  ami = data.aws_ami.cheers.id
  instance_type = "t2.micro"
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "CustomImage"
  }

}
