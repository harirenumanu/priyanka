resource "aws_ecr_repository" "foo" {
  name                 = var.rep_name
  image_tag_mutability = var.mutability

  image_scanning_configuration {
    scan_on_push = var.scan
  }
}