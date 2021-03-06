provider "aws" {
region = "us-east-2"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-077e31c4939f6a2f3"
  instance_type = "t2.medium"
  count = 3
  key_name = "angry-admin-key"

  tags = {
    Name = "Visit angrysysops.com"
    env = "development"
    env = "prod"
    env = "test"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /root/inv"
  }
}
