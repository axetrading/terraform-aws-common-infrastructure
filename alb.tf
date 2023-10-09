module "alb" {
  for_each = var.load_balancers
  source   = "axetrading/load-balancer/aws"
  version  = "1.3.2"

  name                        = each.value.load_balancer_name
  access_logs_bucket_name     = try(each.value.access_logs_bucket, null)
  access_logs_prefix          = try(each.value.access_logs_prefix, null)
  certificate_arn             = each.value.certificate_arn
  create_access_logs_bucket   = try(each.value.create_access_logs_bucket, false)
  create_security_group       = try(each.value.create_lb_security_group, true)
  enable_access_logs          = try(each.value.enable_access_logs, false)
  existing_access_logs_bucket = try(each.value.existing_access_logs_bucket, null)
  http_listener_enabled       = try(each.value.http_listener_enabled, true)
  https_listener_enabled      = try(each.value.https_listener_enabled, true)
  idle_timeout                = try(each.value.idle_timeout, 60)
  load_balancer_type          = each.value.load_balancer_type
  security_group_name         = try(each.value.create_lb_security_group, true) ? each.value.lb_security_group_name : null
  security_group_rules        = try(each.value.create_lb_security_group, true) ? each.value.lb_security_group_rules : null
  security_groups             = try(each.value.lb_additional_security_groups, [])
  subnets                     = each.value.lb_subnet_ids
  target_groups               = each.value.target_groups_spec
  vpc_id                      = each.value.vpc_id
  region                      = var.s3_bucket_region

  tags = var.tags
}