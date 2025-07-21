resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc-terraform-${terraform.workspace}"
  }
}

resource "aws_subnet" "subnet" {
  depends_on = [aws_vpc.vpc]

  count = terraform.workspace == "default" ? 3 : 1

  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.${count.index}.0/24"

  tags = {
    Name = "subnet-terraform-${terraform.workspace}-${count.index}"
  }
}
