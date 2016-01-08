# The IDs of the created Subnets
output "subnet_ids" {
  value = "${join(",", aws_subnet.private.*.id)}"
}

# The Availability Zones used to create the Subnets
output "availability_zones" {
  value = "${var.availability_zones}"
}

# The CIDR blocks used to create the Subnets
output "cidrs" {
  value = "${var.cidrs}"
}
