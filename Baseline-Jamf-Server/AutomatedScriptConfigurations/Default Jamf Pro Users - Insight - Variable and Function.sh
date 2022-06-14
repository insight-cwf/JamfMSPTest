#!/bin/bash

# Created 5.23.2022 @robjschroeder

# Create additional Jamf Pro administrators, these accounts will be created with a temporary password and forced to change upon first login
jamfProUsers="insight_peter.brooks, Peter Brooks, Peter.Brooks@insight.com
insight_robert.schroeder, Robert Schroeder, Robert.Schroeder@insight.com
insight_alex.fajerman, Alex Fajerman, Alex.Fajerman@insight.com
insight_brian.kaseff, Brian Kaseff, Brian.Kaseff@insight.com
insight_kris.huff, Kris Huff, Kris.Huff@insight.com"

tempPassword="Insight2022!!"

# Create additional Jamf Pro Administrators
createJamfAdmins(){
	# If csv already exists, remove it
	rm -rf /tmp/jamfProUsers.csv
	# Create local CSV of the defined Jamf Pro Users
	echo "$jamfProUsers" > /tmp/jamfProUsers.csv
	
	INPUT="/tmp/jamfProUsers.csv"
	OLDIFS=$IFS
	IFS=','
	[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
	while read username displayname email
	do
		curl --request POST \
		--url ${jamfProURL}/JSSResource/accounts/userid/0 \
		--header 'Accept: application/xml' \
		--header 'Content-Type: application/xml' \
		--header "Authorization: Bearer ${token}" \
		--data "<account><name>${username}</name><full_name>${displayname}</full_name><email>${email}</email><email_address>${email}</email_address><enabled>Enabled</enabled><privilege_set>Administrator</privilege_set><password>${tempPassword}</password><force_password_change>true</force_password_change></account>"
	done < $INPUT
	IFS=$OLDIFS
	# Remove the tmp csv file
	rm -rf /tmp/jamfProUsers.csv
}
