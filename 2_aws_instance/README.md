# Terraform basics using AWS
Taken from the main tutorial: https://developer.hashicorp.com/terraform/tutorials/aws-get-started from step 2 onward.

The example explain how to create and update an EC2 with basic properties. 

We start using local state (the cli generate ".tfstate" files locally) that **must NOT be checked in git**, and ignored from a VCS because they can contains secrets and sensitive data from our cloud account.

At the ends of the tutorial, we could use the state for free on terraform cloud and test run this sample.


## Key points
Here is a list of the main points showed following the tutorial:
- basic terraform commands: init, fmt, validate, show, plan, apply, destroy
- update a terraform template
- variables usage and reference in the main template
- outputs (like CF/CDK outputs) from AWS to show EC2 instance id, public ip v4 for example
- attach terraform cloud to handle state remotely instead of locally

## Basic terraform commands
Terraform cli commands used in the tutorial:

### init
installs / update current modules and providers 

### fmt
format all tf files

### validate
validate the template files

### show
show the current template state, if deployed on AWS we could see the status of the EC2 instance

### plan
plan checks and infer what to do on AWS, explain the planning

### apply
run on AWS the current template files

### destroy
delete the current state (if local) or in terraform cloud, remove the created AWS resources.

## Update a terraform template
For ex changing instance type or ami ID and see the changes re-applying the template

## Variables
Creating a file variables.tf we can setup variabiles as inputs for the main template. 

They can be referenced from the template using "var.<name of the variable>" or from the cli using -var ... flag.

Variables have a description, a type (string, bool, number, list, map), a default value

## Outputs
Like in Cloudformation and CDK, we can export some specific computed values from our resources deployed on the cloud, for ex EC2 instance id, and so on.

## Terraform cloud usage
We then create a terraform cloud account and configure it with an access token using the command: `terraform login`.
Then create a CLI workspace, setup some variables as **ENV variables + sensitive** for AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY under the new workspace.

Change the template adding the organization and workspace to use, then we can see that all infra plannings and deploys will run (and also the terraform state will be saved) on terraform cloud.

run again `terraform init` to fetch terraform cloud modules.

Then you could run `terraform plan / apply` to see in the website the updated state, and the queued runs for deploying the infra remotely from their cloud.

nice to see: state changes like apply / update / destroy have diff like in the UI.

