attributes
roleAttributes

	self flag: #todo. "honor ui themes"
	^ Dictionary new
		at: #user put: {TextColor black};
		at: #assistant put: {TextColor blue};
		at: #system put: {TextColor gray};
		at: #tool put: {TextColor color: Color green muchDarker};
		at: nil put: {TextColor red};
		yourself