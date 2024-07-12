# Create a DB subnet group for Aurora
resource "aws_db_subnet_group" "b07_aurora_subnet_group" {
  name       = "b07-aurora-subnet-group"
  subnet_ids = aws_subnet.private[*].id
  tags = {
    Name = "b07-aurora-subnet-group"
  }
}

# Create a security group for Aurora
resource "aws_security_group" "b07_aurora_sg" {
  vpc_id = aws_vpc.moodle_vpc.id
  tags = {
    Name = "b07-aurora-sg"
  }
}

# Allow EKS to access Aurora
resource "aws_security_group_rule" "allow_eks_to_aurora" {
  type                     = "ingress"
  from_port                = 3306  
  to_port                  = 3306
  protocol                 = "tcp"
  security_group_id        = aws_security_group.b07_aurora_sg.id
  source_security_group_id = aws_security_group.eks_cluster_sg.id

  depends_on = [aws_eks_node_group.eks_node_group]
  
}

# Create an Aurora RDS cluster
resource "aws_rds_cluster" "b07_aurora_cluster" {
  cluster_identifier      = "b07-aurora-cluster"
  engine                  = "aurora-mysql"
  engine_version          = var.rds_engine_version
  master_username         = var.rds_master_username
  master_password         = var.rds_master_password
  db_subnet_group_name    = aws_db_subnet_group.b07_aurora_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.b07_aurora_sg.id]
  skip_final_snapshot     = true

  tags = {
    Name = "b07-aurora-cluster"
  }
}

# Add a database named "moodledb" to the Aurora RDS cluster
resource "aws_rds_cluster_instance" "b07_aurora_primary" {
  identifier           = "b07-aurora-primary"
  cluster_identifier   = aws_rds_cluster.b07_aurora_cluster.id
  instance_class       = "db.t3.medium"
  engine               = aws_rds_cluster.b07_aurora_cluster.engine
  engine_version       = aws_rds_cluster.b07_aurora_cluster.engine_version

  tags = {
    Name = "b07-aurora-primary"
  }
}

