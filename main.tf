resource "aws_db_subnet_group" "target" {
  name       = var.aurora_cluster_identifier
  subnet_ids = var.vpc_subnet_db_ids

}

resource "aws_security_group" "target" {
  name   = var.aurora_cluster_identifier
  vpc_id = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = var.aurora_port
    protocol    = "tcp"
    cidr_blocks = var.vpc_subnet_app_cidrs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_rds_cluster" "target" {
  cluster_identifier     = var.aurora_cluster_identifier
  engine                 = var.aurora_engine
  engine_version         = var.aurora_engine_version
  port                   = var.aurora_port
  availability_zones     = var.vpc_az_names
  engine_mode            = local.aurora_engine_mode
  db_subnet_group_name   = aws_db_subnet_group.target.id
  vpc_security_group_ids = [aws_security_group.target.id]
  master_username        = var.aurora_master_username
  master_password        = var.aurora_master_password
  skip_final_snapshot    = true
}
