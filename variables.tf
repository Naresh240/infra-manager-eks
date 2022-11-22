variable "region" {
  type = string
  default = "us-east-1"
}

variable "project" {
  description = "Name to be used on all the resources as identifier. e.g. Project name, Application name"
  # description = "Name of the project deployment."
  type = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_count" {
  description = "The number of subnet bits for the CIDR. For example, specifying a value 8 for this parameter will create a CIDR with a mask of /24."
  type        = number
}

###############################################
#########        EKS variables       ##########
###############################################

variable "desired_size" {
  type  = number
}

variable "min_size" {
  type  = number
}

variable "max_size" {
  type  = number
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default = {
    "Project"     = "TerraformEKSWorkshop"
    "Environment" = "Development"
    "Owner"       = "Naresh"
  }
}

###############################################
###########     External Domain     ###########
###############################################

variable "domain_name" {
  type = string
}

###############################################
###########       External DNS      ###########
###############################################

variable "external_dns_provider" {
  type  = string
}

variable "zonetype" {
  type  = string
}

###############################################
#######        fluxCD variables       #########
###############################################

variable github_url {
    type    = string
}

variable github_username {
    type    = string
}

variable github_password {
    type    = string
    sensitive   = true
}

variable github_branch {
    type    = string
}

variable github_infra_path {
    type    = string
}