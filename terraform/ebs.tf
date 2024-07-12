# Create EBS Volume A
resource "aws_ebs_volume" "volume_a" {
  availability_zone = "us-east-1a"
  size              = 20
  type              = "gp2"
  tags = {
    Name = "B07-ebs-A"
  }
}

# Create EBS Volume B
resource "aws_ebs_volume" "volume_b" {
  availability_zone = "us-east-1b"
  size              = 20
  type              = "gp2"
  tags = {
    Name = "B07-ebs-B"
  }
}
