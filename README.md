# TerraformWebProjet
# Web Servers cluster

# validate
Warning: Deprecated Resource
│ 
│   with data.aws_subnet_ids.default,
│   on main.tf line 48, in data "aws_subnet_ids" "default":
│   48: data "aws_subnet_ids" "default" {
│ 
│ The aws_subnet_ids data source has been deprecated and will be removed in a future
│ version. Use the aws_subnets data source instead.
╵
Success! The configuration is valid, but there were some validation
warnings as shown above.
==> should change aws_subnet_ids with aws_subnets

# plan
Plan: 3 to add, 0 to change, 0 to destroy.

You didn't use the -out option to save this plan, so Terraform can't guarantee
to take exactly these actions if you run "terraform apply" now.

# apply
 Error: waiting for Auto Scaling Group (terraform-20230207151027657400000001) capacity satisfied: 1 error occurred:
│       * Scaling activity (7cc618b1-b6c0-d7fc-4dc2-e842cbfadb98): Failed: Your requested instance type (t2.micro) is not supported in your requested Availability Zone (us-west-2d). Please retry your request by not specifying an Availability Zone or choosing us-west-2a, us-west-2b, us-west-2c. Launching EC2 instance failed.

==> changing max_size to 5

terraform apply
Apply complete! Resources: 1 added, 0 changed, 1 destroyed.

Checking EC2 instances => ok!
hello world!

# changing "aws_subnets_ids" to "aws_subnets"
syntax:
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}
terraform plan
No changes. Your infrastructure matches the configuration.