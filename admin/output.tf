output "backend" {
  value = "${vault_aws_secret_backend.aws.path}"
}

output "role" {
  value = "${vault_aws_secret_backend_role.ec2-admin.name}"
}