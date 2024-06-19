service
getSoundFor: aString config: aConfigOrNil

	self
		invokeWithConfig: aConfigOrNil
		editInput: [:input :config |
			input input: aString.
			input voice: config voice.
			config speed ifNotNil: [:speed |
				input speed: speed asFloat].
			input response_format: 'mp3']
		handleResponse: [:response :config |
			response isSuccess ifTrue:
				[^ [self soundFromMp3Stream: response content]
					ensure:
						[self account
							noteExpense: (self priceFor: aString)
							forUser: config user
							model: self name]]].