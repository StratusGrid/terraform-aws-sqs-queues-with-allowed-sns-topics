variable "name_prefix" {
  description = "String to prefix on object names"
  type        = string
}

variable "name_suffix" {
  description = "String to append to object names. This is optional, so start with dash if using"
  type        = string
  default     = ""
}

# variable "globally_unique_item_name_suffix" {
#   description = "String to append to object names for objects that are globally unique (like s3 buckets). This is optional, and applied after the name_suffix, so start with dash if using"
#   type        = string
#   default     = ""
# }

variable "input_tags" {
  description = "Map of tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "sqs_to_sns_mappings" {
  # values() does not support typeList yet. Should be released with v0.12, until then it will be 1:1 sqs:sns relationship
  description = "This is a list of maps in form sns_queue_name : sns_topic. Each entry will have a queue created for it with the corresponding sns topic allowed to publish to the queue."
  type        = map(string)
}

variable "queue_redrive_max_submissions_before_deadletter" {
  description = "Max submissions before send msg to deadletter"
  type        = number
  default     = 4
}

variable "visibility_timeout_seconds" {
  description = "Set the timeout for visibility in seconds"
  type        = number
  default     = 600
}

variable "delay_seconds" {
  description = "Set the delay in seconds"
  type        = number
  default     = 0
}

variable "max_message_size" {
  description = "Set the max msg size"
  type        = number
  default     = 262144
}

variable "message_retention_seconds" {
  description = "Set the msg retention in seconds "
  type        = number
  default     = 1209600
}

variable "receive_wait_time_seconds" {
  description = "Time for waiting when receiving msg in seconds"
  type        = number
  default     = 20
}

variable "deadletter_visibility_timeout_seconds" {
  description = "Timeout for deadletter msg visibility in seconds"
  type        = number
  default     = 600
}

variable "deadletter_delay_seconds" {
  description = "Delay for deadletter msg in seconds"
  type        = number
  default     = 0
}

variable "deadletter_max_message_size" {
  description = "Max size for deadletter msg"
  type        = number
  default     = 262144
}

variable "deadletter_message_retention_seconds" {
  description = "Retention time for deadletter msg in seconds"
  type        = number
  default     = 1209600
}

variable "deadletter_receive_wait_time_seconds" {
  description = "Deadletter waiting time to receive msg in seconds"
  type        = number
  default     = 20
}
