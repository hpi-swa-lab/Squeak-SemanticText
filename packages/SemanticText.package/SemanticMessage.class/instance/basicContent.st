accessing
basicContent
	"The basic textual representation of the content, excluding cursor for streaming messages. Other than #content, this is guaranteed to return a textual representation even for tool messages."

	^ self basicContentTextFromParts: self contentParts