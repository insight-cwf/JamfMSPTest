#!/bin/bash

# Created 5.23.2022 @robjschroeder

# Array of configuration profiles URLs to upload to Jamf Pro
computerConfigURL=(
	# Apple Software Updates - Ring 1
	https://raw.githubusercontent.com/insight-cwf/JamfMSP/main/Baseline-Jamf-Server/ComputerConfigurationProfiles/SoftwareUpdates-Ring1.xml?token=GHSAT0AAAAAABUF4ENPHZK2ALF34D6JMNHEYVDWHZA
	# Apple Software Updates - Ring 2
	https://raw.githubusercontent.com/insight-cwf/JamfMSP/main/Baseline-Jamf-Server/ComputerConfigurationProfiles/SoftwareUpdates-Ring2.xml?token=GHSAT0AAAAAABUF4ENOGFLA2S6MF534B36WYVDWZVA
	# Apple Software Updates - Ring 3
	https://raw.githubusercontent.com/insight-cwf/JamfMSP/main/Baseline-Jamf-Server/ComputerConfigurationProfiles/SoftwareUpdates-Ring3.xml?token=GHSAT0AAAAAABUF4ENP7OFKOBN5P224M26YYVDW3DQ
	# Security and Privacy - FileVault
	https://raw.githubusercontent.com/insight-cwf/JamfMSP/main/Baseline-Jamf-Server/ComputerConfigurationProfiles/SecurityAndPrivacy-FileVault.xml?token=GHSAT0AAAAAABUF4ENOENQERCRRR2FRAMOUYVDXBTQ
)

# Upload computer configuration profiles from Github to Jamf Pro
uploadComputerConfigurationProfiles(){
	for computerConfig in ${computerConfigURL[@]}; do
		computerConfigData=$(curl -H "Authorization: token ${ghToken}" $computerConfig)
		curl --request POST \
		--url ${jamfProURL}/JSSResource/osxconfigurationprofiles/id/0 \
		--header 'Accept: application/xml' \
		--header 'Content-Type: application/xml' \
		--header "Authorization: Bearer ${token}" \
		--data "${computerConfigData}"
		sleep 1
	done
}
