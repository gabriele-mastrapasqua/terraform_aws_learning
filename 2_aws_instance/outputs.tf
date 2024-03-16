output "instance_id" {
  description = "EC2 instance id."
  value       = aws_instance.my_app_instance.id
}

output "instance_public_ip" {
  description = "EC2 instance public IP."
  value       = aws_instance.my_app_instance.public_ip
}
