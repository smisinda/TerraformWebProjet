# TerraformWebProjet
first web project

terraform init: creates a lock file .terraform.lock.hcl
terraform fmt: main.tf: to make sure that the syntax is valid
terraform validate: Success! The configuration is valid. if the validation is not
succeded the command return Error:.. with reference to the errors 
terraform graph : digraph{} show the dependencies
terraform apply: to creat the instances and build the infrustructre 
Plan: 2 to add, 0 to change, 0 to destroy

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
terraform show: when terraform applies the infrustrcture it create a file terraform.tfstate where terraform store the IDs and resources' properties