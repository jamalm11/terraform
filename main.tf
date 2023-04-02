provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "example" {
  ami           = "ami-007855ac798b5175e"
  instance_type = "t2.micro"
user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  user_data_replace_on_change = true

tags = {
 name = "terraform-example"
}
}
