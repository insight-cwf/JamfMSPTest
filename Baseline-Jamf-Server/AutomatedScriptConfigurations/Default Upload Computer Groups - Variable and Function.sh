#!/bin/bash

# Created 5.23.2022 @robjschroeder

# Array of computer smart group URLs to upload to Jamf Pro
computerGroupURL=(
	# macOS - Latest OS Supported Monterey
	https://raw.githubusercontent.com/insight-cwf/JamfMSP/main/Baseline-Jamf-Server/ComputerGroups/macOS%20-%20Latest%20OS%20Supported%20-%20Monterey.xml?token=GHSAT0AAAAAABUF4ENOWKTKCG4MWHWPVDWQYVDUL5Q
	# macOS - Latest OS Supported Catalina
	https://raw.githubusercontent.com/insight-cwf/JamfMSP/main/Baseline-Jamf-Server/ComputerGroups/macOS%20-%20Latest%20OS%20Supported%20-%20Catalina.xml?token=GHSAT0AAAAAABUF4ENOVWTUQYI2ERGAGYUOYVDUMGA
	# macOS - Latest OS Supported Big Sur
	https://raw.githubusercontent.com/insight-cwf/JamfMSP/main/Baseline-Jamf-Server/ComputerGroups/macOS%20-%20Latest%20OS%20Supported%20-%20Big%20Sur.xml?token=GHSAT0AAAAAABUF4ENOUERPX7FQHJIQG2ISYVDUMLQ
	# FileVault - Bootstrap Not Escrowed In Jamf Pro
	https://raw.githubusercontent.com/insight-cwf/JamfMSP/main/Baseline-Jamf-Server/ComputerGroups/FileVault%20-%20Bootstrap%20Not%20Escrowed%20In%20Jamf%20Pro.xml?token=GHSAT0AAAAAABUF4ENPN3VNEMBWN7XVWQAUYVDUMUQ
	# FileVault - Bootstrap Escrowed In Jamf Pro
	https://raw.githubusercontent.com/insight-cwf/JamfMSP/main/Baseline-Jamf-Server/ComputerGroups/FileVault%20-%20Bootstrap%20Escrowed%20In%20Jamf%20Pro.xml?token=GHSAT0AAAAAABUF4ENPJF3NXRBJ3EQEJX4KYVDUM3A
	# Enrollment Method: User Initiated Enrollment
	https://raw.githubusercontent.com/insight-cwf/JamfMSP/main/Baseline-Jamf-Server/ComputerGroups/Enrollment%20Method%3A%20User%20Initiated%20Enrollment.xml?token=GHSAT0AAAAAABUF4ENOOYUFCZ3O62KZNMBKYVDUM6Q
	# Enrollment Method: Automated Device Enrollment
	https://raw.githubusercontent.com/insight-cwf/JamfMSP/main/Baseline-Jamf-Server/ComputerGroups/Enrollment%20Method%3A%20Automated%20Device%20Enrollment.xml?token=GHSAT0AAAAAABUF4ENPETPAT2OMWJ354WLIYVDUNGA
	# Deployment Rings - Ring 3
	https://raw.githubusercontent.com/insight-cwf/JamfMSP/main/Baseline-Jamf-Server/ComputerGroups/Deployment%20Rings%20-%20Ring%203.xml?token=GHSAT0AAAAAABUF4ENOUTECMJ456SRLVYPCYVDVKGQ
	# Deployment Rings - Ring 2
	https://raw.githubusercontent.com/insight-cwf/JamfMSP/main/Baseline-Jamf-Server/ComputerGroups/Deployment%20Rings%20-%20Ring%202.xml?token=GHSAT0AAAAAABUF4ENP4C2VO7S6SVHJOJNCYVDUNTA
	# Deployment Rings - Ring 1
	https://raw.githubusercontent.com/insight-cwf/JamfMSP/main/Baseline-Jamf-Server/ComputerGroups/Deployment%20Rings%20-%20Ring%201.xml?token=GHSAT0AAAAAABUF4ENPIXC6T5D5VNTCTDDUYVDUN3A
	# Deployment Rings - Ring 1 - Apple Updates Available
	https://raw.githubusercontent.com/insight-cwf/JamfMSP/main/Baseline-Jamf-Server/ComputerGroups/Deployment%20Rings%20-%20Ring%201%20-%20Apple%20Updates%20Available.xml?token=GHSAT0AAAAAABUF4ENPYD2JAPTVZSS37Z56YVDUN7Q
	# Deployment Rings - Ring 2 - Apple Updates Available
	https://raw.githubusercontent.com/insight-cwf/JamfMSP/main/Baseline-Jamf-Server/ComputerGroups/Deployment%20Rings%20-%20Ring%202%20-%20Apple%20Updates%20Available.xml?token=GHSAT0AAAAAABUF4ENORXTKIIAFWZZKFXLSYVDUNWQ
	# Deployment Rings - Ring 3 - Apple Updates Available
	https://raw.githubusercontent.com/insight-cwf/JamfMSP/main/Baseline-Jamf-Server/ComputerGroups/Deployment%20Rings%20-%20Ring%203%20-%20Apple%20Updates%20Available.xml?token=GHSAT0AAAAAABUF4ENOZLAI6MS66LVEOZL4YVDUNPA
)

# Upload Computer Smart Groups
uploadComputerGroups(){
	for computerGroup in "${computerGroupURL[@]}"; do
		computerGroupData=$(curl -H "Authorization: token ${ghToken}" $computerGroup)
		curl --request POST \
		--url ${jamfProURL}/JSSResource/computergroups/id/0 \
		--header 'Accept: application/xml' \
		--header 'Content-Type: application/xml' \
		--header "Authorization: Bearer ${token}" \
		--data "${computerGroupData}"
		sleep 1
	done
}
