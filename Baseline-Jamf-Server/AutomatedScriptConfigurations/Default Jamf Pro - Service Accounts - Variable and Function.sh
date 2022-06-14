#!/bin/bash

# Created 5.23.2022 @robjschroeder

# Service accounts used for API calls, some characters in password need to be escaped in XML
serviceAccounts="api_Notifications, API Notifications, Robert.Schroeder@insight.com, fX*ms9EhGZtK2VMZ
api_PowerAutomate, API PowerAutomate, Robert.Schroeder@insight.com, V6#w9zJzh2jVVG@&amp;
api_GitHub, API GitHub, Robert.Schroeder@insight.com, UTmC5NytWLiNqB"

createServiceAccounts(){
	# If csv already exists, remove it
	rm -rf /tmp/jamfProSA.csv
	# Create local CSV of the defined Jamf Pro Users
	echo "$serviceAccounts" > /tmp/jamfProSA.csv
	
	INPUT="/tmp/jamfProSA.csv"
	OLDIFS=$IFS
	IFS=','
	[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
	while read username displayname email password
	do
		curl --request POST \
		--url ${jamfProURL}/JSSResource/accounts/userid/0 \
		--header 'Accept: application/xml' \
		--header 'Content-Type: application/xml' \
		--header "Authorization: Bearer ${token}" \
		--data "<account><name>${username}</name><full_name>${displayname}</full_name><email>${email}</email><email_address>${email}</email_address><enabled>Enabled</enabled><privilege_set>Administrator</privilege_set><password>${password}</password></account>"
	done < $INPUT
	IFS=$OLDIFS
	# Remove the tmp csv file
	sleep 10
	rm -rf /tmp/jamfProSA.csv
}
