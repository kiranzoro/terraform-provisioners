resource "aws_instance" "db"{
    ami = "ami-041e2ea9402c46c32"
    vpc_security_group_ids = ["sg-0c4aa78fe1bbd2e9e"]
    instance_type = "t2.micro"

    tags = {
        Name = "DB"

    }


  provisioner "local-exec" {
    command = "echo  ${self.private_ip} > inventory.txt "

  }
  provisioner "local-exec" {
    command = "ansible-playbook -i inventory.txt -e ansible_user=ec2-user -e ansible_password=DevOps321 web.yaml" 

  }
}
