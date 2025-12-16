connection
connectWith: aBlock

	| authorizeBlock |
	authorizeBlock := [:request |
		self apiKey ifNotNil: [:apiKey |
			request headerAt: 'Authorization' put: 'Bearer ' , apiKey]].
	
	^ [aBlock value: authorizeBlock]
		on: SqueakSSLCertificateError
		do: [:ex |
			self ignoreCertificate ifTrue: [ex resume].
			ex pass]