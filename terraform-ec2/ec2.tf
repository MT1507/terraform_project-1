
# key pair (login)

resource "aws_key_pair" "my_key" {
  key_name   = "terra-key-ec2"
  public_key = file("../terra-key.pub")

}

# VPC and SG

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "my_security_group" {
  name        = "automate_SG"
  description = "this will add TF generated SG "
  vpc_id      = aws_default_vpc.default.id

  tags = {
    Name = "automate_SG"
  }

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
    description = "ssh port open"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP port open"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "ssh port open"
  }
}


resource "aws_instance" "my_instance" {
	for_each = tomap({
		mangesh_instance_micro = "t3.micro"
                mangesh_instance_medium = "t3.small"
	})
  depends_on = [aws_security_group.my_security_group,aws_key_pair.my_key]
  key_name        = aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.my_security_group.name]
  instance_type   = each.value
  ami             = var.ec2_ami_id
  user_data       = file("ngnix_creation.sh")
  root_block_device {
    volume_size = var.env == "prd" ? 20 : var.ec2_default_root_storage_size
    volume_type = "gp3"
  }
  tags = {
    Name = each.key

  }
}


