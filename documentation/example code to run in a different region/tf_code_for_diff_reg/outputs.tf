output "back_instance_public_ip_blue" {
  description = "Public IP address of the EC2 instance blue"
  value       = aws_instance.back_instance_blue.public_ip
}

output "alb_dns_name_blue" {
  description = "DNS name of load balancer blue"
  value       = aws_alb.alb_blue.dns_name
}

output "back_instance_public_ip_green" {
  description = "Public IP address of the EC2 instance green"
  value       = aws_instance.back_instance_green.public_ip
}

output "alb_dns_name_green" {
  description = "DNS name of load balancer green"
  value       = aws_alb.alb_green.dns_name
}
