# The IDs of the created Subnets
output "subnet_ids" {
  value = "${join(",", aws_subnet.private.*.id)}"
}

# The CIDR blocks used to create the Subnets
output "subnet_cidrs" {
  value = "${var.cidrs}"
}
