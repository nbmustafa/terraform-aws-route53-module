# ---------------------------------------------------------------------------------------------------------------------
# Existing Route53 Hosted Zone
# ---------------------------------------------------------------------------------------------------------------------
data "aws_route53_zone" "hosted_zone" {
  name         = var.hosted_zone
  private_zone = false
}

# ---------------------------------------------------------------------------------------------------------------------
# local values consumed by the module
# ---------------------------------------------------------------------------------------------------------------------
locals {
  # convert from list to map with unique keys
  recordsets = { for rs in var.records : "${rs.name} ${rs.type}" => rs }
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
}

# ---------------------------------------------------------------------------------------------------------------------
# Create or update all type of Route53 records
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_route53_record" "this" {
  for_each = local.zone_id != null ? local.recordsets : tomap({})

  zone_id = data.aws_route53_zone.hosted_zone.zone_id

  name    = each.value.name != "" ? "${each.value.name}.${data.aws_route53_zone.hosted_zone.name}" : data.aws_route53_zone.hosted_zone.name
  type    = each.value.type
  ttl     = lookup(each.value, "ttl", null)
  records = lookup(each.value, "records", null)
  

  dynamic "alias" {
    for_each = length(keys(lookup(each.value, "alias", {}))) == 0 ? [] : [true]

    content {
      name                   = each.value.alias.name
      zone_id                = each.value.alias.zone_id
      evaluate_target_health = lookup(each.value.alias, "evaluate_target_health", true)
    }
  }

  dynamic "weighted_routing_policy" {
    for_each = length(keys(lookup(each.value, "weighted_routing_policy", {}))) == 0 ? [] : [true]

    content {
      weight                 = each.value.weighted_routing_policy.weight
    }
  }

  set_identifier = lookup(each.value, "set_identifier", null)

  allow_overwrite = true
}
  
