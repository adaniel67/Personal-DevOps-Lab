
output "vpc_id" {
  description = "The ID of the lab VPC"
  value       = aws_vpc.lab_vpc.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = aws_subnet.private_subnet.id
}

output "security_group_id" {
  description = "The ID of the lab security group"
  value       = aws_security_group.lab_security_group.id
}

output "ec2_instance_id" {
  description = "The ID of the lab EC2 instance"
  value       = aws_instance.lab_ec2.id
}