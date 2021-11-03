resource "aws_vpc" "vpc" {
    cidr_block = "10.1.0.0/22"
    enable_dns_support   = true
    enable_dns_hostnames = true
    tags       = {
        Name = "Terraform xchange VPC"
    }
}