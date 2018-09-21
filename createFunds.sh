#!/bin/bash

if [ "$1" == "-h" ]; then
    echo "Usage: ./createFunds amount toType toID "
    exit 0
fi

AMOUNT=${1?Error: no amount given}
TO_TYPE=${2?Error: no to type status given}
TO_ID=${3?Error: no to ID given}

JSON='{  
   "$class": "org.hawkoin.network.CreateFunds",
   "amount": '$AMOUNT',
   "toUser": "resource:org.hawkoin.network.'$TO_TYPE'#'$TO_ID'"
   }' 


curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d "$JSON" 'http://localhost:3000/api/org.hawkoin.network.CreateFunds'