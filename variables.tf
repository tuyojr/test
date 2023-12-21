variable "region" {
  type        = string
  description = "The AWS region to deploy to."
  default     = "us-east-1"
}

variable "Dev" {
  type = string
  description = "Environment tag"
  default = "dev"
}

variable "bucket" {
  type = string
  description = "bucket name"
  default = "test"
}

variable "role" {
  type = string
  description = "aws iam role name"
  default = "test_role"
}

variable "policy" {
  type = string
  description = "aws iam policy name"
  default = "test_policy"
}

variable "object_key_name" {
  type = string
  description = "object key name"
  default = "text.txt"
}

variable "cidr_block" {
  type        = list(string)
  description = "The CIDR block for the VPC."
  default     = ["10.10.0.0/16", "0.0.0.0/0"]
}

variable "subnet_cidr_block" {
  type        = list(string)
  description = "The CIDR block for the subnets."
  default     = ["10.10.0.0/24", "10.10.2.0/24", "10.10.3.0/24", "10.10.4.0/24", "10.10.5.0/24", "10.10.6.0/24"]
}

variable "instance_type" {
  type        = string
  description = "The instance type."
  default     = "t2.micro"
}

variable "availability_zones" {
  type        = list(string)
  description = "The first availability zone."
  default     = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]
}

variable "tags" {
  type        = list(string)
  description = "The tags for the different resources in order they were created."
  default     = ["testVPC", "testRoute", "testGW", "testPubSG"]
}

variable "tag" {
  type = list(string)
  description = "Tags for subnets"
  default = ["testPrivSunet1", "testPubSunet1", "testPrivSunet2", "testPubSunet2", "testPrivSunet3", "testPubSunet3"]
}

variable "key_pair" {
  type = string
  description = "AWS Key Pair"
}