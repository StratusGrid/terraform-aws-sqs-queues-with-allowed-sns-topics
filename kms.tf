locals {
  kms_allowed_accounts = compact([data.aws_caller_identity.current.account_id])
}

resource "aws_kms_key" "this" {
  description         = "Key used to encrypt the cloudwatch log group"
  policy              = data.aws_iam_policy_document.this.json
  enable_key_rotation = true
}

data "aws_iam_policy_document" "this" {
  dynamic "statement" {
    for_each = local.kms_allowed_accounts
    content {
      sid    = "Enable IAM Permissions from ${statement.value}"
      effect = "Allow"
      principals {
        identifiers = ["arn:aws:iam::${statement.value}:root"]
        type        = "AWS"
      }
      actions   = ["kms:*"]
      resources = ["*"]
    }
  }
}

data "aws_caller_identity" "current" {}