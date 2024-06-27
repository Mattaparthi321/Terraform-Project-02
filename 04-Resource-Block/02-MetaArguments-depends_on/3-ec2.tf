# Lets Create a EC2 Instance
resource "aws_instance" "tf-ec2" {
  ami           = "ami-0005e0cfe09cc9050"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.tf-prod-pub-subent-1.id #resource.resource_local_name.id
  vpc_security_group_ids = [aws_security_group.tf-sg.id]
  tags = {
    Name = "Webserver"
  }
  key_name = "newdevops"
  # File Function
  user_data = file("apache.sh")
  # Comments
  # Multi Line Comments
  /*user_data = <<-EOF
  #! /bin/bash
  sudo yum update -y
  sudo yum install httpd -y
  sudo service httpd start
  sudo systemctl enable httpd
  echo "<h1> Welcome to Meta Argument Class" > /var/www/html/index.html
  EOF*/
}




