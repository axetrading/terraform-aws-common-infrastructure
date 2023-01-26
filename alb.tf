module "alb" {
  for_each = var.load_balancers
  source   = "axetrading/load-balancer/aws"
  version  = "1.2.0"

  name                   = each.value.load_balancer_name
  load_balancer_type     = each.value.load_balancer_type
  http_listener_enabled  = try(each.value.http_listener_enabled, true)
  https_listener_enabled = try(each.value.https_listener_enabled, true)
  certificate_arn        = each.value.certificate_arn
  create_security_group  = try(each.value.create_lb_security_group, true)
  security_group_name    = try(each.value.create_lb_security_group, true) ? each.value.lb_security_group_name : null
  security_group_rules   = try(each.value.create_lb_security_group, true) ? each.value.lb_security_group_rules : null
  security_groups        = try(each.value.lb_additional_security_groups, [])
  subnets                = each.value.lb_subnet_ids
  target_groups          = each.value.target_groups_spec
  vpc_id                 = each.value.vpc_id

  tags = var.tags
}