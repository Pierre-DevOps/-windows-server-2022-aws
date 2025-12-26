# Security Group pour l'instance Windows
resource "aws_security_group" "windows_server" {
  name        = "${var.project_name}-sg-windows-${var.environment}"
  description = "Security group pour Windows Server 2022"
  vpc_id      = aws_vpc.main.id

  # RDP depuis Internet
  ingress {
    description = "RDP depuis Internet"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Tout le trafic sortant autorisé
  egress {
    description = "Autoriser tout le trafic sortant"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-sg-windows-${var.environment}"
  }
}

# IAM Role pour l'instance EC2
resource "aws_iam_role" "windows_server" {
  name = "${var.project_name}-role-ec2-${var.environment}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })

  tags = {
    Name = "${var.project_name}-role-ec2-${var.environment}"
  }
}

# Instance Profile
resource "aws_iam_instance_profile" "windows_server" {
  name = "${var.project_name}-profile-ec2-${var.environment}"
  role = aws_iam_role.windows_server.name
}
