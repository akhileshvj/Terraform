resource "aws_instance" "Myfirstinstance" {
  ami = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"
  tags = {
    Name = "demoinstance"
  }
}