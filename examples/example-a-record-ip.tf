
## Example creating A record with IP: 
module "service_dns" {
  source  = "nashvan/route53-module/aws"
  version = "1.2.0"

  hosted_zone = local.account_config["hosted_zone"]
  
  records = [
    {
      name  = "abc"
      type  = "A"
      ttl   = 3600
      records = ["10.10.10.10",]
    }
  ]

}
