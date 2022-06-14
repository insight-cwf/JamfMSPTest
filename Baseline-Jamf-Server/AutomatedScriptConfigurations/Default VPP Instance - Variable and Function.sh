#!/bin/bash

# Created 5.23.2022 @robjschroeder

# Volume Purchasing sToken (Example of varilable value)
sToken="eyJleHBEYXRlIjoiMjAyMy0wNS0xOVQxODo0MDo0OSswMDAwIiwidG9rZW4iOiJrVzhYWTlHcWg5azlmQ3A4NjZZZjdzbzZ1OHNpY01nclB5RXdyUVcrNTUzd0NkUVdkdWxzZVl0dFVUSjRYZngzaENxNFZaYW43TmZDRjlwSm1KQWNzbitjSXVES0JzU3VQaHJHNk9sYyt1WlpvSDVESTdOaHpJejlBSHVIYzRKRUhUenFCTkVkUktMUXZwOHczV05EblQvbHFRSWQzZlRkMVgwRE43Y2ZVOUl4NytxYTFDeHAvemtMaHpYQXJWNGgiLCJvcmdOYW1lIjoiSU5TSUdIVCBESVJFQ1QifQ=="

# Create a Volume Purchasing Location
createVPP(){
	curl --request POST \
	--url ${jamfProURL}/api/v1/volume-purchasing-locations \
	--header 'Accept: application/json' \
	--header 'Content-Type: application/json' \
	--header "Authorization: Bearer ${token}" \
	--data '
{
	"automaticallyPopulatePurchasedContent": true,
	"sendNotificationWhenNoLongerAssigned": true,
	"autoRegisterManagedUsers": true,
	"siteId": "-1",
	"name": "'"${OrgName}"' VPP",
	"serviceToken": "'"${sToken}"'"
}
'
}
