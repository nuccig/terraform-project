resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc-terraform-${terraform.workspace}"
  }
}

resource "time_sleep" "vpc_tags" {
  depends_on = [aws_vpc.vpc]

  create_duration  = "10s"
  destroy_duration = "10s"
}

resource "aws_subnet" "subnet" {
  depends_on = [time_sleep.vpc_tags]

  count = terraform.workspace == "prod" ? 3 : 1

  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.${count.index}.0/24"

  tags = {
    Name = "subnet-terraform-${terraform.workspace}-${count.index}"
  }
}

resource "terraform_data" "example_data" {

  triggers_replace = [
    aws_vpc.vpc.id,
    aws_subnet.subnet[*].id
  ]

  provisioner "local-exec" {
    command = "echo \"VPC ID: ${aws_vpc.vpc.id}, Subnet IDs: ${join(", ", aws_subnet.subnet[*].id)}\" > terraform_data_output.txt"
  }

  input = 1
  # output     = "example_output"
}

#Funciona como um bloco de testes
check "check_example" {

  assert {
    condition     = length(aws_subnet.subnet) == 0
    error_message = "Subnets criadas são maiores que zero."
  }

}
