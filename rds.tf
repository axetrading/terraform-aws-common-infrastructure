
module "rds" {
  source  = "axetrading/axetrading-aurora-rds-cluster/aws"
  version = "1.3.4"
  count   = var.create_rds_cluster ? 1 : 0


  cluster_identifier                    = var.rds_cluster_identifier
  allow_major_version_upgrade           = var.allow_major_version_upgrade
  apply_immediately                     = try(var.rds_apply_immediately, false)
  availability_zones                    = var.availability_zones
  db_cluster_instances                  = var.rds_cluster_instances
  deletion_protection                   = var.rds_deletion_protection
  engine                                = var.rds_engine
  engine_version                        = var.rds_engine_version
  kms_key_id                            = var.kms_key_id
  kms_key_present                       = var.kms_key_present
  master_username                       = var.rds_snapshot_identifier != null ? null : var.master_username
  preferred_backup_window               = var.preferred_backup_window
  security_group_rules                  = var.rds_security_group_rules
  skip_final_snapshot                   = var.skip_final_snapshot
  snapshot_identifier                   = var.rds_snapshot_identifier
  storage_encrypted                     = try(var.rds_storage_encrypted, true)
  subnet_ids                            = var.rds_subnet_ids
  vpc_id                                = var.vpc_id
  vpc_security_group_ids                = var.vpc_security_group_ids
  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_kms_key_id       = var.performance_insights_enabled ? var.performance_insights_kms_key_id : null
  performance_insights_retention_period = var.performance_insights_retention_period

  tags = var.rds_tags

}
