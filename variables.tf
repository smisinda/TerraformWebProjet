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