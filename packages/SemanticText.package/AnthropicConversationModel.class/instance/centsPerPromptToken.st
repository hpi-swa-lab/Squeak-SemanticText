accessing
centsPerPromptToken
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by Anthropic."

	self flag: #modelConstants.
    
	^ self resolvedName caseOf: {
		"Claude 3.5 Latest"
		[self class claude35SonnetLatestName] -> [0.0003s]. "Input: $3/MTok"
		[self class claude35HaikuLatestName] -> [0.00008s]. "Input: $0.80/MTok"
		[self class claude3OpusLatestName] -> [0.0015s]. "Input: $15/MTok"
 
		"Claude 3.5 Pinned Versions"
		[self class claude35Sonnet20241022Name] -> [0.0003s]. "Input: $3/MTok"
		[self class claude35Sonnet20240620Name] -> [0.0003s]. "Input: $3/MTok"
		[self class claude35Haiku20241022Name] -> [0.00008s]. "Input: $0.80/MTok"
        
		"Claude 3 Pinned Versions"
		[self class claude3Opus20240229Name] -> [0.0015s]. "Input: $15/MTok"
		[self class claude3Sonnet20240229Name] -> [0.0003s]. "Input: $3/MTok"
		[self class claude3Haiku20240307Name] -> [0.000025s] "Input: $0.25/MTok"
	}