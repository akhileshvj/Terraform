variable "AWS_ACCESS_KEY" {
  type = string
  default = "AKIAQSWJMMZ4QKFPBZ7J"
}
variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "us-east-1"
}
variable "Security_Group"{
  type = any
  default = "MyfirstSec"
}
variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-04505e74c0741db8d"
    us-west-2 = "ami-0352d5a37fb4f603f"
    us-west-1 = "ami-0f40c8f97004632f9"
  }
}


