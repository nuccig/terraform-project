resource "aws_key_pair" "key" {
  key_name   = "aws-keypair"
  public_key = file("./aws-key.pub")
}

resource "aws_instance" "vm" {
  ami           = "ami-020cba7c55df1f615"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.key.key_name

  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet_id
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security_group_id]
  associate_public_ip_address = true

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("./aws-key")
    host        = self.public_ip
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ips.txt"
  }

  provisioner "remote-exec" {
    inline = [
      "echo subnet_id=${data.terraform_remote_state.vpc.outputs.subnet_id} >> /tmp/network-config.txt",
      "echo sec_group_id=${data.terraform_remote_state.vpc.outputs.security_group_id} >> /tmp/network-config.txt",
    ]
  }

  provisioner "file" {
    source      = "./teste.txt"
    destination = "/tmp/exemplo.txt"
  }

  provisioner "file" {
    content     = "Hello, World!"
    destination = "/tmp/hello.txt"
  }

  tags = { "Name" : "vm-terraform" }
}
