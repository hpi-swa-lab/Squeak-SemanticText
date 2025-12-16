private
jsonCancel

	self basicComplete: true.
	self triggerEvent: #cancelled.