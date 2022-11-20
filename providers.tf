provider "aws" {
  region  = var.region
  shared_credentials_files = ["~/.aws/credentials"]
}

provider "flux" {}

provider "github" {
  owner = var.github_owner
  token = var.github_token
}

provider "kubectl" {
  host                   = module.eks-cluster.eks_endpoint
  cluster_ca_certificate = base64decode(module.eks-cluster.eks_certificate)
  token                  = module.eks-cluster.token
  load_config_file       = false
}

provider "kubernetes" {
  host                   = module.eks-cluster.eks_endpoint
  cluster_ca_certificate = base64decode(module.eks-cluster.eks_certificate)
  token                  = module.eks-cluster.token
}

provider "helm" {
  kubernetes {
    host                   = module.eks-cluster.eks_endpoint
    cluster_ca_certificate = base64decode(module.eks-cluster.eks_certificate)
    token                  = module.eks-cluster.token
  }
}