resource "aws_launch_configuration" "ecs_launch_config" {
    image_id             = "ami-0e5fb9632ceee168f" #epica ami
#    image_id             = "ami-0eba366342cb1dfda" #ecs-optimized ami linux 2
    name                 = "xchange ECS Instance"
    key_name             = "xchange"
    iam_instance_profile = aws_iam_instance_profile.ecs_agent.name
    security_groups      = [aws_security_group.ecs_sg.id]
    user_data            = "#!/bin/bash\necho ECS_CLUSTER=xchange-cluster >> /etc/ecs/ecs.config; echo ECS_BACKEND_HOST= >> /etc/ecs/ecs.config"
    instance_type        = "t2.micro"
#    instance_type        = "t3.large"
    associate_public_ip_address	 = "true"

}

resource "aws_autoscaling_group" "failure_analysis_ecs_asg" {
    name                      = "asg"
    vpc_zone_identifier       = [aws_subnet.pub_subnet.id]
    launch_configuration      = aws_launch_configuration.ecs_launch_config.name
    desired_capacity          = 1
    min_size                  = 0
    max_size                  = 1
    health_check_grace_period = 300
    health_check_type         = "EC2"
}