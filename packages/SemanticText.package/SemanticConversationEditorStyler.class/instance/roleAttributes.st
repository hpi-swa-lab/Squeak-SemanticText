attributes
roleAttributes

	^ Dictionary new
		at: #user put: {TextColor black};
		at: #assistant put: {TextColor blue};
		at: #system put: {TextColor gray};
		at: nil put: {TextColor red};
		yourself