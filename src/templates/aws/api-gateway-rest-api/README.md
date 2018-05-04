# api_gateway_rest_api

Create an API Gateway REST API.

## input variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
|account_id|The id of AWS account.|string||Yes|
|region|This id of AWS region.|string||Yes|
|api_gateway_name|The name of the REST API.|string||Yes|
|api_gateway_description|The description of the REST API.|string||Yes|
|api_gateway_binary_media_types|The list of binary media types supported by the RestApi.|list|[ "application/json" ]|No|
|api_gateway_body|An OpenAPI specification that defines the set of routes and integrations to create as part of the REST API.|string|""|No|


## output parameters

| Name | Description | Type |
|------|-------------|:----:|
|api_gateway_id|The ID of the REST API.|int|
|api_gateway_root_resource_id|The resource ID of the REST API's root.|int|
|api_gateway_created_date|The creation date of the REST API.|string|