module "ecr" {
  source = "../modules/ecr"
  scan = var.scan
  rep_name = var.rep_name
  mutability = var.mutability
}