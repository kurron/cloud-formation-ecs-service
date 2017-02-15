#!/bin/bash

# creates a stack in AWS via CloudFromation

STACKNAME=${1:-Weapon-X-ECS-Service}
PROJECTNAME=${2:-Weapon-X}
VPC=${3:-vpc-bd6df4da}
CLUSTER=${4:-with-elb-ECS-P3YFEBF8US4J-Cluster}
ELB=${5:-arn:aws:elasticloadbalancing:us-west-2:711226717742:listener/app/Public-ELB/a0fe005a06c8408b/1a25587d06fe0813}
ENVIRONMENT=${6:-development}
CREATOR=${7:-CloudFormation}
TEMPLATELOCATION=${8:-file://$(pwd)/service.yml}

VALIDATE="aws cloudformation validate-template --template-body $TEMPLATELOCATION"
echo $VALIDATE
$VALIDATE

CREATE="aws cloudformation create-stack --stack-name $STACKNAME \
                                        --template-body $TEMPLATELOCATION \
                                        --capabilities CAPABILITY_NAMED_IAM \
                                        --parameters ParameterKey=Project,ParameterValue=$PROJECTNAME \
                                                     ParameterKey=Environment,ParameterValue=$ENVIRONMENT \
                                                     ParameterKey=Creator,ParameterValue=$CREATOR \
                                                     ParameterKey=VPC,ParameterValue=$VPC \
                                                     ParameterKey=Cluster,ParameterValue=$CLUSTER \
                                                     ParameterKey=Listener,ParameterValue=$ELB \
                                        --tags Key=Project,Value=$PROJECTNAME \
                                               Key=Environment,Value=$ENVIRONMENT \
                                               Key=Creator,Value=$CREATOR"
echo $CREATE
$CREATE
