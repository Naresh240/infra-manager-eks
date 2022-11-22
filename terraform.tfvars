region          = "us-east-1"
project         = "demoeks"

vpc_cidr        = "10.0.0.0/16"
subnet_count    = 2

desired_size    = 2
min_size        = 1
max_size        = 4

############
domain_name     = "awsdevopstrainer.com"
############
external_dns_provider   = "aws"
zonetype                = "public"
#############
github_url        = "https://github.com/Naresh240/fluxcd.git"
github_username   = "naresh240"
github_branch     = "master"
github_infra_path = "devops"