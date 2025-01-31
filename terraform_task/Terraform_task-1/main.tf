# Define the AWS providers for two regions
provider "aws" {
  region = "us-east-1" # First region
}

provider "aws" {
  alias  = "west" # Alias for the second provider
  region = "us-west-2" # Second region
}

# Create an EC2 instance in the first region (us-east-1)
resource "aws_instance" "instance_east" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI in us-east-1
  instance_type = "t2.micro"

  tags = {
    Name = "Instance-East"
  }
}

# Create an EC2 instance in the second region (us-west-2)
resource "aws_instance" "instance_west" {
  provider      = aws.west # Use the second provider
  ami           = "ami-0d70546e43a941d70" # Amazon Linux 2 AMI in us-west-2
  instance_type = "t2.micro"

  tags = {
    Name = "Instance-West"
  }
}

# Output the public IPs of the instances
output "instance_east_public_ip" {
  value = aws_instance.instance_east.public_ip
}

output "instance_west_public_ip" {
  value = aws_instance.instance_west.public_ip
}
