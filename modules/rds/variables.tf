variable "environment" {
  type        = string
  description = "The deployment environment (e.g., dev, prod)"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC where RDS will reside"
}
# Remove public_sg_id and add this:
variable "vpc_cidr" {
  type        = string
  description = "The CIDR block of the VPC to allow database access"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for the DB subnet group"
}

variable "database_name" {
  type    = string
  default = "wordpress"
}

variable "db_username" {
  type    = string
  default = "dbadmin"
}

variable "db_password" {
  type      = string
  sensitive = true # Marks the password as sensitive in console outputs
}