
variable "hosted_zone" {
  description = "The hosted zone that will be utilised for route53"
}

variable "records" {
  description = "List of maps of DNS records"
  type        = any
  default     = []
}