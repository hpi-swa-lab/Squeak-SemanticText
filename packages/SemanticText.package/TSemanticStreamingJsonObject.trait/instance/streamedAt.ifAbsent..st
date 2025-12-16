accessing - streaming
streamedAt: key ifAbsent: aBlock 

	^((self array at: (self scanForNonBlocking: key)) ifNil: [ aBlock ]) value