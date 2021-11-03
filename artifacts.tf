resource "aws_s3_bucket" "codepipeline-artifacts" {
  bucket = "xchange-pipeline-artifacts"
  acl    = "private"
  #region = "us-east-1"
}