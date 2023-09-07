data "archive_file" "lambda_function" {
  type        = "zip"
  source_dir  = "lambda"
  output_path = "main.zip"
}



resource "aws_lambda_function" "tf_lambda_function" {
  filename      = data.archive_file.lambda_function.output_path
  function_name = var.lambda_name
  role          = var.lambda_role_arn
  handler       = "main.lambda_handler"

  source_code_hash = data.archive_file.lambda_function.output_base64sha256
  layers = var.lambda_layers

  runtime     = "python3.8"
  timeout     = var.lambda_timeout
  memory_size = var.lambda_memory
  ephemeral_storage {
    size = var.lambda_ephemeral_storage
    }

  vpc_config {
    subnet_ids         = var.lambda_subnet_ids
    security_group_ids = var.lambda_security_group_ids
  }

  tags = {
    CreatedBy = "Terraform"
  }

}
