module "lez" {
  source = "github.com/status-im/infra-tf-dummy-module"

  name   = "lez"
  group  = "lez"
  env    = "logos"
  stage  = terraform.workspace
  region = "eu-hel1"
  prefix = "he"

  ips = local.ws["lez_node_ips"]
}

resource "cloudflare_record" "lez_explorer" {
  count = length(module.lez.public_ips) > 0 ? 1 : 0

  zone_id = lookup(local.zones, "logos.co")
  name    = "explorer.${terraform.workspace}net.lez"
  value   = module.lez.public_ips[0]
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "lez_rpc" {
  count = length(module.lez.public_ips) > 0 ? 1 : 0

  zone_id = lookup(local.zones, "logos.co")
  name    = "${terraform.workspace}net.lez"
  value   = module.lez.public_ips[0]
  type    = "A"
  proxied = false
}
