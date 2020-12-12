locals {
  aws_account_id               = data.aws_caller_identity.current.account_id
  aws_region                   = data.aws_region.current.name
  app_name                     = "abc"
  prefix                       = "${local.app_name}-${var.environment_name}"

  account_configs = {
    prod = {
      environment_type     = "prod"
      hosted_zone          = "cmcloudlab912.info"
      account              = "prod"
    }

    uat = {
      environment_type     = "uat"
      hosted_zone          = "cmcloudlab912.info"
      account              = "uat"
    }

    sit = {
      environment_type     = "sit"
      hosted_zone          = "cmcloudlab912.info"
      account              = "nonprod"
    }

    develop = {
      environment_type     = "dev"
      hosted_zone          = "cmcloudlab912.info"
      account              = "nonprod"
    }
  }

  tags = {
    EnvironmentType = local.account_config["environment_type"]
    EnvironmentName = var.environment_name
    AppName         = local.app_name
  }

  account_config = local.account_configs[var.environment_name]
}
