resource "aws_vpc" "vpc" {
  provider   = aws.useast
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc-terraform"
  }

  # lifecycle {
  #   create_before_destroy = true # Garante que o VPC seja criado antes de destruir o antigo
  #   ignore_changes = [cidr_block] # Ignora mudanças no cidr_block após a criação
  #   prevent_destroy = true # Evita a destruição acidental do VPC
  #   replace_triggered_by = [ aws_subnet.subnet_counter ] # Garante que a criação de sub-redes force a recriação do VPC
  # }
}

resource "aws_subnet" "subnet_counter" {
  provider   = aws.useast
  depends_on = [aws_vpc.vpc]
  count      = 3

  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.${count.index}.0/24"

  tags = {
    Name = "subnet-terraform-${count.index}"
  }
}

resource "aws_subnet" "subnet_foreach" {
  provider   = aws.useast
  depends_on = [aws_vpc.vpc]
  for_each   = toset(["3", "4", "5"])

  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.${each.value}.0/24"

  tags = {
    Name = "subnet-terraform-${each.value}"
  }
}
