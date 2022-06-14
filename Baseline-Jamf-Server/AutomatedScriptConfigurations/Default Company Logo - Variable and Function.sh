#!/bin/bash

# Created 5.23.2022 @robjschroeder

# Company Logo File Path, recommeneded 128x128 in png or gif format
companyLogo="/Users/rob/Downloads/icon.png"

# Upload Company Logo Icon
uploadLogo(){
	curl --request POST \
	--url ${jamfProURL}/api/v1/icon \
	--header 'Accept: application/json' \
	--header 'Content-Type: multipart/form-data' \
	--header "Authorization: Bearer ${token}" \
	--form file=@${companyLogo}
}
