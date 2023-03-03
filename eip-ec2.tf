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