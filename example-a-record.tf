
## Example creating A record with Alias: 
module "service_dns_a_record" {
  source = "./modules/"

  hosted_zone = local.account_config["hosted_zone"]
  
  records = [
    {
      name  = "${var.environment_name}.${local.app_name}"
      type  = "A"
      alias = {
        name    = "abc-1830827336.us-east-1.elb.amazonaws.com"
        zone_id = "Z35SXDOTRQ7X7K"
      }
    }
  ]

}

output "fqdn" {
  value = module.service_dns_a_record.fqdn
}
