variable "env" {
  type        = string
  description = "Environment to generate the IP whitelist, e.g. dev | prd"
  default     = "dev"
}

variable "include_global" {
  type        = bool
  description = "If yes, the IPs in the global section will append"
  default     = true
}

variable "whitelist_file" {
  type        = string
  description = "IPs Whitelist yml file"
  default     = "whitelist.yml"
}

variable "source_services" {
  type        = list
  description = "Source services want to whitelist, items must be present in whitelist source"
}
