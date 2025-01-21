connection
controlConnectionDuring: aBlock

	self ignoreCertificate ifFalse: [^ aBlock value].
	
	^ aBlock on: SqueakSSLCertificateError do: [:ex | ex resume]