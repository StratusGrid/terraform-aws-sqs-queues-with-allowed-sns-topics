# terraform-aws-sqs-queues-with-allowed-sns-topics
Queue and Deadletter queue that has trusting role set up for SNS Topics

### Example Usage:
```
module "sqs_queues_etl" {
  source      = "github.com/StratusGrid/terraform-aws-sqs-queues-with-allowed-sns-topics"
  name_prefix = "${var.name_prefix}"
  name_suffix = ""
  sqs_to_sns_mappings = "${var.sqs_to_sns_mappings}"
  input_tags  = "${merge(local.common_tags,
    map(
    )
  )}"
}
```