# main.tf
resource "aws_instance" "nginx_instance_1" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI (us-east-1)
  instance_type = "t2.micro"
  key_name      = "your-key-pair-name"     # Replace with your key pair name

  tags = {
    Name = "NginxInstance1"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/id_rsa")  # Replace with your private key path
      host        = self.public_ip
    }
  }
}

resource "aws_instance" "nginx_instance_2" {
  provider      = aws.us-west-2
  ami           = "ami-0e999cbd62129e3b1"  # Amazon Linux 2 AMI (us-west-2)
  instance_type = "t2.micro"
  key_name      = "your-key-pair-name"     # Replace with your key pair name

  tags = {
    Name = "NginxInstance2"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/id_rsa")  # Replace with your private key path
      host        = self.public_ip
    }
  }
}
