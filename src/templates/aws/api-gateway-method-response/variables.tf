# Define list of variables to be used in main.tf

############
# provider #
############
variable "account_id" {
  description = "Allowed AWS account ID, to prevent you from mistakenly using an incorrect one (and potentially end up destroying a live environment)."
}

variable "region" {
  description = "This is the AWS region."
}

#############
# top level #
#############
variable "api_gateway_method_rest_api_id" {
  description = "The ID of the associated REST API."
}

variable "api_gateway_method_resource_id" {
  description = "The API resource ID."
}

variable "api_gateway_method_http_method" {
  description = "The HTTP Method (GET, POST, PUT, DELETE, HEAD, OPTIONS, ANY)."
  type        = "string"
}

variable "api_gateway_method_status_code" {
  description = "The HTTP status code."
  type        = "string"
}

variable "api_gateway_method_response_models" {
  description = "A map of the API models used for the response's content type."
  type        = "map"
}
