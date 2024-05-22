constants
defaultModelNames

	self flag: #modelConstants.
	
	^ {self gpt35TurboName. "first is default"
	self gpt4Name.
	self gpt4_32kName.
	self gpt4TurboName.
	self gpt4TurboPreviewName.
	self gpt4oName.
	
	"pinned versions"
	self gpt35Turbo0125Name.
	self gpt35Turbo1106Name.
	self gpt35Turbo0613Name.
	self gpt35Turbo16k0613Name.
	self gpt4o_20240513Name.
	self gpt4_20240409Name.
	self gpt4_0125Name.
	self gpt4_1106Name.
	self gpt4_0613Name.
	self gpt4_32k0613Name}