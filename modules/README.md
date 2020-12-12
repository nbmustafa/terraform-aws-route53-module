# Route53 Records

This module creates DNS records in Route53 zone.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.6 |
| aws | >= 2.49 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.49 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| records | List of maps of DNS records | `any` | `[]` | no |
| hosted_zone | Name of DNS zone | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| this\_route53\_record\_fqdn | FQDN built using the zone domain and name |
| this\_route53\_record\_name | The name of the record |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Maintained by 
Nashwan Mustafa 
