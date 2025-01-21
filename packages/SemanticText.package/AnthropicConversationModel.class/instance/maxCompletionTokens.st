accessing
maxCompletionTokens

	self flag: #modelConstants.
	
	"https://docs.anthropic.com/en/docs/about-claude/models"
	"Claude 3.5 family all have 8192 max tokens output, Claude 3 family have 4096."
	
	^ (self resolvedName beginsWith: 'claude-3-5-')
		ifTrue: [8192]
		ifFalse: [4096]