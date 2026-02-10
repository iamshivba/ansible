data "aws_ami" "amazon_linux" {
    most_recent = true                
    owners      = ["amazon"]

    filter {
      name   = "name"
      values = ["al2023-ami-*-x86_64"]   
    }
    
    filter {
      name   = "virtualization-type"    
      values = ["hvm"]
    }
}

data "aws_key_pair" "my_key" {
      key_name = "shiv_key"
}

resource "aws_instance" "ec2_ansible" {
    ami = "data.aws_ami.amazon_linux"
    instance_type = "t3.micro "
    key_name = "aws_key_pair.my_key.key_name

    tags = {
    Name ="ansible_master " 
   }
}

