# Terraform variables
Following documentation about language https://developer.hashicorp.com/terraform/language and variables types and interpolation

Also this https://developer.hashicorp.com/terraform/tutorials/configuration-language/variables


## Steps
- `terraform init`
- `terraform fmt`
- `terraform validate`
- `terraform plan`

## Key points
- using different common variables types: string, number, bool, list, map
- default values usage or not
- tfvars file usage https://developer.hashicorp.com/terraform/tutorials/configuration-language/variables#assign-values-with-a-file
- interpolation: https://developer.hashicorp.com/terraform/tutorials/configuration-language/variables#interpolate-variables-in-strings
- validation: https://developer.hashicorp.com/terraform/tutorials/configuration-language/variables#validate-variables
- sensitive variables using tfvars or env variables (or from inputs from the cli): https://developer.hashicorp.com/terraform/tutorials/configuration-language/sensitive-variables
