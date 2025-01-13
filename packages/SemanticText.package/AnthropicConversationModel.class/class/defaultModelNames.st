constants
defaultModelNames

	self flag: #modelConstants.
	
	"first is default"
	^ {"recommended"
	self claude35SonnetLatestName.
	self claude35HaikuLatestName.
	self claude3OpusLatestName.
	
	"all other versions (pinned), ordered by version descending, date descending"
	self claude35Sonnet20241022Name.
	self claude35Sonnet20240620Name.
	self claude35Haiku20241022Name.
	self claude3Opus20240229Name.
	self claude3Sonnet20240229Name.
	self claude3Haiku20240307Name}