variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "account_id" {
  type    = string
  default = "0123456789"
}

variable "lambda_name" {
  type = string
  description = "(Required) Name od the Lambda Function"
  default = "<lambda-name>"
}


variable "lambda_timeout" {
  type = number
  description = "Max time for which lambda has to run"
  default = 3
}

variable "lambda_memory" {
  type = number
  description = "Memory allocated to lambda"
  default = 128
}

variable "lambda_ephemeral_storage" {
  type = number
  description = "ephemeral_storage allocated to lambda"
  default = 512
}

variable "lambda_role_arn" {
  type = string
  description = "(Required) Role to run lambda function"
  default = "arn:aws:iam::<account-id>:role/<role-name>"
}



variable "lambda_layers" {
  type = list
  description = "lambda_layers on which lambda works"
  default = ["arn:aws:lambda:<region>:<account-id>:layer:pandas:1"]
}

variable "lambda_subnet_ids" {
  type = list
  description = "Submet in which lambda works"
  default = ["subnet-xxxxxxxxxxxx","subnet-xxxxxxxxxxxxx"]
}

variable "lambda_security_group_ids" {
  type = list
  description = "Security Group provided to lambda"
  default = ["sg-xxxxxxxxxxxxx"]
}
