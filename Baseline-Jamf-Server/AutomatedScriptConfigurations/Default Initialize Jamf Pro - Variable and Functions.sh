#!/bin/bash

# Created 5.23.2022 @robjschroeder

# Initialize Jamf Pro Variables (Example Variables)
OrgName="Insight - USA"
activationCode="TV9K-ZBRS-BLIJ-RSBR-SBRS-BLRT-6GKR-SU4I"
adminUsername="jamfProAdmin"
adminPassword="jamf1234!!"
email="first.last@insight.com"
jamfProURL="https://imadev.jamfcloud.com"

# Initialize Jamf Pro for first run
initializeJamfPro(){
	curl --request POST \
	--url $jamfProURL/api/v1/system/initialize \
	--header 'Accept: application/json' \
	--header 'Content-Type: application/json' \
	--data '
{
	"activationCode": "'"${activationCode}"'",
	"institutionName": "'"${OrgName}"'",
	"eulaAccepted": true,
	"username": "'"${adminUsername}"'",
	"password": "'"${adminPassword}"'",
	"email": "'"${email}"'",
	"jssUrl": "'"${jamfProURL}"'"
}
'
}
