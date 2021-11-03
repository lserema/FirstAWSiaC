resource "aws_ecs_service" "xchange" {
  name            = "xchange-cluster"
  cluster         = aws_ecs_cluster.xchange.id
  task_definition = aws_ecs_task_definition.task_definition.arn
  desired_count   = 2
}