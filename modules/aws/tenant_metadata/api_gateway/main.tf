resource "aws_api_gateway_rest_api" "api" {
  name        = "dynamodb-api"
  description = "API Gateway to interact with DynamoDB"
}

resource "aws_api_gateway_resource" "proxy" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = "{proxy+}"
}

### POST Method - Insert Tenant ###
resource "aws_api_gateway_method" "post" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.proxy.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "post_dynamodb" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.proxy.id
  http_method             = aws_api_gateway_method.post.http_method
  integration_http_method = "POST"
  type                    = "AWS"
  uri                     = "arn:aws:apigateway:${var.aws_region}:dynamodb:action/PutItem"

  credentials = var.api_gateway_role_arn

  request_templates = {
    "application/json" = <<EOF
  {
      "TableName": "cc-networking-jira-webhook-payloads",
      "Item": {
        "tenant": { "S": "$util.escapeJavaScript($input.path('$.request_details')).split('Name of the Portfolio aligned to\\n')[1].trim().split('\\n')[0]" },
        "ticket_number": { "S": "$input.path('$.ticket_number')" },
        "summary": { "S": "$input.path('$.summary')" },
        "description": { "S": "$input.path('$.description')" },  
        "name_of_portfolio": { "S": "$util.escapeJavaScript($input.path('$.request_details')).split('Name of the Portfolio aligned to\\n')[1].trim().split('\\n')[0]" },
        "product_name": { "S": "$util.escapeJavaScript($input.path('$.request_details')).split('Product Name\\n')[1].trim().split('\\n')[0]" },
        "product_short_name": { "S": "$util.escapeJavaScript($input.path('$.request_details')).split('Product short name\\n')[1].trim().split('\\n')[0]" },
        "finance_account_number": { "S": "$util.escapeJavaScript($input.path('$.request_details')).split('Finance Account Number\\n')[1].trim().split('\\n')[0]" },
        "cost_code": { "S": "$util.escapeJavaScript($input.path('$.request_details')).split('Cost Code\\n')[1].trim().split('\\n')[0]" },
        "environment": { "S": "$util.escapeJavaScript($input.path('$.request_details')).split('Environment\\n')[1].trim().split('\\n')[0]" },
        "delivery_lead": { "S": "$util.escapeJavaScript($input.path('$.request_details')).split('Delivery lead\\n')[1].trim().split('\\n')[0]" },
        "business_contact": { "S": "$util.escapeJavaScript($input.path('$.request_details')).split('Business contact\\n')[1].trim().split('\\n')[0]" },
        "financial_contact": { "S": "$util.escapeJavaScript($input.path('$.request_details')).split('Financial contact\\n')[1].trim().split('\\n')[0]" },
        "tech_lead": { "S": "$util.escapeJavaScript($input.path('$.request_details')).split('Tech lead\\n')[1].trim().split('\\n')[0]" },
        "created_date": { "S": "$util.escapeJavaScript($input.path('$.request_details')).split('Created\\n')[1].trim().split('\\n')[0]" },
        "received_timestamp": { "S": "$context.requestTime" }
      }
  }
    EOF
  }
}


resource "aws_api_gateway_method_response" "post_response" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.proxy.id
  http_method = aws_api_gateway_method.post.http_method
  status_code = "200"

  response_models = {
    "application/json" = "Empty"
  }
}

resource "aws_api_gateway_integration_response" "post_integration_response" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.proxy.id
  http_method = aws_api_gateway_method.post.http_method
  status_code = aws_api_gateway_method_response.post_response.status_code

  response_templates = {
    "application/json" = <<EOF
    {
      "message": "Item inserted successfully",
      "statusCode": 200
    }
    EOF
  }
}

### GET Method - Query Tenant ###
resource "aws_api_gateway_method" "get" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.proxy.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "get_dynamodb" {
  rest_api_id             = aws_api_gateway_rest_api.api.id
  resource_id             = aws_api_gateway_resource.proxy.id
  http_method             = aws_api_gateway_method.get.http_method
  integration_http_method = "POST"
  type                    = "AWS"
  uri                     = "arn:aws:apigateway:${var.aws_region}:dynamodb:action/Query"

  credentials = var.api_gateway_role_arn

  request_templates = {
    "application/json" = <<EOF
    {
      "TableName": "${var.dynamodb_table_name}",
      "KeyConditionExpression": "tenant = :tenant",
      "ExpressionAttributeValues": {
        ":tenant": {"S": "$input.params('tenant')"}
      }
    }
    EOF
  }
}

resource "aws_api_gateway_method_response" "get_response" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.proxy.id
  http_method = aws_api_gateway_method.get.http_method
  status_code = "200"

  response_models = {
    "application/json" = "Empty"
  }
}

resource "aws_api_gateway_integration_response" "get_integration_response" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  resource_id = aws_api_gateway_resource.proxy.id
  http_method = aws_api_gateway_method.get.http_method
  status_code = aws_api_gateway_method_response.get_response.status_code

  response_templates = {
    "application/json" = <<EOF
    #set($inputRoot = $input.path('$'))
    {
      "statusCode": 200,
      "tenants": [
        #foreach($elem in $inputRoot.Items)
        {
          "tenant": "$elem.tenant.S"
        }#if($foreach.hasNext),#end
        #end
      ]
    }
    EOF
  }
}

### Deploy API Gateway ###
resource "aws_api_gateway_deployment" "deployment" {
  rest_api_id = aws_api_gateway_rest_api.api.id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.api.body))
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    aws_api_gateway_method.post,
    aws_api_gateway_method.get,
    aws_api_gateway_integration.post_dynamodb,
    aws_api_gateway_integration.get_dynamodb
  ]
}

### Logging ###
resource "aws_cloudwatch_log_group" "api_gateway_logs" {
  name              = "/aws/apigateway/access-logs"
  retention_in_days = 90
  kms_key_id        = var.kms_key
}

resource "aws_api_gateway_stage" "prod" {
  deployment_id = aws_api_gateway_deployment.deployment.id
  rest_api_id   = aws_api_gateway_rest_api.api.id
  stage_name    = "prod"
  // consider enabling cache and xray 
  // cache_cluster_enabled = true
  // xray_tracing_enabled = true

  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.api_gateway_logs.arn
    format = jsonencode({
      requestId   = "$context.requestId"
      sourceIp    = "$context.identity.sourceIp"
      userAgent   = "$context.identity.userAgent"
      requestTime = "$context.requestTime"
      status      = "$context.status"
    })
  }
}

