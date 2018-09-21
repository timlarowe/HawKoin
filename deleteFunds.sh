#!/bin/bash

if [ "$1" == "-h" ]; then
    echo "Usage: ./deleteFunds amount fromType fromID"
    exit 0
fi

AMOUNT=${1?Error: no amount given}
FROM_TYPE=${2?Error: no from type given}
FROM_ID=${3?Error: no from ID given}

JSON='{  
   "$class": "org.hawkoin.network.DeleteFunds",
   "amount": '$AMOUNT',
   "fromUser": "resource:org.hawkoin.network.'$FROM_TYPE'#'$FROM_ID'"
   }' 

curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d "$JSON" 'http://localhost:3000/api/org.hawkoin.network.DeleteFunds'