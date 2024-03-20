variable "name" {
  description = "The name of the SQS end with .fifo"
  default = "forta_sqs.fifo"
}

variable "enabled" {
  type = bool
  default = true
}