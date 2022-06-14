#!/bin/bash

# Created 5.23.2022 @robjschroeder

# iOS Self Service Branding data
iOSSelfServiceBranding=$(cat <<EOF
{
	"brandingName" : "Self Service",
	"iconId" : 1,
	"headerBackgroundColorCode" : "FFFFFF",
	"menuIconColorCode" : "000000",
	"brandingNameColorCode" : "000000",
	"statusBarTextColor" : "dark"
}
EOF
)

# Create iOS Self Service Branding
createiOSSelfServiceBranding(){
	curl --request POST \
	--url ${jamfProURL}/api/v1/self-service/branding/ios \
	--header 'Accept: application/json' \
	--header 'Content-Type: application/json' \
	--header "Authorization: Bearer ${token}" \
	--data "${iOSSelfServiceBranding}"
}
