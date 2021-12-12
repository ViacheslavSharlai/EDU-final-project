variable "aws_region" {
  default = "eu-west-2"
}

variable "aws_availability_zone_1" {
  default = "eu-west-2a"
}

variable "aws_availability_zone_2" {
  default = "eu-west-2b"
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

variable "AMI" {
  type = map(any)

  default = {
    eu-west-2 = "ami-047e03b8591f2d48a"
  }
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
