converting
signatureString

	^ String streamContents: [:stream |
		self printSignatureOn: stream]