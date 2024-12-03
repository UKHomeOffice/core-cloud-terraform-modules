resource "aws_cloudwatch_event_rule" "this" {
  name        = var.name
  description = "invoked on cloudwatch log group tag changes"

  event_pattern = jsonencode(
    {
      "source" : [
        "aws.tag"
      ],
      "detail-type" : [
        "Tag Change on Resource"
      ],
      "detail" : {
        "service" : [
          "logs"
        ],
        "tags" : {
          (var.tag_pattern) : [
            var.opt_in_tag_value,
            var.opt_out_tag_value
          ]
        }
      }
    }
  )
}

resource "aws_cloudwatch_event_target" "this" {
  rule      = aws_cloudwatch_event_rule.this.name
  target_id = var.name
  arn       = aws_lambda_function.this.arn
}