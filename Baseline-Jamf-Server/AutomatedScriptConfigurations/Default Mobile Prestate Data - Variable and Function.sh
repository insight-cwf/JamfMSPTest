#!/bin/bash

# Created 5.23.2022 @robjschroeder

# Default Mobile Prestage Variables
mobilePrestageData=$(cat <<EOF
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
	"SoftwareUpdate" : true,
	"Diagnostics" : true,
	"iMessageAndFaceTime" : true,
	"TVRoom" : true,
	"Passcode" : true,
	"SIMSetup" : true,
	"ScreenTime" : true,
	"RestoreCompleted" : true,
	"TVProviderSignIn" : true,
	"Siri" : true,
	"Restore" : true,
	"ScreenSaver" : true,
	"HomeButtonSensitivity" : true,
	"CloudStorage" : true,
	"Privacy" : true,
	"TransferData" : true,
	"Zoom" : true,
	"PreferredLanguage" : true,
	"TVHomeScreenSync" : true,
	"ExpressLanguage" : true,
	"AppleID" : true,
	"DisplayTone" : true,
	"WatchMigration" : true,
	"UpdateCompleted" : true,
	"Appearance" : true,
	"Android" : true,
	"Payment" : true,
	"OnBoarding" : true,
	"TOS" : true,
	"Welcome" : true,
	"TapToSetup" : true,
	"Location" : false
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
	"preventActivationLock" : false,
	"enableDeviceBasedActivationLock" : false,
	"anchorCertificates" : [ ],
	"enrollmentCustomizationId" : "0",
	"language" : "",
	"region" : "",
	"autoAdvanceSetup" : false,
	"allowPairing" : true,
	"multiUser" : false,
	"supervised" : true,
	"maximumSharedAccounts" : 10,
	"configureDeviceBeforeSetupAssistant" : false,
	"sendTimezone" : false,
	"timezone" : "UTC",
	"storageQuotaSizeMegabytes" : 1024,
	"useStorageQuotaSize" : false,
	"temporarySessionOnly" : false,
	"enforceTemporarySessionTimeout" : false,
	"temporarySessionTimeout" : null,
	"enforceUserSessionTimeout" : false,
	"userSessionTimeout" : null,
	"names" : {
	"assignNamesUsing" : "Serial Numbers",
	"prestageDeviceNames" : [ ],
	"deviceNamePrefix" : "",
	"deviceNameSuffix" : "",
	"singleDeviceName" : "",
	"manageNames" : true,
	"deviceNamingConfigured" : true
	}
}
EOF
)

# Create Default iOS Device PreStage
createDevicePrestage(){
	curl --request POST \
	--url ${jamfProURL}/api/v2/mobile-device-prestages \
	--header 'Accept: application/json' \
	--header 'Content-Type: application/json' \
	--header "Authorization: Bearer ${token}" \
	--data "${mobilePrestageData}"
}
