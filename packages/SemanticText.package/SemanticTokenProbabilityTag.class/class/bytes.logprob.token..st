instance creation
bytes: anArray logprob: aNumber token: aString

	^ self new
		bytes: anArray;
		logprob: aNumber;
		token: aString;
		yourself