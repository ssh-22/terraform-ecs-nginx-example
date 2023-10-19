resource "aws_ecs_service" "my_service" {
  name            = "my-service"
  cluster         = aws_ecs_cluster.my_cluster.id
  task_definition = aws_ecs_task_definition.my_task.arn
  launch_type     = "FARGATE"
  desired_count = 1

  network_configuration {
    subnets = [aws_subnet.public_1a.id, aws_subnet.public_1c.id]
    security_groups = [aws_security_group.allow_alb.id]
    assign_public_ip = true
  }
}
