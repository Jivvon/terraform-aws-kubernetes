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

variable "cluster_name" {
  type = string
}

variable "master_instance_type" {
  description = "Type of instance for master"
  default     = "t2.medium"
}

variable "worker_instance_type" {
  description = "Type of instance for workers"
  default     = "t2.medium"
}

variable "master_subnet_id" {
  description = "The subnet-id to be used for the master instance. Master can be only in single subnet. All subnets have to belong to the same VPC."
}

variable "worker_subnet_ids" {
  description = "The subnet-ids to be used for the worker instances. Workers can be in multiple subnets. Worker subnets can contain also the master subnet. If you want to run workers in different subnet(s) than master you have to tag the subnets with kubernetes.io/cluster/{cluster_name}=shared.  All subnets have to belong to the same VPC."
  type        = list(string)
}

variable "min_worker_count" {
  description = "Minimal number of worker nodes"
}

variable "max_worker_count" {
  description = "Maximal number of worker nodes"
}
