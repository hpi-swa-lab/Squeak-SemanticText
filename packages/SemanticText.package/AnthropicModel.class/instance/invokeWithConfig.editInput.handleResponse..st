private
invokeWithConfig: aConfigOrNil editInput: inputBlock handleResponse: responseBlock

	^ self
		invokeWithConfig: aConfigOrNil
		documents: nil
		editInput: inputBlock
		handleResponse: responseBlock