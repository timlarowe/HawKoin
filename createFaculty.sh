#!/bin/bash

if [ "$1" == "-h" ]; then
    echo "Usage: ./createFaculty dept id balance isActive firstName lastName"
    exit 0
fi

DEPT=${1?Error: no dept given}
ID=${2?Error: no ID given}
BALANCE=${3?Error: no balance given}
ISACTIVE=${4?Error: no active status given}
FIRSTNAME=${5?Error: no first name given}
LASTNAME=${6?Error: no last name given}

JSON='{
  "$class": "org.hawkoin.network.Faculty",
  "dept": "'$DEPT'",
  "id": "'$ID'",
  "balance": '$BALANCE',
  "isActice": '$ISACTIVE',
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
    "firstName": "'$FIRSTNAME'",
    "lastName": "'$LASTNAME'",
    "email": "",
    "address": "",
    "city": "",
    "state": "",
    "zip": ""
  }
}'

curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d "$JSON" 'http://localhost:3000/api/org.hawkoin.network.Faculty'
