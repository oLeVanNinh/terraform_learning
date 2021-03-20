resource "aws_vpc_endpoint" "wp_private_s3_endpoint" {
  vpc_id          = aws_vpc.wp_vpc.id
  service_name    = "com.amazonaws.${var.aws_region}.s3"
  route_table_ids = [aws_vpc.wp_vpc.main_route_table_id, aws_route_table.wp_public_rt.id]
  policy          = <<POLICY
{
  "Statement": [
    {
      "Action": "*",
      "Effect": "Allow",
      "Resource": "*",
      "Principal": "*"
    }
  ]
}
  POLICY
}

resource "random_id" "wp_code_bucket" {
  byte_length = 1
}

resource "aws_s3_bucket" "wp_code_bucket" {
  bucket        = "${var.domain_name}-${random_id.wp_code_bucket.dec}"
  acl           = "private"
  force_destroy = true

  tags = {
    Name = "code bucket"
  }
}
