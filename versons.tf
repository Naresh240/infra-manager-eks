terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.23.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.16"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    } 
    flux = {
      source  = "fluxcd/flux"
      version = ">= 0.20.0"
    }
    github = {
      source  = "integrations/github"
      version = ">= 4.5.2"
    }     
  }
}