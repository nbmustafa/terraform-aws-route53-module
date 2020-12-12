
## Example creating CNAMe with weighted routing policy enabled: 
module "service_dns_cname" {
  source  = "nashvan/route53-module/aws"
  version = "1.2.0"

  hosted_zone = local.account_config["hosted_zone"]
  
  records = [
    {
      name    = "test"
      type    = "CNAME"
      ttl     = "5"
      records = ["develop.abc.cmcloudlab912.info.",]

      weighted_routing_policy = {
        weight         = 90
      }
      set_identifier = "develop"

    }
  ]
}

// Will create the following record for you
// test.cmcloudlab912.info	CNAME	Weighted	90	No	develop.abc.cmcloudlab912.info.
