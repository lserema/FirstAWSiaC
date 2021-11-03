resource "aws_s3_bucket" "xchange-terraform-state-bucket" {
  bucket = "xchange-terraform-state-bucket"
  acl    = "private"
#  region = "us-east-1"
}
resource "aws_s3_bucket" "codepipeline_artifacts" {
  bucket = "xchange-pipeline-artifacts"
  acl    = "private"
# region = "us-east-1"
}

