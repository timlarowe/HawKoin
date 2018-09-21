#!/bin/bash

if [ "$1" == "-h" ]; then
    echo "Usage: ./createVendor name conv id balance"
    exit 0
fi

NAME=${1?Error: no name given}
CONV=${2?Error: no cash conversion rate given}
ID=${3?Error: no ID given}
BALANCE=${3?Error: no balance given}

JSON='{
  "$class": "org.hawkoin.network.Vendor",
  "vendorName": "'$NAME'",
  "ccr": "'$CONV'",
  "id": "'$ID'",
  "balance": '$BALANCE',
  "isActice": true,
  "uniNetwork": {
    "$class": "org.hawkoin.network.UniversityNetwork",
    "uniID": "",
    "uniName": "",
    "address": "",
    "city": "",
    "state": "",
    "zip": ""
  },
  "contactInfo": {
    "$class": "org.hawkoin.network.ContactInfo",
    "firstName": "",
    "lastName": "",
    "email": "",
    "address": "",
    "city": "",
    "state": "",
    "zip": ""
  }
}'

curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d "$JSON" 'http://localhost:3000/api/org.hawkoin.network.Vendor'
