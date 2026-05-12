resource "aws_db_instance" "unencrypted" {
  identifier           = "unencrypted-db"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  storage_encrypted    = false  # SEC-TF-RDS-001
  publicly_accessible = true   # SEC-TF-RDS-002
  skip_final_snapshot = true
}