#!/bin/bash

# Created 5.23.2022 @robjschroeder

# Default Computer Prestage Variables
computerPrestageData=$(cat <<EOF
{
	"keepExistingSiteMembership" : false,
	"enrollmentSiteId" : "-1",
	"id" : "1",
	"displayName" : "${OrgName} Default Prestage",
	"supportPhoneNumber" : "",
	"supportEmailAddress" : "",
	"department" : "",
	"mandatory" : true,
	"mdmRemovable" : false,
	"defaultPrestage" : true,
	"keepExistingLocationInformation" : false,
	"requireAuthentication" : false,
	"authenticationPrompt" : "",
	"deviceEnrollmentProgramInstanceId" : "1",
	"siteId" : "-1",
	"skipSetupItems" : {
		"Biometric" : true,
		"FileVault" : false,
		"iCloudDiagnostics" : true,
		"Diagnostics" : true,
		"Accessibility" : true,
		"AppleID" : true,
		"ScreenTime" : true,
		"Siri" : true,
		"DisplayTone" : true,
		"Restore" : true,
		"Appearance" : true,
		"Privacy" : true,
		"Payment" : true,
		"Registration" : true,
		"TOS" : true,
		"iCloudStorage" : true,
		"Location" : true
	},
	"locationInformation" : {
		"username" : "",
		"realname" : "",
		"phone" : "",
		"email" : "",
		"room" : "",
		"position" : "",
		"departmentId" : "-1",
		"buildingId" : "-1",
		"id" : "1",
		"versionLock" : 0
	},
	"purchasingInformation" : {
		"id" : "1",
		"leased" : false,
		"purchased" : true,
		"appleCareId" : "",
		"poNumber" : "",
		"vendor" : "",
		"purchasePrice" : "",
		"lifeExpectancy" : 0,
		"purchasingAccount" : "",
		"purchasingContact" : "",
		"leaseDate" : "1970-01-01",
		"poDate" : "1970-01-01",
		"warrantyDate" : "1970-01-01",
		"versionLock" : 0
	},
	"preventActivationLock" : true,
	"enableDeviceBasedActivationLock" : false,
	"anchorCertificates" : [ ],
	"enrollmentCustomizationId" : "0",
	"language" : "en",
	"region" : "US",
	"autoAdvanceSetup" : false,
	"customPackageIds" : [ ],
	"customPackageDistributionPointId" : "-1",
	"installProfilesDuringSetup" : false,
	"prestageInstalledProfileIds" : [ ],
	"enableRecoveryLock" : false,
	"recoveryLockPasswordType" : "MANUAL",
	"rotateRecoveryLockPassword" : false
}
EOF
)

# Create Default macOS Computer PreStage
createComputerPrestage(){
	curl --request POST \
	--url ${jamfProURL}/api/v2/computer-prestages \
	--header 'Accept: application/json' \
	--header 'Content-Type: application/json' \
	--header "Authorization: Bearer ${token}" \
	--data "${computerPrestageData}"
}
