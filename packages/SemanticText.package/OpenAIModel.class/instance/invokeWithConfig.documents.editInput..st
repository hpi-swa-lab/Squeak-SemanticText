private
invokeWithConfig: aConfigOrNil documents: documentsOrNil editInput: inputBlock

	^ self
		invokeWithConfig: aConfigOrNil
		documents: documentsOrNil
		editInput: inputBlock
		handleResponse: [:response |]