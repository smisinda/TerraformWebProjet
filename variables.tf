#variable "object_example_with_error" {
#  description = "An exmple of a structural type in Terraform with an error"
#  type = object({
#    name    = string
#    age     = number
#    tags    = list(string)
#    enabled = bool
#  })
#  default = {
#    name    = "value 1"
#    age     = 42
#    tags    = ["a", "b", "c"]
#    enabled = "invalid"
#  }
#}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
  default     = "Terraform-example-group"
}
variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}