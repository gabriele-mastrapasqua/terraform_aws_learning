# Terraforming AWS: learning material and demos
Start from following the main tutorial: https://developer.hashicorp.com/terraform/tutorials/aws-get-started and other resources to learn terraform and play with some simple architectures in AWS.

## TODO: learning terraform basics
- [X] learn the basic CLI commands and workflow
- [ ] most common variables types: string, numbers, bool, list, map
- [ ] local modules: to structure and encapsulate the configuration of the infra in a maintainable way
- [ ] test: we could work in terraform using tests and mocks!


## TODO: AWS architectures Ideas
Here are some ideas to try on AWS with terraform: 
- [X] EC2 basics: instance, count, simple settings
- [ ] EC2: autoscaling, spot, other specific settings?
- [ ] s3 bucket
- [ ] s3 bucket for website hosting and CORS
- [ ] API Gateway > lambda (and optionally cognito for user auth?)
- [ ] lambda layers?
- [ ] s3 > SQS > lambda
- [ ] Custom VPC, NAT, subnets, ...
- [ ] Beanstalk for web: ELB, ec2, autoscaling, RDS optionally
- [ ] ECS: ec2, config, ECR for private docker repo
- [ ] CodeBuild, CodePipeline, ...


## CLI Install 
- Follow the installation here: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli, for ex using brew
- install zsh / bash autocomplete: `terraform -install-autocomplete`


