#!/bin/bash

if [ "$1" == "-h" ]; then
    echo "Usage: ./transferFunds amount fromType fromID toType toID "
    exit 0
fi

AMOUNT=${1?Error: no amount given}
FROM_TYPE=${2?Error: no from type given}
FROM_ID=${3?Error: no from ID given}
TO_TYPE=${4?Error: no to type status given}
TO_ID=${5?Error: no to ID given}

JSON='{  
   "$class": "org.hawkoin.network.TransferFunds",
   "amount": '$AMOUNT',
   "fromUser": "resource:org.hawkoin.network.'$FROM_TYPE'#'$FROM_ID'",
   "toUser": "resource:org.hawkoin.network.'$TO_TYPE'#'$TO_ID'"
   }' 


curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d "$JSON" 'http://localhost:3000/api/org.hawkoin.network.TransferFunds'