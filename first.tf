provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "instance" {
 ami = "ami-070bdb8798e3aeba7"
 instance_type = "t2.micro"
 key_name = "devops-rsa"
  tags = {
    Name = "amit11"
  }
 provisioner "remote-exec"{
  inline=["sudo apt-get -y install python"]
  connection{
      type = "ssh"
      user = "ubuntu"
      private_key = "${file("/home/ubuntu/devops-rsa.pem")}"

    }
 }
}
