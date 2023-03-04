resource "aws_instance" "my-ec2"{
    ami="ami-0b029b1931b347543"
    instance_type="t2.micro"

    tags = {
    Name = "Mustafa_ec2"
  }
  }
resource  "aws_eip" "my-eip"{
    vpc = true
}
resource "aws_eip_association" "associate"{
    instance_id=aws_instance.my-ec2.id
    allocation_id=aws_eip.my-eip.id

}
output "eip_value" {
    description = "VMs Public IP"
    value= aws_instance.my-ec2.public_ip

}
output "ec2_name" {
    description = "VMs name"
    value= aws_instance.my-ec2.tags.Name

}
output "private_value" {
    description = "VMs Private IP"
    value= aws_instance.my-ec2.private_ip

}
resource "aws_security_group" "sg" {
  tags = {
    type = "terraform-test-security-group"
  }
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.sg.id
  network_interface_id = aws_instance.my-ec2.primary_network_interface_id
}