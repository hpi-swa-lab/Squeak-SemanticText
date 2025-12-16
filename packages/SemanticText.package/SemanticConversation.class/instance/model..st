accessing
model: aModel

	model := aModel.
	
	self realtimeSession ifNotNil: [:session |
		session model: aModel; updateSession].