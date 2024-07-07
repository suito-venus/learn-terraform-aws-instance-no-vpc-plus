data "aws_iam_policy_document" "learn-terraform-aws-instance-trust-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "learn-terraform-aws-instance-role" {
  name               = "learn-terraform-aws-instance-role"
  assume_role_policy = data.aws_iam_policy_document.learn-terraform-aws-instance-trust-policy.json
}

data "aws_iam_policy" "aws-managed-amazonssmmanagedinstancecore-policy" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "default" {
  role       = aws_iam_role.learn-terraform-aws-instance-role.name
  policy_arn = data.aws_iam_policy.aws-managed-amazonssmmanagedinstancecore-policy.arn
}

resource "aws_iam_instance_profile" "learn-terraform-aws-instance-profile" {
  name = "learn-terraform-aws-instance-profile"
  role = aws_iam_role.learn-terraform-aws-instance-role.name
}