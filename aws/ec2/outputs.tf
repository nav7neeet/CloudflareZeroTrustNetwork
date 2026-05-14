# output "instance_ids" {
#   value = {
#     for idx, instance in aws_instance.instance :
#     "instance_id_${idx}" => instance.id
#   }
# }

# ## for route53
# output "instance_ips" {
#   value = [for instance in aws_instance.instance : instance.public_ip]
# }

# output "ec2_instance" {
#   value = {
#     for idx, instance in aws_instance.instance :
#     "${idx}" => {
#       id         = instance.id
#       public_ip  = instance.public_ip
#       pvt_ip     = instance.private_ip
#       public_dns = instance.public_dns
#     }
#   }
# }

# output "private_key" {
#   value = local_file.private_key.filename
# }
