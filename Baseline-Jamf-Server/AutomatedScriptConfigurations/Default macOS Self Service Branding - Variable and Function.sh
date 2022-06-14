#!/bin/bash

# Created 5.23.2022 @robjschroeder

# macOS Self Service Branding data
macOSSelfServiceBranding=$(cat <<EOF
{
	"applicationName" : "Self Service",
	"brandingName" : "Self Service",
	"brandingNameSecondary" : "${OrgName}",
	"iconId" : 1
}
EOF
)

# Create macOS Self Service Branding
createComputerSelfServiceBranding(){
	curl --request POST \
	--url ${jamfProURL}/api/v1/self-service/branding/macos \
	--header 'Accept: application/json' \
	--header 'Content-Type: application/json' \
	--header "Authorization: Bearer ${token}" \
	--data "${macOSSelfServiceBranding}"
}
