/* Hetzner AX41-NVMe
 * AMD Ryzen 5 3600
 * 64 GB DDR4
 * 2x 512 GB SSD NVMe */
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
