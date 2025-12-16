class initialization
initialize

	self withAllSubclassesDo: [:ea |
		ea initializeEventHandlers].