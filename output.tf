output "instance_public_ip" {
   description = "Public IP of all instance"
   value = aws_instance.ec2_ansible[*].public_ip
}

output "instance_id" {
   description = "Instance id of all instances"
   value = aws_instance.ec2_ansible[*].id
}

output "security_group_id" {
    description = "Group id of security group"
    value = aws_security_group.ansible_sg.id
}
