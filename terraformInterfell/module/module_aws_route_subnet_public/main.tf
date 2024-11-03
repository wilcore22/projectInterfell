resource "aws_route_table" "aws_route_table_public" {
  vpc_id = var.name_vpc
}

resource "aws_route" "aws_route_public" {
  route_table_id         = aws_route_table.aws_route_table_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = var.name_igw
}

resource "aws_route_table_association" "aws_route_table_association_public" {
count = length(var.public_subnet_cidrs)
  subnet_id      = element(var.public_subnet_cidrs, count.index)
  route_table_id = aws_route_table.aws_route_table_public.id
}