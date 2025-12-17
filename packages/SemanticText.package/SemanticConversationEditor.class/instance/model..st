accessing
model: aModel

	self conversation model: aModel.
	self changed: #model.
	
	self assureModelAvailableOr: [^ self].
	self updateRealtimeSession.