# for creating public and private ssh keys
resource "tls_private_key" "ssh_key" {
  # algorithm = "ED25519"
  algorithm = "RSA" #ED25519 is not supported on windows

}

resource "aws_key_pair" "public_key" {
  key_name   = "${var.unique_id}_ssh_key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

resource "local_file" "private_key" {
  content  = tls_private_key.ssh_key.private_key_pem #openssh format causes issue while retrieving windows password
  filename = "${path.module}/temp/${var.unique_id}_ssh_key.pem"
}

resource "null_resource" "set_permissions" {
  provisioner "local-exec" {
    command = "chmod 400 ${path.module}/temp/${var.unique_id}_ssh_key.pem"
  }

  depends_on = [local_file.private_key]
}

resource "null_resource" "cleanup_temp_folder" {
  provisioner "local-exec" {
    when    = destroy
    command = "rm -rf '${path.module}/temp'"
  }
}
