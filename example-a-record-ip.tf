
## Example: 
module "service_dns" {
  source = "./modules/"

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
