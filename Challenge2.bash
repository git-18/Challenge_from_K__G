Challenge #2

We need to write code that will query the meta data of an instance within AWS and provide a json formatted output. 
The choice of language and implementation is up to you.
Bonus Points
The code allows for a particular data key to be retrieved individually
Hints
·         Aws Documentation (https://docs.aws.amazon.com/)
·         Azure Documentation (https://docs.microsoft.com/en-us/azure/?product=featured)
·         Google Documentation (https://cloud.google.com/docs)


#########################################################
#!/bin/bash
# jq must be installed for json output 
AVAILABILITY_ZONE="`wget -q -O - http://169.254.169.254/latest/meta-data/placement/availability-zone || curl http://169.254.169.254/latest/meta-data/availability-zone || true`"
INSTANCE_ID="`wget -q -O - http://169.254.169.254/latest/meta-data/instance-id || curl http://169.254.169.254/latest/meta-data/instance-id || true`"
INSTANCE_TYPE="`wget -q -O - http://169.254.169.254/latest/meta-data/instance-type || curl http://169.254.169.254/latest/meta-data/instance-type || true`"
PUBLIC_IPV4="`wget -q -O - http://169.254.169.254/latest/meta-data/public-ipv4 || curl http://169.254.169.254/latest/meta-data/public-ipv4 || true`"
SECURITY_GROUPS="`wget -q -O - http://169.254.169.254/latest/meta-data/security-groups || curl http://169.254.169.254/latest/meta-data/security-groups || true`"
# User should be able  to fetch particular object from the list.
case "$1" in   
  AVAIL_ZONE|AZ)
    if [ "$AVAILABILITY_ZONE" = "" ]; then echo "There is no value in AVAILABILITY_ZONE" ; else echo "The value of AVAILABILITY_ZONE: $AVAILABILITY_ZONE"; fi 
    echo "$AVAILABILITY_ZONE" | jq -Rn '{data: [inputs|{"AVAILABILITY_ZONE":.}]}'
    ;;

  INSTANCE_ID|INST_ID)
    if [ "$INSTANCE_ID" = "" ]; then echo "There is no value in INSTANCE_ID" ; else echo "The value of INSTANCE_ID: $INSTANCE_ID"; fi
    echo "$INSTANCE_ID" | jq -Rn '{data: [inputs|{"INSTANCE_ID":.}]}'
    ;;

  INSTANCE_TYPE|INST_TYPE)
    if [ "$INSTANCE_TYPE" = "" ]; then echo "There is no value in INSTANCE_TYPE" ; else echo "The value of INSTANCE_TYPE: $INSTANCE_TYPE"; fi
    echo "$INSTANCE_TYPE" | jq -Rn '{data: [inputs|{"INSTANCE_TYPE":.}]}'
    ;;
  
  PUBLIC_IPV4|PUB_IP)
    if [ "$PUBLIC_IPV4" = "" ]; then echo "There is no value in PUBLIC_IPV4" ; else echo "The value of PUBLIC_IPV4: $PUBLIC_IPV4"; fi
    echo "$PUBLIC_IPV4" | jq -Rn '{data: [inputs|{"PUBLIC_IPV4":.}]}'
    ;;
  SECURITY_GROUPS|SG)
    if [ "$SECURITY_GROUPS" = "" ]; then echo "There is no value in SECURITY_GROUPS" ; else echo "The value of SECURITY_GROUPS: $SECURITY_GROUPS"; fi
    echo "$SECURITY_GROUPS" | jq -Rn '{data: [inputs|{"SECURITY_GROUPS":.}]}'
    ;;
  *)
    echo "Selected value  not available"
    ;;
esac





