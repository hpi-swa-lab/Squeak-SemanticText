accessing
centsPerCompletionToken
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by Anthropic."

	self flag: #modelConstants.
	
	^ self resolvedName caseOf: {
		"Claude 3.5 Latest"
		[self class claude35SonnetLatestName] -> [0.0015s]. "Output: $15/MTok"
		[self class claude35HaikuLatestName] -> [0.0004s]. "Output: $4/MTok"
		[self class claude3OpusLatestName] -> [0.0075s]. "Output: $75/MTok"
		
		"Claude 3.5 Pinned Versions"
		[self class claude35Sonnet20241022Name] -> [0.0015s]. "Output: $15/MTok"
		[self class claude35Sonnet20240620Name] -> [0.0015s]. "Output: $15/MTok"
		[self class claude35Haiku20241022Name] -> [0.0004s]. "Output: $4/MTok"
		
		"Claude 3 Pinned Versions"
		[self class claude3Opus20240229Name] -> [0.0075s]. "Output: $75/MTok"
		[self class claude3Sonnet20240229Name] -> [0.0015s]. "Output: $15/MTok"
		[self class claude3Haiku20240307Name] -> [0.000125s] "Output: $1.25/MTok"
	}