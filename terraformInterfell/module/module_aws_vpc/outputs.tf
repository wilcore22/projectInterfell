output "aws_vpc_id" {
  value       = one(aws_vpc.aws_vpc_company[*].id)
  description = "id vpc"
}