

### List-users Enumeration 
To list IAM users for the current account
```
aws iam list-users
aws iam list-attached-user-policies --user-name soc_admin_1
```

### IAM Group Enumeration
To list IAM group for the current account
```
aws iam list-groups
aws iam list-attached-group-policies --group-name group-name
aws iam list-group-policies --group-name group-name
```


### IAM Role Enumeration
To list IAM roles for the current account
```
aws iam list-roles
aws iam list-attached-role-policies --role-name role-name
aws iam list-role-policies --role-name role-name
```


### IAM  policies enumeration

Lists all the managed policies that are available in your account, including your own customer-defined managed policies and all Amazon Web Services managed policies.
```
aws iam list-policies
aws iam get-policy --policy-arn policy-arn
aws iam list-policy-versions --policy-arn policy-arn
aws iam get-user-policy --user-name user-name --policy-name policy-name
aws iam get-group-policy --group-name group-name --policy-name policy-name
aws iam get-role-policy --role-name role-name --policy-name policy-name
```
### EC2Enumeration
```
aws ec2 describe-vpcs
aws ec2 describe-subnets
aws ec2 describe-route-tables
aws ec2 describe-network-acls
aws ec2 describe-vpc-peering-connections
aws ec2 describe-instances
aws ec2 describe-instances --instance-ids instance-id
aws ec2 describe-instance-attribute –attribute userData --instance-id instance-id
aws ec2 describe-iam-instance-profile-associations
```
### S3 Basic Enumeration
```
aws s3api list-buckets
aws s3api get-bucket-acl --bucket Name
aws s3api get-bucket-policy --bucket Name
aws s3api get-public-access-block --bucket Name
aws s3api list-objects --bucket Name
aws s3api get-object-acl --bucket bucket-name --key object-name
```

# Reference
** https://docs.aws.amazon.com/cli/latest/index.html
