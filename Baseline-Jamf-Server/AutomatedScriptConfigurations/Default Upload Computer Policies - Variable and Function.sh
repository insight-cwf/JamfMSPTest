#!/bin/bash

# Created 5.23.2022 @robjschroeder

# Array of policy URLs to upload to Jamf Pro
computerPoliciesURL=(
	# Applications - Instsall - DEPNotify
	https://raw.githubusercontent.com/insight-cwf/JamfMSP/main/Baseline-Jamf-Server/ComputerPolicies/Applications%20-%20Install%20-%20DEPNotify.xml?token=GHSAT0AAAAAABUF4ENO7UYL57RFIJOO662EYVDXJUA
)

# Upload computer policies from Github to Jamf Pro
uploadComputerPolicies(){
	for computerPolicy in "${computerPoliciesURL[@]}"; do
		computerPolicyData=$(curl -H "Authorization: token ${ghToken}" $computerPolicy)
		curl --request POST \
		--url ${jamfProURL}/JSSResource/policies/id/0 \
		--header 'Accept: application/xml' \
		--header 'Content-Type: application/xml' \
		--header "Authorization: Bearer ${token}" \
		--data "${computerPolicyData}"
		sleep 1
	done
}
