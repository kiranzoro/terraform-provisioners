resource "aws_instance" "db"{
    ami = "ami-031d574cddc5bb371"
    vpc_security_group_ids = ["sg-0c4aa78fe1bbd2e9e"]
    instance_type = "t2.micro"

    tags = {
        Name = "DB"

    }


  provisioner "local-exec" {
    command = "echo T ${self.private_ip}" > inventory.txt

  }
  provisioner "local-exec" {
    command = "ansible-playbook -i inventory.txt web.yaml 

  }
}
