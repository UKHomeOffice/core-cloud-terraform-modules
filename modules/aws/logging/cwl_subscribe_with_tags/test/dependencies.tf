resource "aws_kinesis_stream" "stream" {
  name            = "test-kinesis-stream"
  encryption_type = "KMS"
  kms_key_id      = aws_kms_key.kinesis.id

  shard_level_metrics = [
    "IncomingBytes",
    "OutgoingBytes",
  ]

  stream_mode_details {
    stream_mode = "ON_DEMAND"
  }

  tags = {
    Environment = "Testing"
    Owner       = "Sam"
    Team        = "Andromeda"
  }
}

resource "aws_kms_key" "kinesis" {
  description         = "A key to encrypt kinesis traffic."
  enable_key_rotation = true
}

resource "aws_iam_role" "cwl-to-kinesis-stream" {
  name               = "CwlKinesisRole"
  assume_role_policy = data.aws_iam_policy_document.assume-role.json
}

resource "aws_iam_role_policy" "allow-put-kinesis-stream" {
  name   = "allow-put-kinesis-stream"
  role   = aws_iam_role.cwl-to-kinesis-stream.id
  policy = data.aws_iam_policy_document.allow-put-kinesis-stream.json
}

data "aws_iam_policy_document" "assume-role" {
  statement {
    effect = "Allow"
    principals {
      type = "Service"
      identifiers = ["logs.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "allow-put-kinesis-stream" {
  statement {
    effect = "Allow"
    actions = ["kinesis:PutRecord"]
    resources = [aws_kinesis_stream.stream.arn]
  }
}

resource "aws_cloudwatch_log_destination" "kinesis" {
  name       = "send-to-kinesis"
  role_arn   = aws_iam_role.cwl-to-kinesis-stream.arn
  target_arn = aws_kinesis_stream.stream.arn
}

resource "aws_cloudwatch_log_destination_policy" "destination_policy" {
  destination_name = aws_cloudwatch_log_destination.kinesis.name
  access_policy    = data.aws_iam_policy_document.destination-policy.json
}

data "aws_iam_policy_document" "destination-policy" {
  statement {
    effect = "Allow"
    principals {
      identifiers = [data.aws_caller_identity.current.account_id]
      type = "AWS"
    }
    actions = ["logs:PutSubscriptionFilter"]
    resources = [aws_cloudwatch_log_destination.kinesis.arn]
  }
}