# TerraformWebProjet
first web project

terraform init: creates a lock file .terraform.lock.hcl

terraform fmt: main.tf: to make sure that the syntax is valid

terraform validate: Success! The configuration is valid. if the validation is not
succeded the command return Error:.. with reference to the errors 

terraform graph : digraph{} show the dependencies :
aws_instance.example (expand)" ->  aws_security_group.instance (expand)"
aws_instance fait appel à aws_security_group)

terraform apply: to creat the instances and build the infrustructre 

Plan: 2 to add, 0 to change, 0 to destroy

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
Outputs:

public_ip = "52.36.176.126"

terraform show: when terraform applies the infrustrcture it create a file terraform.tfstate where terraform store the IDs and resources' properties

# partie2

terraform validate : variable non valid since enabled is a non boolean type
╷
│ Error: Invalid default value for variable
│ 
│   on variables.tf line 9, in variable "object_example_with_error":
│    9:   default = {
│   10:     name    = "value 1"
│   11:     age     = 42
│   12:     tags    = ["a", "b", "c"]
│   13:     enabled = "invalid"
│   14:   }
│ 
│ This default value is not compatible with the variable's type constraint: a bool is required.

# after variable port creation
terraform apply 
Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

public_ip = "54.149.69.110"