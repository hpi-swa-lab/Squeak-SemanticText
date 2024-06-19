service
getSoundFor: aString config: aConfigOrNil

	| config speaker |
	config := self baseConfig.
	aConfigOrNil ifNotNil:
		[config := config updatedWith: aConfigOrNil].
	
	speaker := self makeSpeakerForConfig: config.
	
	speaker say: aString.
	^ speaker voice asSound