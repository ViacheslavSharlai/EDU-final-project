variable "aws_region" {
  default = "eu-central-1"
}

variable "aws_availability_zone_1" {
  default = "eu-central-1a"
}

variable "aws_availability_zone_2" {
  default = "eu-central-1b"
}

variable "vpc_name" {
  type        = string
  description = "main vpc"
  default     = "main-vpc-1"
}

variable "bucket-name" {
  type        = string
  description = "My Bucket"
  default     = "arn:aws:s3:::vsharlai-bucket"
}

variable "instance-type" {

  type        = string
  description = "Instance type"
  default     = "t2.micro"
}

variable "key-name" {

  type    = string
  default = "AWS_key"
}

variable "color" {
  type        = string
  description = "deployment type"
}

variable "email" {
  default = "viacheslav.sharlai@dev.pro"
}

variable "api_key" {
  default = "22297607cf3c46092d838037fc1ec412501f7"
}
