resource "aws_instance" "this" {
  count                     = var.instance_count
  ami                       = var.ami_id
  instance_type             = var.instance_type
  subnet_id                 = element(var.subnet_ids, count.index)
  vpc_security_group_ids    = [aws_security_group.ec2_sg.id]
  key_name                  = var.key_name

  tags = {
    Name = "ec2-${count.index}"
  }
}

resource "aws_security_group" "ec2_sg" {
  name        = "${var.name}-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
