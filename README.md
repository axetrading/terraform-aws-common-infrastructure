<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.36 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alb"></a> [alb](#module\_alb) | axetrading/load-balancer/aws | 1.3.3 |
| <a name="module_rds"></a> [rds](#module\_rds) | axetrading/axetrading-aurora-rds-cluster/aws | 1.3.3 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_major_version_upgrade"></a> [allow\_major\_version\_upgrade](#input\_allow\_major\_version\_upgrade) | Enable to allow major engine version upgrades when changing engine versions | `bool` | `false` | no |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | List of EC2 Availability Zones for the DB cluster storage where DB cluster instances can be created. RDS automatically assigns 3 AZs if less than 3 AZs are configured, which will show as a difference requiring resource recreation next Terraform apply | `set(string)` | `[]` | no |
| <a name="input_create_rds_cluster"></a> [create\_rds\_cluster](#input\_create\_rds\_cluster) | Switch to determine whether resources should be provisioned or destroyed. Defaults to `true` | `bool` | `true` | no |
| <a name="input_http_listener_enabled"></a> [http\_listener\_enabled](#input\_http\_listener\_enabled) | Whether to create or not the http, port 80, alb listener | `bool` | `true` | no |
| <a name="input_https_listener_enabled"></a> [https\_listener\_enabled](#input\_https\_listener\_enabled) | Whether to create or not the https, port 443, alb listener | `bool` | `true` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The ARN for the KMS encryption key. When specifying `kms_key_arn`, `storage_encrypted` needs to be set to `true` | `string` | `""` | no |
| <a name="input_kms_key_present"></a> [kms\_key\_present](#input\_kms\_key\_present) | Wheter to provide a KMS Key for Aurora RDS Cluster | `bool` | `true` | no |
| <a name="input_load_balancer_name"></a> [load\_balancer\_name](#input\_load\_balancer\_name) | AWS Load balancer name | `string` | `null` | no |
| <a name="input_load_balancer_type"></a> [load\_balancer\_type](#input\_load\_balancer\_type) | AWS Load Balancer Type | `string` | `"application"` | no |
| <a name="input_load_balancers"></a> [load\_balancers](#input\_load\_balancers) | AWS Load Balancers Configuration | `any` | `{}` | no |
| <a name="input_master_username"></a> [master\_username](#input\_master\_username) | RDS Master Username | `string` | `"dbadmin"` | no |
| <a name="input_preferred_backup_window"></a> [preferred\_backup\_window](#input\_preferred\_backup\_window) | Daily time range during which the backups happen | `string` | `"04:00-06:00"` | no |
| <a name="input_rds_apply_immediately"></a> [rds\_apply\_immediately](#input\_rds\_apply\_immediately) | Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. Default is false | `bool` | `false` | no |
| <a name="input_rds_cluster_identifier"></a> [rds\_cluster\_identifier](#input\_rds\_cluster\_identifier) | The cluster identifier. If omitted, Terraform will assign a random, unique identifier. | `string` | `null` | no |
| <a name="input_rds_cluster_instances"></a> [rds\_cluster\_instances](#input\_rds\_cluster\_instances) | Aurora RDS Cluster Instances Configuration | `any` | `{}` | no |
| <a name="input_rds_deletion_protection"></a> [rds\_deletion\_protection](#input\_rds\_deletion\_protection) | If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true | `bool` | `true` | no |
| <a name="input_rds_engine"></a> [rds\_engine](#input\_rds\_engine) | The name of the database engine to be used for this DB cluster. Valid values: `aurora`, `aurora-mysql`, `aurora-postgresql` | `string` | `"aurora"` | no |
| <a name="input_rds_engine_version"></a> [rds\_engine\_version](#input\_rds\_engine\_version) | The version of the database engine to use. See `aws rds describe-db-engine-versions` | `string` | `"13.3"` | no |
| <a name="input_rds_security_group_rules"></a> [rds\_security\_group\_rules](#input\_rds\_security\_group\_rules) | A map of security group  rule definitions to add to the security group created | `map(any)` | `{}` | no |
| <a name="input_rds_snapshot_identifier"></a> [rds\_snapshot\_identifier](#input\_rds\_snapshot\_identifier) | Specifies whether or not to create this cluster from a snapshot. You can use either the name or ARN when specifying a DB cluster snapshot, or the ARN when specifying a DB snapshot | `string` | `null` | no |
| <a name="input_rds_storage_encrypted"></a> [rds\_storage\_encrypted](#input\_rds\_storage\_encrypted) | pecifies whether the DB cluster is encrypted. The default is false for provisioned engine\_mode and true for serverless engine\_mode. When restoring an unencrypted snapshot\_identifier, the kms\_key\_id argument must be provided to encrypt the restored cluster | `bool` | `false` | no |
| <a name="input_rds_subnet_ids"></a> [rds\_subnet\_ids](#input\_rds\_subnet\_ids) | A list of subnet IDs that will be used to create a rds subnet group | `list(string)` | `null` | no |
| <a name="input_rds_tags"></a> [rds\_tags](#input\_rds\_tags) | A map of tags that will be assigned to RDS | `map(string)` | `{}` | no |
| <a name="input_s3_bucket_region"></a> [s3\_bucket\_region](#input\_s3\_bucket\_region) | The region where the S3 bucket will be created | `string` | `"eu-west-2"` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | Determines whether a final DB snapshot is created before the DB cluster is deleted | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resource | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC where to create security group | `string` | `null` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | List of VPC security groups to associate with the Cluster | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_http_listener_arn"></a> [http\_listener\_arn](#output\_http\_listener\_arn) | n/a |
| <a name="output_https_listener_arn"></a> [https\_listener\_arn](#output\_https\_listener\_arn) | n/a |
| <a name="output_load_balancer_arn"></a> [load\_balancer\_arn](#output\_load\_balancer\_arn) | n/a |
| <a name="output_load_balancer_dns_name"></a> [load\_balancer\_dns\_name](#output\_load\_balancer\_dns\_name) | n/a |
| <a name="output_load_balancer_name"></a> [load\_balancer\_name](#output\_load\_balancer\_name) | n/a |
| <a name="output_rds_cluster_arn"></a> [rds\_cluster\_arn](#output\_rds\_cluster\_arn) | Aurora RDS Cluster ARN |
| <a name="output_rds_cluster_endpoint"></a> [rds\_cluster\_endpoint](#output\_rds\_cluster\_endpoint) | Main endpoint for the Aurora RDS cluster |
| <a name="output_rds_cluster_name"></a> [rds\_cluster\_name](#output\_rds\_cluster\_name) | Aurora RDS Cluster Name |
| <a name="output_rds_cluster_reader_endpoint"></a> [rds\_cluster\_reader\_endpoint](#output\_rds\_cluster\_reader\_endpoint) | A read-only endpoint for the Aurora cluster, automatically load-balanced across replicas |
| <a name="output_security_group_arn"></a> [security\_group\_arn](#output\_security\_group\_arn) | n/a |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | n/a |
| <a name="output_security_group_name"></a> [security\_group\_name](#output\_security\_group\_name) | n/a |
| <a name="output_target_group_names"></a> [target\_group\_names](#output\_target\_group\_names) | n/a |
| <a name="output_target_groups_spec"></a> [target\_groups\_spec](#output\_target\_groups\_spec) | n/a |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | n/a |
<!-- END_TF_DOCS -->