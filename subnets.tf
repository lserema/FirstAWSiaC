resource "aws_subnet" "pub_subnet" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = "10.1.3.0/24"
    availability_zone       = "us-east-1a"
}