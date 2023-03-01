module "dev_list" {
  source = "../"

  env                     = "dev"
  source_services         = ["app1-name"]
}

variable "dev_additional_ips" {
  type = list
  description = "Additional IPs"
  default = []
}

output "dev_ips" {
  value = concat(module.dev_list.cidr_blocks, var.dev_additional_ips)
}

module "prd_list" {
  source = "../"

  env             = "prd"
  source_services = ["app2-name"]
  include_global   = false
}

output "prd_ips" {
  value = module.prd_list.cidr_blocks
}

module "another_list" {
  source = "../"

  env    = "testing"
  source_services = ["app2-name", "app3rd-name"]
  whitelist_file = "localwh.yml"
}

output "another_ips" {
  value = module.another_list.cidr_blocks
}
