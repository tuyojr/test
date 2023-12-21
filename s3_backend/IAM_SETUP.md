# AWS IAM SETUP FOR TERRAFORM BACKEND

- Head over to the IAM user of AWS and manually create a new user.
- You should select **"Provide user access to the AWS Management Console"**, this is so that you can log in to check the services deployed later on.
- On permissions, click on **'Attach policies directly'**, and add the following permissions.
  - AWSEC2FullAccess
  - AWSDynamoDBFullAccess
  - AWSS3FullAccess
- Finish the setup. You should see your new user in the list of users. You should click on the user and go ahead to generate security credentials in the **'Security Credentials'** pane. Here you would generate your AWS Access Key ID and the corresponding AWS Secret Access key.
- Next, configure your credentials on your local maching by running `aws configure`.
