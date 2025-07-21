#Funciona como um bloco de testes
check "check_example" {

  assert {
    condition     = length(aws_subnet.subnet) == 0
    error_message = "Subnets criadas são maiores que zero."
  }

}
