##################################################################################
# DATA
##################################################################################

data "aws_ssm_parameter" "ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

##################################################################################
# RESOURCES
##################################################################################

# SECURITY GROUPS #
# Nginx security group 
resource "aws_security_group" "bastion2-sg" {
  name   = "bastion2-sg"
  vpc_id = var.vpc_id

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = local.common_tags
}

# INSTANCES #

resource "aws_instance" "bastion2" {
  ami                    = nonsensitive(data.aws_ssm_parameter.ami.value)
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.bastion2-sg.id]
  key_name               = "concilmigracao"
  root_block_device {
    volume_type = "gp2"
    volume_size = 30
  }
  user_data = <<EOF
#! /bin/bash
sudo yum update -y
sudo yum install -y docker
sudo service docker start
sudo docker run -p 80:80 -e 'PGADMIN_DEFAULT_EMAIL=ravi.fiori@concil.com.br' -e 'PGADMIN_DEFAULT_PASSWORD=Ox!g3n!0' -d dpage/pgadmin4
EOF

  tags = local.common_tags

}
