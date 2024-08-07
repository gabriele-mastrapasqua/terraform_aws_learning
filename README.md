# Terraforming AWS: learning material and demos
Start from following the main tutorial: https://developer.hashicorp.com/terraform/tutorials/aws-get-started and other resources to learn terraform and play with some simple architectures in AWS.

## How to
Open each subfolders then run `terraform init` to fetch modules dependencies, then `terraform plan` to see the planning configuration, or to deploy use `terraform apply` to create resources on AWS. 

You can incur in some charges for resources usage on AWS (most resources used in the samples are in the free tier if you have a new aws account like for ec2 micro), so always remember to `terraform destroy` to remove the resources on AWS after you see the expected results of your tests.

## Common workflow for each exercise
- `terraform init`: fetch dependencies
- `terraform fmt`: format your template files
- `terraform validate`: validate the files
- `terraform plan`: check the planning on AWS that terraform will apply
- `terraform apply`: run deployment on AWS
- `terraform show`: show terraform current state
- `terraform destroy`: run deployment on AWS


## Table of Contents
- [Exercise 0: setup terraform](./0_setup/README.md): install the terraform CLI and check prerequisites
- [Exercise 1: docker test on local machine](./1_docker_local/README.md): test terraform running a docker container locally
- [Exercise 2: terraform basics](./2_aws_instance/README.md): following the main tutorial we will try to deploy an ec2 instance, try basics commands and workflow using terraform, try terraform cloud
- [Exercise 3: terraform variables](./3_variables/README.md): terraform different types of variables 

- TODO

- [Architecture examples](./aws_architecture_examples/README.md): Different architectures on AWS using terraform, common patterns.









## TODO: learning terraform basics
- [X] learn the basic CLI commands and workflow
- [X] most common variables types: string, numbers, bool, list, map
- [ ] local modules: to structure and encapsulate the configuration of the infra in a maintainable way
- [ ] test: we could work in terraform using tests and mocks!


## TODO: AWS architectures Ideas
Here are some ideas to try on AWS with terraform: 
- [X] EC2 basics: create an ec2 instance, simple settings
- [ ] EC2: autoscaling, spot, other specific settings?
- [X] s3 bucket
- [ ] s3 bucket for website hosting and CORS
- [ ] API Gateway > lambda (and optionally cognito for user auth?)
- [ ] lambda layers?
- [ ] s3 > SQS > lambda
- [ ] Custom VPC, NAT, subnets, ...
- [ ] Beanstalk for web: ELB, ec2, autoscaling, RDS optionally
- [ ] ECS: ec2, config, ECR for private docker repo
- [ ] CodeBuild, CodePipeline, ...

