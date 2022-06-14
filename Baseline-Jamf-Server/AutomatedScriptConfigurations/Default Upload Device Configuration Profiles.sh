#!/bin/bash

# Created 5.23.2022 @robjschroeder

# Array of mobile configuration profiles to upload to Jamf Pro
mobileConfigURL=(
	# Lock Screen Message
	https://raw.githubusercontent.com/insight-cwf/JamfMSP/main/Baseline-Jamf-Server/MobileConfigurationProfiles/Lock%20Screen%20Message.xml?token=GHSAT0AAAAAABUF4ENPSIAGC3MSVS624HOOYVDX7YQ
)

# Upload device configuration profiles from GitHub to Jamf Pro
uploadDeviceConfigurationProfiles(){
	for mobileConfig in ${mobileConfigURL[@]}; do
		mobileConfigData=$(curl -H "Authorization: token ${ghToken}" $mobileConfig)
		curl --request POST \
		--url ${jamfProURL}/JSSResource/mobiledeviceconfigurationprofiles/id/0 \
		--header 'Accept: application/xml' \
		--header 'Content-Type: application/xml' \
		--header "Authorization: Bearer ${token}" \
		--data "${mobileConfigData}"
		sleep 1
	done
}
