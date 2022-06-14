#!/bin/bash

# Created 5.23.2022 @robjschroeder

# Update ReEnrollment Settings
updateReEnrollment(){
	curl --request PUT \
	--url ${jamfProURL}/api/v1/reenrollment \
	--header 'Accept: application/json' \
	--header 'Content-Type: application/json' \
	--header "Authorization: Bearer ${token}" \
	--data '
{
	"isFlushPolicyHistoryEnabled": false,
	"isFlushLocationInformationEnabled": false,
	"isFlushLocationInformationHistoryEnabled": false,
	"isFlushExtensionAttributesEnabled": false,
	"flushMDMQueue": "DELETE_EVERYTHING"
}
'
}
