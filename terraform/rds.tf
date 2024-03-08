resource "aws_db_subnet_group" "prod_db_subnet" {
  name        = "myapp-prod-db-subnet"
  description = "myapp db subnet"
  subnet_ids  = [aws_subnet.prod_rds_subnet_private_1a.id, aws_subnet.prod_rds_subnet_private_1c.id]
}

resource "aws_db_parameter_group" "prod_db_pg" {
  name        = "myapp-prod-db-pg"
  family      = "mysql8.0"
  description = "myapp parameter group"
}

resource "aws_db_instance" "prod_db_instance" {
  identifier                 = "rds-ecs"
  allocated_storage          = 20
  storage_type               = "gp2"
  engine                     = "mysql"
  engine_version             = "8.0.31"
  instance_class             = "db.t3.micro"
  db_name                    = "myapp_production"
  db_subnet_group_name       = "myapp-prod-db-subnet"
  vpc_security_group_ids     = [aws_security_group.prod-rds-sg.id]
  availability_zone          = "ap-northeast-1c"
  backup_retention_period    = 7
  maintenance_window         = "thu:19:06-thu:19:36"
  storage_encrypted          = true
  skip_final_snapshot        = true
  deletion_protection        = false
  backup_window              = "16:33-17:03"
  parameter_group_name       = "myapp-prod-db-pg"
  option_group_name          = "myapp-prod-db-og"
  multi_az                   = false
  auto_minor_version_upgrade = false
  publicly_accessible        = true
  copy_tags_to_snapshot      = true
  max_allocated_storage      = 1000
}