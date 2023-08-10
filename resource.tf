resource "tls_private_key" "rsa" {
  algorithm = "RSA"
}

resource "aws_key_pair" "example" {
  key_name   = "my-key-pair"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "local_file" "example" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "example.pem"
}
