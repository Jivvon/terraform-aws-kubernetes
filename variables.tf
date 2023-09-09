variable "aws_region" {
  type    = string
  default = "ap-northeast-2"
}

variable "aws_profile" {
  type    = string
  default = null
}

variable "default_tags" {
  type    = map(string)
  default = {}
}
