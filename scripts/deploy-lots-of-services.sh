#!/bin/bash

PROJECTNAME=Weapon-X
VPC=vpc-00a83267
CLUSTER=Weapon-X-ECS-1MP1V39TEYLZO
ELB=arn:aws:elasticloadbalancing:us-west-2:711226717742:listener/app/Weapo-Publi-1RG68JYH6XIWQ/d5d2d74097576d5d/99d9c8ac2cbb2a95
ENVIRONMENT=development
CREATOR=CloudFormation
TEMPLATELOCATION=file://$(pwd)/service.yml
COUNT=1
GROUP=Weapon-X

declare -A stacks=(
    ["200"]="two-hundred"
)

for priority in "${!stacks[@]}";
    do echo "$priority - ${stacks[$priority]}";
    STACKNAME="Auto-${stacks[$priority]}"
    CREATE="aws cloudformation create-stack --stack-name $STACKNAME \
                                            --template-body $TEMPLATELOCATION \
                                            --capabilities CAPABILITY_NAMED_IAM \
                                            --parameters ParameterKey=Project,ParameterValue=$PROJECTNAME \
                                                         ParameterKey=Environment,ParameterValue=$ENVIRONMENT \
                                                         ParameterKey=Creator,ParameterValue=$CREATOR \
                                                         ParameterKey=VPC,ParameterValue=$VPC \
                                                         ParameterKey=Cluster,ParameterValue=$CLUSTER \
                                                         ParameterKey=Listener,ParameterValue=$ELB \
                                                         ParameterKey=DesiredCount,ParameterValue=$COUNT \
                                                         ParameterKey=LogGroup,ParameterValue=$GROUP \
                                                         ParameterKey=Path,ParameterValue="/${stacks[$priority]}" \
                                                         ParameterKey=ListenerPriority,ParameterValue="${priority}" \
                                                         ParameterKey=ContainerName,ParameterValue="${stacks[$priority]}" \
                                            --tags Key=Project,Value=$PROJECTNAME \
                                                   Key=Environment,Value=$ENVIRONMENT \
                                                   Key=Creator,Value=$CREATOR"
    echo $CREATE
    $CREATE
done
