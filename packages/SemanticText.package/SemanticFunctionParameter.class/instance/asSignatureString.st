converting
asSignatureString

	^ String streamContents: [:stream |
		self printSignatureOn: stream]