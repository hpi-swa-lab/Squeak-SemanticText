updating
windowIsClosing

	self cancel.
	self voiceAutomaton stopVoice.
	self conversation releaseForEventReceiver: self.
	
	^ super windowIsClosing