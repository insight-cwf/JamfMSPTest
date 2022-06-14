#!/bin/bash

# Created 5.23.2022 @robjschroeder

# Array of scripts URLs to upload to Jamf Pro
computerScriptsURL=(
	# Applications - Installomator
	https://raw.githubusercontent.com/insight-cwf/JamfMSP/main/Baseline-Jamf-Server/ComputerConfigurationProfiles/SoftwareUpdates-Ring1.xml?token=GHSAT0AAAAAABUF4ENOWUIVB6WBCEDLBJ7WYVDWOHQ
)

# Upload computer scripts from Github to Jamf Pro
uploadComputerScripts(){
	for computerScript in "${computerScriptsURL[@]}"; do
		computerScriptData=$(curl -H "Authorization: token ${ghToken}" $computerScript)
		curl --request POST \
		--url ${jamfProURL}/JSSResource/scripts/id/0 \
		--header 'Accept: application/xml' \
		--header 'Content-Type: application/xml' \
		--header "Authorization: Bearer ${token}" \
		--data "${computerScriptData}"
		sleep 1
	done
}
