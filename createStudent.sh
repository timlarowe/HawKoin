#!/bin/bash

if [ "$1" == "-h" ]; then
    echo "Usage: ./createStudent major id balance firstName"
    exit 0
fi

MAJOR=${1?Error: no major given}
ID=${2?Error: no ID given}
BALANCE=${3?Error: no major given}
FIRSTNAME=${4?Error: no first name given}

JSON='{
   "$class": "org.hawkoin.network.Student",
   "isAthlete": true,    
   "major": "'$MAJOR'",  
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
     "firstName": "'$FIRSTNAME'",                      
     "lastName": "", 
     "email": "",  
     "address": "",
     "city": "",   
     "state": "",  
     "zip": ""                                       
   }                                                   
 }'

curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d "$JSON" 'http://localhost:3000/api/org.hawkoin.network.Student'
