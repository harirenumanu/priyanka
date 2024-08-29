
resource "aws_instance" "example" {
ami = "ami-0427090fd1714168b"
instance_type = "t2.medium"
}
output "ip" {
value = aws_instance.example.public_ip
}
