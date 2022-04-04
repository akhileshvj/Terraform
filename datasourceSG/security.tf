data "aws_ip_ranges" "us_east" {
  regions = ["us-east-1","us-east-2"]
  services = ["ec2"]
}

resource "aws_security_group" "MyfirstSec" {
  name = "MyfirstSec"

  ingress {
    from_port = 443
    protocol  = "TCP"
    to_port   = 443
    cidr_blocks = data.aws_ip_ranges.us_east.cidr_blocks
  }
  tags = {
    CreateDate = data.aws_ip_ranges.us_east.create_date
    SyncToken = data.aws_ip_ranges.us_east.sync_token
  }
}