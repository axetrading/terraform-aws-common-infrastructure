#RDS OUTPUTS
output "rds_cluster_name" {
  value = try(module.rds[0].rds_cluster_name, "")
  description = "Aurora RDS Cluster Name"
}

output "rds_cluster_arn" {
  value = try(module.rds[0].rds_cluster_arn, "")
  description = "Aurora RDS Cluster ARN"
}

output "rds_cluster_endpoint" {
  value = try(module.rds[0].rds_cluster_endpoint, "")
  description = "Main endpoint for the Aurora RDS cluster"
}

output "rds_cluster_reader_endpoint" {
  value       = try(module.rds[0].reader_endpoint, "")
  description = "A read-only endpoint for the Aurora cluster, automatically load-balanced across replicas"
}

# ALB OUTPUTS

output "load_balancer_name" {
  value = { for k, v in module.alb : k => v.id }
}

output "load_balancer_arn" {
  value = { for k, v in module.alb : k => v.arn }
}

output "load_balancer_dns_name" {
  value = { for k, v in module.alb : k => v.dns_name }
}

output "zone_id" {
  value = { for k, v in module.alb : k => v.zone_id }
}

output "security_group_id" {
  value = { for k, v in module.alb : k => v.security_group_id }
}

output "security_group_name" {
  value = { for k, v in module.alb : k => v.security_group_name }
}

output "security_group_arn" {
  value = { for k, v in module.alb : k => v.security_group_arn }
}

output "http_listener_arn" {
  value = { for k, v in module.alb : k => v.http_listener_arn }
}

output "https_listener_arn" {
  value = { for k, v in module.alb : k => v.https_listener_arn }
}

output "target_group_names" {
  value = { for k, v in module.alb : k => v.target_group_names }
}

output "target_groups_spec" {
  value = { for k, v in module.alb : k => v.target_groups }
}