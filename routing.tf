## Default route to Internet

resource "aws_route" "internet_access-1" {
  route_table_id         = "${aws_vpc.IS_VPC1.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.gateway-1.id}"
}

resource "aws_route" "internet_access-2" {
  route_table_id         = "${aws_vpc.IS_VPC2.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.gateway-2.id}"
}

## Routing table

resource "aws_route_table" "private_route_table-1" {
    vpc_id   = "${aws_vpc.IS_VPC1.id}"

    tags {
        Name = "Private route table"
    }
}

resource "aws_route_table" "private_route_table-2" {
    vpc_id   = "${aws_vpc.IS_VPC2.id}"

    tags {
        Name = "Private route table"
    }
}


resource "aws_route" "private_route-1" {
    route_table_id  = "${aws_route_table.private_route_table-1.id}"
    destination_cidr_block = "0.0.0.0/0"
#    nat_gateway_id = "${aws_nat_gateway.gateway.id}"
}

resource "aws_route" "private_route-2" {
    route_table_id  = "${aws_route_table.private_route_table-2.id}"
    destination_cidr_block = "0.0.0.0/0"
#    nat_gateway_id = "${aws_nat_gateway.gateway.id}"
}

resource "aws_route_table" "public-1" {
  vpc_id = "${aws_vpc.IS_VPC1.id}"
  tags {
      Name = "Public route table 1"
  }
  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gateway-1.id}"
    }
}

resource "aws_route_table" "public-2" {
  vpc_id = "${aws_vpc.IS_VPC2.id}"
  tags {
      Name = "Public route table"
  }
  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gateway-2.id}"
    }
}
## Route tables associations

# Associate subnet public_subnet to public route table
resource "aws_route_table_association" "public_subnet_association-1" {
    subnet_id = "${aws_subnet.aws-subnet-public-1.id}"
    route_table_id = "${aws_vpc.IS_VPC1.main_route_table_id}"
}

resource "aws_route_table_association" "public_subnet_association-2" {
    subnet_id = "${aws_subnet.aws-subnet-public-2.id}"
    route_table_id = "${aws_vpc.IS_VPC2.main_route_table_id}"
}

# Associate subnet private_subnet to private route table
resource "aws_route_table_association" "private_subnet_association-1" {
    subnet_id = "${aws_subnet.aws-subnet-private-1.id}"
    route_table_id = "${aws_route_table.private_route_table-1.id}"
}

resource "aws_route_table_association" "private_subnet_association-2" {
    subnet_id = "${aws_subnet.aws-subnet-private-2.id}"
    route_table_id = "${aws_route_table.private_route_table-2.id}"
}
