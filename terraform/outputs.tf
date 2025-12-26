output "instance_id" {
  description = "ID de l'instance EC2"
  value       = aws_instance.windows_server.id
}

output "instance_public_ip" {
  description = "Adresse IP publique"
  value       = aws_instance.windows_server.public_ip
}

output "instance_private_ip" {
  description = "Adresse IP privée"
  value       = aws_instance.windows_server.private_ip
}

output "ami_id" {
  description = "AMI Windows Server 2022 utilisée"
  value       = data.aws_ami.windows_2022.id
}

output "connection_info" {
  description = "Informations de connexion RDP"
  value = {
    ip       = aws_instance.windows_server.public_ip
    port     = 3389
    username = "Administrator"
    note     = "Récupérer le mot de passe via AWS Console"
  }
}
