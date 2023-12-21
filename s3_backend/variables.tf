variable "bucket_name" {
  type = string
  description = "tf state bucket name"
  default = "tf_state"
}

variable "table_name" {
  type = string
  description = "dynamoDB table name"
  default = "tf_state_table"
}