# RDS Variables

variable "create_rds_cluster" {
  type        = bool
  description = "Switch to determine whether resources should be provisioned or destroyed. Defaults to `true`"
  default     = true
}
variable "rds_cluster_identifier" {
  description = "The cluster identifier. If omitted, Terraform will assign a random, unique identifier."
  type        = string
  default     = null
}

variable "rds_deletion_protection" {
  type        = bool
  description = "If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true"
  default     = true
}

variable "availability_zones" {
  type        = set(string)
  default     = []
  description = "List of EC2 Availability Zones for the DB cluster storage where DB cluster instances can be created. RDS automatically assigns 3 AZs if less than 3 AZs are configured, which will show as a difference requiring resource recreation next Terraform apply"
}

variable "rds_apply_immediately" {
  type        = bool
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. Default is false"
  default     = false
}

variable "rds_engine_version" {
  type        = string
  description = "The version of the database engine to use. See `aws rds describe-db-engine-versions` "
  default     = "13.3"
}

variable "rds_engine" {
  type        = string
  default     = "aurora"
  description = "The name of the database engine to be used for this DB cluster. Valid values: `aurora`, `aurora-mysql`, `aurora-postgresql`"
}

variable "kms_key_id" {
  type        = string
  description = "The ARN for the KMS encryption key. When specifying `kms_key_arn`, `storage_encrypted` needs to be set to `true`"
  default     = ""
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "List of VPC security groups to associate with the Cluster"
  default     = []
}

variable "skip_final_snapshot" {
  type        = bool
  description = "Determines whether a final DB snapshot is created before the DB cluster is deleted"
  default     = false
}

variable "preferred_backup_window" {
  type        = string
  description = "Daily time range during which the backups happen"
  default     = "04:00-06:00"
}

variable "allow_major_version_upgrade" {
  type        = bool
  default     = false
  description = "Enable to allow major engine version upgrades when changing engine versions"
}

variable "rds_cluster_instances" {
  type        = any
  default     = {}
  description = "Aurora RDS Cluster Instances Configuration"
}

variable "kms_key_present" {
  type        = bool
  default     = true
  description = "Wheter to provide a KMS Key for Aurora RDS Cluster"
}

variable "rds_snapshot_identifier" {
  description = "Specifies whether or not to create this cluster from a snapshot. You can use either the name or ARN when specifying a DB cluster snapshot, or the ARN when specifying a DB snapshot"
  type        = string
  default     = null
}

variable "rds_security_group_rules" {
  description = "A map of security group  rule definitions to add to the security group created"
  type        = map(any)
  default     = {}
}

variable "rds_storage_encrypted" {
  type        = bool
  description = "pecifies whether the DB cluster is encrypted. The default is false for provisioned engine_mode and true for serverless engine_mode. When restoring an unencrypted snapshot_identifier, the kms_key_id argument must be provided to encrypt the restored cluster"
  default     = false
}

# ALB Variables

variable "load_balancers" {
  type        = any
  description = "AWS Load Balancers Configuration"
  default     = {}
}
variable "load_balancer_name" {
  type        = string
  description = "AWS Load balancer name"
  default     = null
}

variable "load_balancer_type" {
  type        = string
  description = "AWS Load Balancer Type"
  default     = "application"
}

variable "http_listener_enabled" {
  type        = bool
  description = "Whether to create or not the http, port 80, alb listener"
  default     = true
}

variable "https_listener_enabled" {
  type        = bool
  description = "Whether to create or not the https, port 443, alb listener"
  default     = true
}

variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  type        = string
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource"
  default     = {}
}

variable "rds_tags" {
  type        = map(string)
  description = "A map of tags that will be assigned to RDS"
  default     = {}
}


variable "rds_subnet_ids" {
  type        = list(string)
  description = "A list of subnet IDs that will be used to create a rds subnet group"
  default     = null
}

variable "master_username" {
  type        = string
  description = "RDS Master Username"
  default     = "dbadmin"
}

variable "s3_bucket_region" {
  type        = string
  description = "The region where the S3 bucket will be created"
  default     = "eu-west-2"
}

variable "performance_insights_enabled" {
  description = "Boolean Flag to control whether to enable performance insights or not"
  type        = bool
  default     = false
}

variable "performance_insights_kms_key_id" {
  description = "ARN of KMS key to encrypt performance insights data"
  type        = string
  default     = null
}

variable "performance_insights_retention_period" {
  description = "Amount of time in days to retain Performance Insights data"
  type        = number
  default     = 7
}