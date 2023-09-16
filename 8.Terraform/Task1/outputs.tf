output "ec2_public_ip" {
  value = aws_instance.test-web-server.public_ip
}
output "ec2_ami" {
  value = aws_instance.test-web-server.ami
}
output "ec2_type" {
  value = aws_instance.test-web-server.instance_type
}
output "public_vpc_id" {
  value = aws_vpc.task1-vpc.id
}
output "ec2_subnet_id" {
  value = aws_instance.test-web-server.subnet_id
}
output "public_subnet_AZ" {
  value = aws_subnet.task1-subnet.availability_zone
}
output "ec2_region" {
  value = var.region
}
