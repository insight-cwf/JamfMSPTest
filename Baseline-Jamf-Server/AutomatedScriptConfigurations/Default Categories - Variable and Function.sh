#!/bin/bash

# Created 5.23.2022 @robjschroeder

# Create categories, modify array of categories to be created in Jamf Pro, make sure spaces are escaped
categories=(
	Applications
	Enrollment
	Inventory
	Security
	Software\ Updates
	Test\ Category\ 1
	Test\ Category\ 2
	Testing
)

# Create category records
createCategories(){
	for category in "${categories[@]}"; do
		curl --request POST \
		--url ${jamfProURL}/api/v1/categories \
		--header 'Accept: application/json' \
		--header 'Content-Type: application/json' \
		--header "Authorization: Bearer ${token}" \
		--data '{"name": "'"${category}"'","priority": 9}'
	done
}
