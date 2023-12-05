updating
windowIsClosing

	self cancel.
	self conversation releaseForEventReceiver: self.
	
	^ super windowIsClosing