resource "aws_ecs_task_definition" "task_definition" {
  family                = "TD-TASK-CLIENTES-XCHANGE-V1"
  requires_compatibilities = ["EC2"]
  cpu                      = 512
  memory                   = 512
  container_definitions = file("task_definition.json")
  }