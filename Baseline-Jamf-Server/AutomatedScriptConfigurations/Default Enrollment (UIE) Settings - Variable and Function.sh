#!/bin/bash

# Created 5.23.2022 @robjschroeder

# Default Enrollment (UIE) Settings
enrollmentData=$(cat <<EOF
{
	"installSingleProfile" : true,
	"signingMdmProfileEnabled" : false,
	"restrictReenrollment" : false,
	"flushLocationInformation" : true,
	"flushLocationHistoryInformation" : true,
	"flushPolicyHistory" : true,
	"flushExtensionAttributes" : true,
	"flushMdmCommandsOnReenroll" : "DELETE_EVERYTHING",
	"macOsEnterpriseEnrollmentEnabled" : true,
	"managementUsername" : "${OrgName}_jss",
	"managementPasswordSet" : false,
	"passwordType" : "RANDOM",
	"randomPasswordLength" : 17,
	"createManagementAccount" : false,
	"hideManagementAccount" : false,
	"allowSshOnlyManagementAccount" : false,
	"ensureSshRunning" : false,
	"launchSelfService" : false,
	"signQuickAdd" : false,
	"iosEnterpriseEnrollmentEnabled" : true,
	"iosPersonalEnrollmentEnabled" : false,
	"personalDeviceEnrollmentType" : "USERENROLLMENT",
	"accountDrivenUserEnrollmentEnabled" : false
}
EOF
)

# Create Default UIE Settings
createEnrollment(){
	curl --request PUT \
	--url ${jamfProURL}/api/v2/enrollment \
	--header 'Accept: application/json' \
	--header 'Content-Type: application/json' \
	--header "Authorization: Bearer ${token}" \
	--data "${enrollmentData}"
}
