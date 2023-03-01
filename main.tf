locals {
  whitelist_file  = fileexists(var.whitelist_file) ? var.whitelist_file : "${path.module}/whitelist.yml"
  whitelist      = yamldecode(file(local.whitelist_file))
  global_srv_ips  = lookup(local.whitelist, "global")
  env_srv_ips     = lookup(local.whitelist, var.env)
  global_ips      = flatten([for s in var.source_services : lookup(local.global_srv_ips, s, "")])
  env_ips         = flatten([for s in var.source_services : lookup(local.env_srv_ips, s, "")])
  ips             = var.include_global ? compact(concat(local.env_ips, local.global_ips)) : compact(local.env_ips)
}
