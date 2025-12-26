# Instance EC2 Windows Server 2022
resource "aws_instance" "windows_server" {
  ami                    = data.aws_ami.windows_2022.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.windows_server.id]
  iam_instance_profile   = aws_iam_instance_profile.windows_server.name

  # Volume root
  root_block_device {
    volume_type           = "gp3"
    volume_size           = 30
    encrypted             = false
    delete_on_termination = true
  }

  # Métadonnées
  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  tags = {
    Name = "${var.project_name}-ec2-${var.environment}"
    OS   = "Windows Server 2022"
  }
}
