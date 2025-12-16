accessing
speed: aNumber
	"Speed of the speech between 0.25 to 4.0 (chat completions) or 1.5 (realtime). Defaults to 1.0."

	self argumentAt: #speed put: aNumber.