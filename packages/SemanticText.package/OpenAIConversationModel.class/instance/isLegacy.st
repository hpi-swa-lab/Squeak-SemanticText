accessing
isLegacy

	self flag: #modelConstants.
	
	^ {self class gpt35Turbo0613Name. self class gpt35Turbo16k0613Name. self class gpt35Turbo16kName. self class gpt35_16kName} includes: self name