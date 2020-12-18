resource "aws_instance" "nodes" {
  count                  = var.node_count
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.nodes-sg.id]

  tags = {
    Name = "nodes0${count.index + 1}"
  }
}

resource "aws_security_group" "nodes-sg" {
  name        = "k8s-nodes"
  description = "k8s nodes rules"

  ingress {
    description = "Kubelet api"
    from_port   = 10250
    to_port     = 10250
    protocol    = "tcp"
    cidr_blocks = var.cidr
  }

  ingress {
    description = "NodePort all services"
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = var.cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "k8s-nodes"
  }
}

