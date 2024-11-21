
resource "aws_instance" "example" {
ami = "ami-012967cc5a8c9f891"
instance_type = var.instance_type
}
output "ip" {
value = aws_instance.example.public_ip
}
