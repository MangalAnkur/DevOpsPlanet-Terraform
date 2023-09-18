resource "aws_security_group" "demo-sg" {
  name        = var.security_group_name
  description = "Created By Terraform"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_key_pair" "demo-key-pair" {
  key_name   = var.key_pair_name
  public_key = file("id_rsa.pub")
}


resource "aws_instance" "ec2_instance" {
  ami           = var.instance_ami_id
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }
  security_groups = [
    "${aws_security_group.demo-sg.name}"
  ]
  key_name = var.key_pair_name
}


resource "aws_eip" "elastic_ip" {
  instance   = aws_instance.ec2_instance.id
  depends_on = [aws_instance.ec2_instance]
}


resource "null_resource" "example_provisioner_apache2" {
  connection {
    type        = "ssh"
    host        = aws_eip.elastic_ip.public_ip
    user        = "ubuntu"
    port        = 22
    private_key = file("id_rsa")
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install apache2 -y ",
      "sudo service apache2 restart",
      "sudo chmod  o+w /var/www/html",
      "sudo rm  /var/www/html/index.html",
      "sudo echo 'Hello!!  This is By Ankur Mangal' >> /var/www/html/index.html"
    ]
  }
}