resource "aws_security_group" "demo-rds-sg" {
  name        = var.security_group_name
  description = "Created By Terraform"
  ingress {
    from_port   = 3306
    to_port     = 3306
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

resource "aws_db_instance" "aws_rds" {
  allocated_storage      = 30
  identifier             = var.db_identifier
  db_name                = var.dbname
  engine                 = var.dbengine
  engine_version         = var.engine_version
  instance_class         = var.rds_instance_type
  username               = var.username
  password               = var.password
  publicly_accessible    = true
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.demo-rds-sg.id]
}