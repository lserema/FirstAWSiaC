resource "aws_ecr_repository" "xchange" {
    name  = "xchange-worker"

    image_scanning_configuration {
    scan_on_push = true
    }
}