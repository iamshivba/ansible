data "aws_ami" "server_ami" {
    most_recent = true
    owners = ["amazon"]

filter {
    name = "name"
    value =["al2023-ami-*-x86_64"] 
   }

filter {
    name = "virtualization type"
    value =["hvm"]
   }
}

data "aws_key_name" "my_key" {
    key_name = "shiv_key"
    include_public_key = true
}

resource "aws_ecurity_group" "ansible_sg" {
     name = "ansbile_security_group"
     description = "Allow SSH, HTTP and HTTPS traffic"

     ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_block = ["0.0.0.0/0"]
     }

     ingress {
        description = "HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cide_block = ["0.0.0.0/0"]
    }

    ingress {
       description = "HTTPS"
       from_port = 443
       to_port = 443
       protocol = "tcp"
       cidr_block = ["0.0.0.0/0"]
    }

    egress {
       description = "Allow all traffic rules"
       from_port = 0
       to_port = 0
       protocol = "-1" 
       cidr_block = ["0.0.0.0/0]
    }

      tags = { 
          Name = "ansbile_security_group"
        }
}

resource "aws_instance" "ec2_ansible" {
      count = 3
      ami = data.aws_ami.server_ami.id
      instance_tye = "t3.micro"
      key_name = data.aws_key_name.my_key.key_name
      vpc_security_group_id = [aws_security_group.ansible_sg.id]
      associate_public_ip_address = true 

      tags = {
         Name = "Server-${count.index +1}"
     }
}
