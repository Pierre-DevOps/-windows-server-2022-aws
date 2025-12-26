# Windows Server 2022 - Déploiement AWS

Projet de déploiement automatisé d'un serveur Windows Server 2022 sur AWS avec Terraform.

##  Contexte

Projet réalisé dans le cadre de la certification **Administrateur Système DevOps (RNCP36061)** démontrant les compétences :
- AT1 : Automatisation du déploiement d'infrastructure cloud
- Sécurisation des infrastructures
- Infrastructure as Code avec Terraform

## ️ Architecture

- **VPC** : 10.0.0.0/16
- **Subnet Public** : 10.0.1.0/24
- **Instance EC2** : Windows Server 2022 (t3.micro)
- **Security Group** : RDP (3389) autorisé
- **IAM Role** : Pour accès services AWS

##  Déploiement
```bash
cd terraform
terraform init
terraform plan
terraform apply
```

##  Coûts estimés

- EC2 t3.micro : ~8€/mois (gratuit si Free Tier actif)
- EBS 30GB : ~3€/mois
- **Total : ~11€/mois**

## � Auteur

**Pierre** - Étudiant DevOps
- Formation : Bachelor Administrateur Système DevOps
- GitHub : [Pierre-DevOps](https://github.com/Pierre-DevOps)

##  Licence

MIT
