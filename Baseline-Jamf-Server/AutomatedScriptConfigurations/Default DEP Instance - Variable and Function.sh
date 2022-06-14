#!/bin/bash

# Created 5.23.2022 @robjschroeder

# Automated Device Enrollment: The base 64 encoded token
# Provide path to .p7m file, remove any spaces from the filename
ADETokenPath="/Users/rob/Downloads/ADEToken.p7m"

# Base64 encode the ADE token
encodeToken(){
	encodedADEToken=$(/usr/bin/base64 ${ADETokenPath})
}

# Create a Device Enrollment Instance with the supplied Token
createADE(){
	curl --request POST \
	--url ${jamfProURL}/api/v1/device-enrollments/upload-token \
	--header 'Accept: application/json' \
	--header 'Content-Type: application/json' \
	--header "Authorization: Bearer ${token}" \
	--data '
{
	"tokenFileName": "'"${OrgName}"' Automated Device Enrollment",
	"encodedToken": "'"${encodedADEToken}"'"
}
'
}
