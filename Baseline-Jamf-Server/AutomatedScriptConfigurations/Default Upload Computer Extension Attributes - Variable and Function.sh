#!/bin/bash

# Created 5.23.2022 @robjschroeder

# Array of computer extension attribute URLs to upload to Jamf Pro
computerExtAttributeURL=(
	# Bootstrap Token
	https://raw.githubusercontent.com/insight-cwf/JamfMSP/main/Baseline-Jamf-Server/ComputerExtensionAttributes/Bootstrap%20Token.xml?token=GHSAT0AAAAAABUF4ENOEA4GBH7MDAJVLPWYYVDUJFQ
	# Deployment Ring
	https://raw.githubusercontent.com/insight-cwf/JamfMSP/main/Baseline-Jamf-Server/ComputerExtensionAttributes/Deployment%20Ring.xml?token=GHSAT0AAAAAABUF4ENOGQB37KFDP3NYOOZAYVDUJNQ
	# Latest OS Supported
	https://raw.githubusercontent.com/insight-cwf/JamfMSP/main/Baseline-Jamf-Server/ComputerExtensionAttributes/Latest%20OS%20Supported.xml?token=GHSAT0AAAAAABUF4ENOKJGT3E25OMRCFVKKYVGVE7Q
)

# Upload Computer Extension Attributes
uploadComputerExtensionAttributes(){
	for computerExtAttribute in "${computerExtAttributeURL[@]}"; do
		# Get the extension attirbute data
		computerExtAttributeData=$(curl -H "Authorization: token ${ghToken}" $computerExtAttribute)
		curl --request POST \
		--url ${jamfProURL}/JSSResource/computerextensionattributes/id/0 \
		--header 'Accept: application/xml' \
		--header 'Content-Type: application/xml' \
		--header "Authorization: Bearer ${token}" \
		--data "${computerExtAttributeData}"
		sleep 1
	done
}
