requests
createResponseWithConfig: aConfigOrNil

	^ (self
		sendCreateResponseWithToolSpec: self conversation activeToolSpec
		config: aConfigOrNil)
			wait