#!/bin/bash

# Created 5.23.2022 @robjschroeder

# Jamf Nation Credentials
JNEmail="email@org.com"
JNPassword="J@mfRul35!"

# Initialize the CSA token exchange
createCSA(){
	curl --request POST \
	--url ${jamfProURL}/api/v1/csa/token \
	--header 'Accept: application/json' \
	--header 'Content-Type: application/json' \
	--header "Authorization: Bearer ${token}" \
	--data '
{
	"emailAddress": "'"${JNEmail}"'",
	"password": "'"${JNPassword}"'"
}
'
}
