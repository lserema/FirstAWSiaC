resource "aws_codepipeline" "cicd_pipeline" {
    name = "tf-cicd"
    role_arn = aws_iam_role.tf-codepipeline-role.arn

    artifact_store {
        type="S3"
        location = aws_s3_bucket.codepipeline_artifacts.id

  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        ConnectionArn = "arn:aws:codestar-connections:us-east-1:655538235395:connection/ec44aa98-c6d7-4b91-b257-25f9eb688951"
        FullRepositoryId  = "lserema/helloworld"
        BranchName = "master"
      }
    }
  }

  stage {
    name = "Build"

    action {
      name            = "Build"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      input_artifacts = ["source_output"]
      output_artifacts = ["build_output"]
      version = "1"

      configuration = {
      ProjectName = "{aws_codebuild_project.this.name}"
      }
    }
  }

  stage {
    name = "DeployDevelopment"

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "ECS"
      input_artifacts = ["build_output"]
      output_artifacts = []
      version = "1"

      configuration = {
      ClusterName = "xchange-cluster"
      ServiceName = "xchange-cluster"
      FileName = "imagedefinitions.json"
      DeploymentTimeout = "15"
      }
    }
  }
}    