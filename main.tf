resource "aws_subnet" "private" {
  count = "${length(split(",", var.cidrs))}"

  vpc_id = "${var.vpc_id}"

  availability_zone = "${element(split(",", var.availability_zones), count.index % length(split(",", var.availability_zones)))}"
  cidr_block = "${element(split(",", var.cidrs), count.index)}"

  tags {
    Name = "${var.name}.${element(split(",", var.availability_zones), count.index)}"
    Environment = "${var.environment}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route_table_association" "private" {
  count = "${length(split(",", var.cidrs))}"

  subnet_id = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${element(split(",", var.route_table_ids), count.index)}"

  lifecycle {
    create_before_destroy = true
  }
}
