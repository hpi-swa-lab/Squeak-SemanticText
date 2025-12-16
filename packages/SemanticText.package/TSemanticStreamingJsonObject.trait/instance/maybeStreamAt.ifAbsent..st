accessing - streaming
maybeStreamAt: key ifAbsent: aBlock 

	^((self array at: (self basicScanForBlocking: key)) ifNil: [ aBlock ]) value