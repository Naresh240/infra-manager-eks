# inframanager-eks

# create file with ```git_token.yaml``` and keep below content in file
```bash
# create github token
token: <github token>
```

## Create kms key and encrypt github-token with kms service

```bash
aws kms create-key \
    --tags TagKey=git,TagValue=token \
    --description "git token"

# collect kms key id from above command and replace in below command

aws kms encrypt \
  --key-id <kms key id> \
  --region us-east-1 \
  --plaintext fileb://git_token.yaml \
  --output text \
  --query CiphertextBlob \
  > git_token.yaml.encrypted
```

## fork below repos to your github account

[aws vpc template](https://github.com/terraform-templates/aws-vpc)
[aws eks template](https://github.com/terraform-templates/aws-eks)
[helm chart - nginx igress controller](https://github.com/kubernetes-work/helm-nginx-ingress-controller)
[helm chart - External DNS](https://github.com/kubernetes-work/helm-external-dns)
[helm chart - flux sync](https://github.com/kubernetes-work/helm-flxu-sync-charts)

## update source path with your github paths
[vpc repo url](https://github.com/Naresh240/infra-manager-eks/blob/ab5995b60b4f1c4f54cc71246b9000609eebf156/main.tf#L10) need to update here
[eks repo url](https://github.com/Naresh240/infra-manager-eks/blob/ab5995b60b4f1c4f54cc71246b9000609eebf156/main.tf#L21) need to update here
[nginx ingress controller url](https://github.com/Naresh240/infra-manager-eks/blob/ab5995b60b4f1c4f54cc71246b9000609eebf156/main.tf#L40) need to update here
[external dns url](https://github.com/Naresh240/infra-manager-eks/blob/ab5995b60b4f1c4f54cc71246b9000609eebf156/main.tf#L50) need to update here
[flux sync url](https://github.com/Naresh240/infra-manager-eks/blob/ab5995b60b4f1c4f54cc71246b9000609eebf156/main.tf#L66) need to update here

## update values under ```terraform.tfvars``` file and run below commands

```bash
terraform init
terraform plan
terraform apply
```
