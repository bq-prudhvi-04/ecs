resource "aws_iam_role" "ecs-service-role" {
  name = "ecs-service-role-test-web"
  path = "/"

  assume_role_policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": ["ecs.amazonaws.com"]
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "ecs_policy" {
  name        = "ecs-policy"
  description = "Worker policy for the ALB Ingress"

  policy = file("${path.module}/ecs_policy.json")
}

resource "aws_iam_role_policy_attachment" "ecs-service-role-attachment" {
  role       = aws_iam_role.ecs-service-role.name
  policy_arn = aws_iam_policy.ecs_policy.arn
}

