private
invokeWithConfig: aConfigOrNil editInput: inputBlock

	^ self
		invokeWithConfig: aConfigOrNil
		editInput: inputBlock
		handleResponse: [:response |]