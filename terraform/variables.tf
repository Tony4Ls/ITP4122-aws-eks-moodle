# Variable for the AWS region to deploy in
variable "region" {
  description = "The AWS region to deploy in"
  type        = string
  default     = "us-east-1"
}

# Variable for the VPC CIDR block
variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.6.0.0/16"
}

# Variable for the VPC name
variable "vpc_name" {
  description = "The name tag for the VPC"
  type        = string
  default     = "B07-vpc"
}

# Variable for the RDS master password
variable "rds_master_password" {
  description = "The master password for the RDS instance"
  type        = string
  default     = "admin1234"
}

# Variable for the RDS master username
variable "rds_master_username" {
  description = "The master username for the RDS instance"
  type        = string
  default     = "admin"
}

# Variable for the RDS engine version
variable "rds_engine_version" {
  description = "The engine version for the RDS instance"
  type        = string
  default     = "8.0.mysql_aurora.3.05.2"
}
