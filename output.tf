output "instance_public_ip" {
   value = aws_instance.ec2_ansible.public_ip
}

output "instance_id" {
   value = aws_instance.ec2_ansible.id
}
