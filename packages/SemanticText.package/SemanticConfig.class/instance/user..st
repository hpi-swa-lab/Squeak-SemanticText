accessing
user: aString
	"Optional unique identifier representing the end-user. Used for local expenses tracking and for abuse monitoring at OpenAI."

	^ self argumentAt: #user put: aString