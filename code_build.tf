resource "aws_codebuild_project" "this" {
  name         = "example-codebuild"
  description  = "Codebuild for the ECS Green/Blue Example app"
  service_role = "${aws_iam_role.tf-codebuild-role.arn}"

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/docker:18.09.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = true

    environment_variable {
      name = "REPOSITORY_URI"
      value = "${aws_ecr_repository.xchange.repository_url}"
    }
  }
  source {
    type = "CODEPIPELINE"
  }
}