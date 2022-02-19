
variable "aurora_cluster_identifier" {
  type        = string
  description = "Aurora: cluster name"
  nullable    = false
}

variable "aurora_port" {
  type        = number
  description = "Aurora: connection port"
  nullable    = false
}

variable "aurora_engine" {
  type        = string
  description = "Aurora: engine"
  nullable    = false
}

variable "aurora_engine_version" {
  type        = string
  description = "Aurora: engine version"
  nullable    = false
}

variable "aurora_master_username" {
  type        = string
  description = "Aurora: master username"
  default     = "masterdba"
  nullable    = true
}

variable "aurora_master_password" {
  type        = string
  description = "Aurora: master username"
  default     = "masterdba"
  nullable    = true
}

variable "vpc_az_names" {
  type        = list(string)
  description = "VPC AZ: list of names"
  nullable    = false
}

variable "vpc_id" {
  type        = string
  description = "VPC: id"
  nullable    = false
}

variable "vpc_subnet_db_ids" {
  type        = list(string)
  description = "VPC: list of db subnet ids"
  nullable    = false
}

variable "vpc_subnet_app_cidrs" {
  type        = list(string)
  description = "VPC: list of app subnets cidr"
  nullable    = false
}
