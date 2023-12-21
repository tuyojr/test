output "aws_iam_role_arn" {
  value = aws_iam_role.s3_role.arn
}

output "aws_ec2_details" {
  value = [
    for i in range(length(aws_instance.testServers)):
    {
      "name" = aws_instance.testServers[i].tags.Name
      "private_ip" = aws_instance.testServers[i].private_ip
      "availability_zone" = aws_instance.testServers[i].availability_zone
    }
  ]
}