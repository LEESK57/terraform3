resource "aws_security_group" "sdkim_sg" {
  name        = "${var.name}-sg"
  description = "HTTP_ICMP_SQL"
  vpc_id      = aws_vpc.sdkim_vpc.id

  ingress = [
    {
      description      = var.ssh
      from_port        = var.port_ssh
      to_port          = var.port_ssh
      protocol         = var.pro_tcp
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.cidr_routev6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    {
      description      = var.http
      from_port        = var.port_http
      to_port          = var.port_http
      protocol         = var.pro_tcp
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.cidr_routev6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    {
      description      = var.icmp
      from_port        = var.minus
      to_port          = var.minus
      protocol         = var.pro_icmp
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.cidr_routev6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    { description      = var.mysql
      from_port        = var.port_mysql
      to_port          = var.port_mysql
      protocol         = var.pro_tcp
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.cidr_routev6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null

    }
  ]

  egress = [
    {
      description      = var.port_all
      from_port        = var.port_zero
      to_port          = var.port_zero
      protocol         = var.minus
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.cidr_routev6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }
  ]
  tags = {
    "Name" = "${var.name}-sg"
  }

}

data "aws_ami" "amzn" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "sdkim_web" {
  ami                    = data.aws_ami.amzn.id
  instance_type          = var.ins_type
  key_name               = var.key
  vpc_security_group_ids = [aws_security_group.sdkim_sg.id]
  availability_zone      = "${var.region}${var.ava_zone[0]}"
  private_ip             = var.pri_ip
  subnet_id              = aws_subnet.sdkim_pub[0].id
  user_data              = file("./install.sh")

  tags = {
    "Name" = "${var.name}-web"
  }
}

resource "aws_eip" "sdkim-web_ip" {
  vpc                       = true
  instance                  = aws_instance.sdkim_web.id
  associate_with_private_ip = var.pri_ip
  depends_on                = [aws_internet_gateway.sdkim_ig]
}

output "public_ip" {
  value = aws_instance.sdkim_web.public_ip
}
