################################################################################
# VPC
################################################################################

module "vpc" {
  source                      = "git@github.com:terraform-templates/aws-vpc.git?ref=main"
  project                     = var.project
  vpc_cidr                    = var.vpc_cidr
  subnet_count                = var.subnet_count
}

################################################################################
# EKS Cluster
################################################################################

module "eks-cluster" {
    source                      = "git@github.com:terraform-templates/aws-eks.git?ref=main"
    project                     = var.project
    vpc_id                      = module.vpc.vpc_id
    public_subnet_ids           = [module.vpc.public_subnet_ids]
    private_subnet_ids          = [module.vpc.private_subnet_ids]

    desired_size                = var.desired_size
    min_size                    = var.min_size
    max_size                    = var.max_size
    tags                        = var.tags

    depends_on  = [module.vpc]
}

################################################################################
# Helm Nginx Ingress Controller
################################################################################

module "helm-ingress" {
  source = "git@github.com:kubernetes-work/helm-nginx-ingress-controller.git?ref=main"

  depends_on = [module.eks-cluster]
}

################################################################################
# Helm External DNS
################################################################################

module "external-dns" {
  source = "git@github.com:kubernetes-work/helm-external-dns.git?ref=main"

  external_dns_provider    = var.external_dns_provider
  region        = var.region
  zonetype      = var.zonetype
  oidc_arn      = module.eks-cluster.oidc_arn
  oidc_url      = module.eks-cluster.oidc_url
  cluster_name  = module.eks-cluster.cluster_name
  depends_on    = [module.helm-ingress]
}

################################################################################
# FluxCD
################################################################################

module "helm-flux-sync" {
  source        = "git@github.com:kubernetes-work/helm-flxu-sync-charts.git?ref=main"
  github_url        = var.github_url
  github_username   = var.github_username
  github_password   = base64decode(var.github_password)
  github_branch     = var.github_branch
  github_infra_path = var.github_infra_path

 depends_on = [module.external-dns]
}
