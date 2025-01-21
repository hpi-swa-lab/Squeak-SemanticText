accessing
maxTokens

	self flag: #modelConstants.
	
	"https://docs.anthropic.com/en/docs/about-claude/models"
	"200K context window for all models across the board."
	
	^ 200000