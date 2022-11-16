<!-- BEGIN_TF_DOCS -->
# terraform-aws-sqs-queues-with-allowed-sns-topics
GitHub: [StratusGrid/terraform-aws-sqs-queues-with-allowed-sns-topics](https://github.com/StratusGrid/terraform-aws-sqs-queues-with-allowed-sns-topics)
## Example
```hcl
module "sqs_queues_with_allowed_sns_topics" {
  source  = "StratusGrid/terraform-aws-sqs-queues-with-allowed-sns-topics/aws"
  version = "1.0.0"
  project_name = "projectname"
}
```
## StratusGrid Standards we assume
- All resource names and name tags shall use `_` and not `-`s
- The old naming standard for common files such as inputs, outputs, providers, etc was to prefix them with a `-`, this is no longer true as it's not POSIX compliant. Our pre-commit hooks will fail with this old standard.
- StratusGrid generally follows the TerraForm standards outlined [here](https://www.terraform-best-practices.com/naming)
## Repo Knowledge
Repository for Module terraform-aws-sqs-queues-with-allowed-sns-topics
## Documentation
This repo is self documenting via Terraform Docs, please see the note at the bottom.
### `LICENSE`
This is the standard Apache 2.0 License as defined [here](https://stratusgrid.atlassian.net/wiki/spaces/TK/pages/2121728017/StratusGrid+Terraform+Module+Requirements).
### `outputs.tf`
The StratusGrid standard for Terraform Outputs.
### `README.md`
It's this file! I'm always updated via TF Docs!
### `tags.tf`
The StratusGrid standard for provider/module level tagging. This file contains logic to always merge the repo URL.
### `variables.tf`
All variables related to this repo for all facets.
One day this should be broken up into each file, maybe maybe not.
### `versions.tf`
This file contains the required providers and their versions. Providers need to be specified otherwise provider overrides can not be done.
## Documentation of Misc Config Files
This section is supposed to outline what the misc configuration files do and what is there purpose
### `.config/.terraform-docs.yml`
This file auto generates your `README.md` file.
### `.github/workflows/pre-commit.yml`
This file contains the instructions for Github workflows, in specific this file run pre-commit and will allow the PR to pass or fail. This is a safety check and extras for if pre-commit isn't run locally.
### `examples/*`
The files in here are used by `.config/terraform-docs.yml` for generating the `README.md`. All files must end in `.tfnot` so Terraform validate doesn't trip on them since they're purely example files.
### `.gitignore`
This is your gitignore, and contains a slew of default standards.
---
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.9 |
## Resources

| Name | Type |
|------|------|
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_sqs_queue.deadletter_queue_standard](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue.queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue_policy.deadletter_queue_standard](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_policy) | resource |
| [aws_sqs_queue_policy.queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_policy) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_deadletter_delay_seconds"></a> [deadletter\_delay\_seconds](#input\_deadletter\_delay\_seconds) | Delay for deadletter msg in seconds | `number` | `0` | no |
| <a name="input_deadletter_max_message_size"></a> [deadletter\_max\_message\_size](#input\_deadletter\_max\_message\_size) | Max size for deadletter msg | `number` | `262144` | no |
| <a name="input_deadletter_message_retention_seconds"></a> [deadletter\_message\_retention\_seconds](#input\_deadletter\_message\_retention\_seconds) | Retention time for deadletter msg in seconds | `number` | `1209600` | no |
| <a name="input_deadletter_receive_wait_time_seconds"></a> [deadletter\_receive\_wait\_time\_seconds](#input\_deadletter\_receive\_wait\_time\_seconds) | Deadletter waiting time to receive msg in seconds | `number` | `20` | no |
| <a name="input_deadletter_visibility_timeout_seconds"></a> [deadletter\_visibility\_timeout\_seconds](#input\_deadletter\_visibility\_timeout\_seconds) | Timeout for deadletter msg visibility in seconds | `number` | `600` | no |
| <a name="input_delay_seconds"></a> [delay\_seconds](#input\_delay\_seconds) | Set the delay in seconds | `number` | `0` | no |
| <a name="input_input_tags"></a> [input\_tags](#input\_input\_tags) | Map of tags to apply to resources | `map(string)` | `{}` | no |
| <a name="input_max_message_size"></a> [max\_message\_size](#input\_max\_message\_size) | Set the max msg size | `number` | `262144` | no |
| <a name="input_message_retention_seconds"></a> [message\_retention\_seconds](#input\_message\_retention\_seconds) | Set the msg retention in seconds | `number` | `1209600` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | String to prefix on object names | `string` | n/a | yes |
| <a name="input_name_suffix"></a> [name\_suffix](#input\_name\_suffix) | String to append to object names. This is optional, so start with dash if using | `string` | `""` | no |
| <a name="input_queue_redrive_max_submissions_before_deadletter"></a> [queue\_redrive\_max\_submissions\_before\_deadletter](#input\_queue\_redrive\_max\_submissions\_before\_deadletter) | Max submissions before send msg to deadletter | `number` | `4` | no |
| <a name="input_receive_wait_time_seconds"></a> [receive\_wait\_time\_seconds](#input\_receive\_wait\_time\_seconds) | Time for waiting when receiving msg in seconds | `number` | `20` | no |
| <a name="input_sqs_to_sns_mappings"></a> [sqs\_to\_sns\_mappings](#input\_sqs\_to\_sns\_mappings) | This is a list of maps in form sns\_queue\_name : sns\_topic. Each entry will have a queue created for it with the corresponding sns topic allowed to publish to the queue. | `map(string)` | n/a | yes |
| <a name="input_visibility_timeout_seconds"></a> [visibility\_timeout\_seconds](#input\_visibility\_timeout\_seconds) | Set the timeout for visibility in seconds | `number` | `600` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sqs_queue_arns"></a> [sqs\_queue\_arns](#output\_sqs\_queue\_arns) | ARN for SQS queue |
| <a name="output_sqs_queue_deadletter_arns"></a> [sqs\_queue\_deadletter\_arns](#output\_sqs\_queue\_deadletter\_arns) | ARN for SQS deadletter |
---
Note, manual changes to the README will be overwritten when the documentation is updated. To update the documentation, run `terraform-docs -c .config/.terraform-docs.yml`
<!-- END_TF_DOCS -->