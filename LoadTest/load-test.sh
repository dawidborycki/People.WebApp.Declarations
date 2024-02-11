#!/bin/sh

export ACCEPT_PLAIN="accept: text/plain"
export CONTENT_TYPE="Content-Type: application/json"
export PAYLOAD='{
    "id": "", 
    "firstName": "FirstName",
    "lastName": "LastName",
    "birthDate": "2000-01-01"
}'

export ENDPOINT=http://$SERVICE_IP/api/people

printf "\nTesting the People.WebApp with IP (POST): %s\n" "$SERVICE_IP"

for users in 100 500 1000 2000 4000 8000; do
    printf "\n%s users.\n" "${users}"
    hey -z 30s -c ${users} -d "$PAYLOAD" -H "$ACCEPT_PLAIN" \
        -H "$CONTENT_TYPE" -m POST "$ENDPOINT"

    echo "Pause for 15 seconds"
    sleep 15
done

printf "\nTesting the People.WebApp with IP (GET): %s\n" "$SERVICE_IP"

for users in 100 500 1000 2000 4000 8000; do
    printf "\n%s users.\n" "${users}"
    hey -z 30s -c $users "$ENDPOINT"

    echo "Pause for 15 seconds"
    sleep 15
done