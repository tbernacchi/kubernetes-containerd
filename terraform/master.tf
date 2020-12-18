resource "aws_instance" "master" {
  count                  = var.master_count
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.master-sg.id]

  tags = {
    Name = "master0${count.index + 1}"
  }
}

resource "aws_security_group" "master-sg" {
  name        = "k8s-master"
  description = "k8s master rules"

  ingress {
    description = "Kubernetes api server"
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = var.cidr
  }

  ingress {
    description = "Etcd server client API"
    from_port   = 2379
    to_port     = 2380
    protocol    = "tcp"
    cidr_blocks = var.cidr
  }

  ingress {
    description = "Kubelet api"
    from_port   = 10250
    to_port     = 10250
    protocol    = "tcp"
    cidr_blocks = var.cidr
  }

  ingress {
    description = "Kube-scheduler "
    from_port   = 10251
    to_port     = 10252
    protocol    = "tcp"
    cidr_blocks = var.cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr
  }

  tags = {
    Name = "k8s-master"
  }
}

