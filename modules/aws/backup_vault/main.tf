resource "aws_backup_vault" "this" {
  name = var.name
  tags = var.tags
}
