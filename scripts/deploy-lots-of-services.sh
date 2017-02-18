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
    ["3"]="three"
    ["4"]="four"
    ["5"]="five"
    ["6"]="six"
    ["7"]="seven"
    ["8"]="eight"
    ["9"]="nine"
    ["10"]="ten"
    ["11"]="eleven"
    ["12"]="twelve"
    ["13"]="thirteen"
    ["14"]="fourteen"
    ["15"]="fifteen"
    ["16"]="sixteen"
    ["17"]="seventeen"
    ["18"]="eighteen"
    ["19"]="nineteen"
    ["20"]="twenty"
    ["21"]="twenty-one"
    ["22"]="twenty-two"
    ["23"]="twenty-three"
    ["24"]="twenty-four"
    ["25"]="twenty-five"
    ["26"]="twenty-six"
    ["27"]="twenty-seven"
    ["28"]="twenty-eight"
    ["29"]="twenty-nine"
    ["30"]="thirty"
    ["31"]="thirty-one"
    ["32"]="thirty-two"
    ["33"]="thirty-three"
    ["34"]="thirty-four"
    ["35"]="thirty-five"
    ["36"]="thirty-six"
    ["37"]="thirty-seven"
    ["38"]="thirty-eight"
    ["39"]="thirty-nine"
    ["40"]="forty"
    ["41"]="forty-one"
    ["42"]="forty-two"
    ["43"]="forty-three"
    ["44"]="forty-four"
    ["45"]="forty-five"
    ["46"]="forty-six"
    ["47"]="forty-seven"
    ["48"]="forty-eight"
    ["49"]="forty-nine"
    ["50"]="fifty"
    ["51"]="fifty-one"
    ["52"]="fifty-two"
    ["53"]="fifty-three"
    ["54"]="fifty-four"
    ["55"]="fifty-five"
    ["56"]="fifty-six"
    ["57"]="fifty-seven"
    ["58"]="fifty-eight"
    ["59"]="fifty-nine"
    ["60"]="sixty"
    ["61"]="sixty-one"
    ["62"]="sixty-two"
    ["63"]="sixty-three"
    ["64"]="sixty-four"
    ["65"]="sixty-five"
    ["66"]="sixty-six"
    ["67"]="sixty-seven"
    ["68"]="sixty-eight"
    ["69"]="sixty-nine"
    ["70"]="seventy"
    ["71"]="seventy-one"
    ["72"]="seventy-two"
    ["73"]="seventy-three"
    ["74"]="seventy-four"
    ["75"]="seventy-five"
    ["76"]="seventy-six"
    ["77"]="seventy-seven"
    ["78"]="seventy-eight"
    ["79"]="seventy-nine"
    ["80"]="eighty"
    ["81"]="eighty-one"
    ["82"]="eighty-two"
    ["83"]="eighty-three"
    ["84"]="eighty-four"
    ["85"]="eighty-five"
    ["86"]="eighty-six"
    ["87"]="eighty-seven"
    ["88"]="eighty-eighty"
    ["89"]="eighty-nine"
    ["90"]="ninety"
    ["91"]="ninety-one"
    ["92"]="ninety-two"
    ["93"]="ninety-three"
    ["94"]="ninety-four"
    ["95"]="ninety-five"
    ["96"]="ninety-six"
    ["97"]="ninety-seven"
    ["98"]="ninety-eight"
    ["99"]="ninety-nine"
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
    sleep 240
done
