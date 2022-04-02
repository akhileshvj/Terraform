resource "aws_instance" "Myfirstinstance" {
  count = 3
  ami = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"
  tags = {
    Name = "threedemo"
  }
}