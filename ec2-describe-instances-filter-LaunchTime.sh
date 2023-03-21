aws ec2 describe-instances  | jq '.Reservations[].Instances[] | .ImageId, .LaunchTime'
