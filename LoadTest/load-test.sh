#!/bin/sh

echo ""
echo "***************************************************************************************"
echo "*------------------------------ BEGIN LOAD TEST /POST/ -------------------------------*"
echo "***************************************************************************************"

export ACCEPT_PLAIN="accept: text/plain"
export CONTENT_TYPE="Content-Type: application/json"
export PAYLOAD='{"id": "", "firstName": "FirstName","lastName": "LastName","birthDate": "2000-01-01"}'

export ENDPOINT=http://$SERVICE_IP/api/people

echo -e "\nTesting the People.WebApp with IP: $SERVICE_IP"

echo -e "\n100 users"
hey -z 30s -c 100 -d "$PAYLOAD" -H "$ACCEPT_PLAIN" -H "$CONTENT_TYPE" -m POST "$ENDPOINT"

echo "Pause for 15 seconds"
sleep 15

echo -e "\n500 users."
hey -z 30s -c 500 -d "$PAYLOAD" -H "$ACCEPT_PLAIN" -H "$CONTENT_TYPE" -m POST "$ENDPOINT"

echo "Pause for 15 seconds"
sleep 15

echo -e "\n1000 users."
hey -z 30s -c 1000 -d "$PAYLOAD" -H "$ACCEPT_PLAIN" -H "$CONTENT_TYPE" -m POST "$ENDPOINT"

echo "Pause for 15 seconds"
sleep 15

echo -e "\n2000 users."
hey -z 30s -c 2000 -d "$PAYLOAD" -H "$ACCEPT_PLAIN" -H "$CONTENT_TYPE" -m POST "$ENDPOINT"

echo "Pause for 15 seconds"
sleep 15

echo -e "\n4000 users."
hey -z 30s -c 4000 -d "$PAYLOAD" -H "$ACCEPT_PLAIN" -H "$CONTENT_TYPE" -m POST "$ENDPOINT"

echo "Pause for 15 seconds"
sleep 15

echo -e "\n8000 users."
hey -z 30s -c 8000 -d "$PAYLOAD" -H "$ACCEPT_PLAIN" -H "$CONTENT_TYPE" -m POST "$ENDPOINT"

echo "***************************************************************************************"
echo "*------------------------------- END LOAD TEST /POST/ --------------------------------*"
echo "***************************************************************************************"

echo ""
echo "***************************************************************************************"
echo "*------------------------------ BEGIN LOAD TEST /GET/ --------------------------------*"
echo "***************************************************************************************"

echo -e "\n100 users"
hey -z 30s -c 100 "$ENDPOINT"

echo "Pause for 15 seconds"
sleep 15

echo -e "\n500 users."
hey -z 30s -c 500 "$ENDPOINT"

echo "Pause for 15 seconds"
sleep 15

echo -e "\n1000 users."
hey -z 30s -c 1000 "$ENDPOINT"

echo "Pause for 15 seconds"
sleep 15

echo -e "\n2000 users."
hey -z 30s -c 2000 "$ENDPOINT"

echo "Pause for 15 seconds"
sleep 15

echo -e "\n4000 users."
hey -z 30s -c 4000 "$ENDPOINT"

echo "Pause for 15 seconds"
sleep 15

echo -e "\n8000 users."
hey -z 30s -c 8000 "$ENDPOINT"

echo "***************************************************************************************"
echo "*------------------------------- END LOAD TEST /GET/ ---------------------------------*"
echo "***************************************************************************************"