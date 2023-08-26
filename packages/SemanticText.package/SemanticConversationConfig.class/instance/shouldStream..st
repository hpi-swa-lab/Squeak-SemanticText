accessing
shouldStream: aBoolean
	"If the model supports this, assistant replies will be streamed incrementally. This reduces the wait time for users until the output of the reply begins."

	self argumentAt: #shouldStream put: aBoolean.