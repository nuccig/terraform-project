resource "aws_key_pair" "key" {
  key_name   = "aws-keypair"
  public_key = file("./aws-key.pub")
}

resource "aws_instance" "vm" {
  ami           = "ami-020cba7c55df1f615"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.key.key_name

  subnet_id                   = module.network.subnet_id
  vpc_security_group_ids      = [module.network.security_group_id]
  associate_public_ip_address = true

  tags = { "Name" : "vm-terraform" }
}
