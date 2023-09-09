## EC2 instance
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "master" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.master_instance_type
  # TODO
  #  key_name = ""
  subnet_id                   = var.master_subnet_id
  associate_public_ip_address = false
  # TODO
  #  vpc_security_group_ids = [
  #    aws_security_group.kubernetes.id
  #  ]
  # TODO
  #  iam_instance_profile = aws_iam_instance_profile.master_profile.name
  # TODO
  #  user_data = ""

  tags = {
    Name                                                 = join("-", [var.cluster_name, "master"])
    format("kubernetes.io/cluster/%v", var.cluster_name) = "owned"
  }

  root_block_device {
    volume_type           = "gp3"
    volume_size           = "50"
    delete_on_termination = true
  }

  lifecycle {
    ignore_changes = [
      ami,
      user_data,
      associate_public_ip_address,
    ]
  }
}
