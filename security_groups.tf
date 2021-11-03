
resource "aws_security_group" "ecs_sg" {
    vpc_id      = aws_vpc.vpc.id

    ingress {
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    ingress {
        from_port       = 443
        to_port         = 443
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    ingress {
        protocol        = "tcp"
        from_port       = 3000
        to_port         = 3000
        cidr_blocks     = ["0.0.0.0/0"]
    }

    ingress {
        protocol        = "tcp"
        from_port       = 8080
        to_port         = 8080
        cidr_blocks     = ["0.0.0.0/0"]
    
  }

    egress {
        from_port       = 0
        to_port         = 65535
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }
}