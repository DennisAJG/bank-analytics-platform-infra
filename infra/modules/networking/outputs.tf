output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_ids" {
  value = [for s in aws_subnet.public : s.id]
}

output "private_app_subnet_ids" {
  value = [for s in aws_subnet.private_app : s.id]
}

output "private_db_subnet_ids" {
  value = [for s in aws_subnet.private_db : s.id]
}

output "alb_sg_id" {
  value = aws_security_group.alb.id
}

output "eks_nodes_sg_id" {
  value = aws_security_group.eks_nodes.id
}

output "db_sg_id" {
  value = aws_security_group.db.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.this.id
}
