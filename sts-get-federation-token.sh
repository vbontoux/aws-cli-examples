aws sts get-federation-token --name vincetemptoken --policy '{"Version": "2012-10-17", "Statement": [{"Sid": "Stmt1679405726083", "Action": "s3:*", "Effect": "Deny","Resource": "*"}]}' > res-tmp.json

# cat  res-tmp.json| jq .Credentials.AccessKeyId | tr -d '\"'
export AWS_ACCESS_KEY_ID=$(cat  res-tmp.json | jq .Credentials.AccessKeyId | tr -d '\"')
echo $AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$(cat  res-tmp.json | jq .Credentials.SecretAccessKey | tr -d '\"')
echo $AWS_SECRET_ACCESS_KEY
export AWS_SESSION_TOKEN=$(cat  res-tmp.json | jq .Credentials.SessionToken | tr -d '\"')
echo $AWS_SESSION_TOKEN

aws s3 ls # This should return an access deny

rm res-tmp.json
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export AWS_SESSION_TOKEN=""

