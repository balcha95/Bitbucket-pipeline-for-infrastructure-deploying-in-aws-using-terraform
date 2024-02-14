resource "aws_instance" "server" {
  ami           = var.ami_value
  instance_type = var.instance_type_value

 tags = {
    Name = "Terraform Server"
  }
}