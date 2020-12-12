## Maintained by 
Nashwan Mustafa

###############################
## Examples
###############################

## 1. A record with alias
- this example will create an A record with Alias pointing to a resource name for example alb, s3, cloudfront, etc. 

```
module "service_dns_a_record" {
  source = "./modules/"

  hosted_zone = local.account_config["hosted_zone"]
  
  records = [
    {
      name  = "${var.environment_name}.${local.app_name}"
      type  = "A"
      alias = {
        name    = "abc-1830827336.xyz.elb.amazonaws.com"
        zone_id = "Z35SXDOTRQ7X7K"
      }
    }
  ]

}
```


## 2. A record with no alias
- this example will create an A record pointing to the IP address

```
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

```


## 3. CNAME record
- this example will create a CNAME record (poiting an fqdn to another fqdn for example)

```
module "service_dns_cname" {
  source = "./modules/"

  hosted_zone = local.account_config["hosted_zone"]
  
  records = [
    {
      name    = "xyz"
      type    = "CNAME"
      ttl     = "5"
      records = ["develop.abc.test.info.",]
    }
  ]
}
```
// Will create the following record for you
// xyz.cmcloudlab912.info	CNAME	Simple	-	No	develop.abc.cmcloudlab912.info. 5

## 4. CNAME wighted routing policy 

```
module "service_dns_cname" {
  source = "./modules/"

  hosted_zone = local.account_config["hosted_zone"]
  
  records = [
    {
      name    = "test"
      type    = "CNAME"
      ttl     = "5"
      records = ["develop.abc.test.info.",]

      weighted_routing_policy = {
        weight         = 90
      }
      set_identifier = "develop"

    }
  ]
}
```
// Will create the following record for you
// test.test.info	CNAME	Weighted	90	No	develop.abc.test.info.


test.cmcloudlab912.info	CNAME	Simple	-	No	develop.abc.cmcloudlab912.info. 5
