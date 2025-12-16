private
readDictionary

	| result key commaNeeded value previousPublishBlock valueStream |
	result := dictionaryClass new.
	publishBlock ifNotNil:
		[result := publishBlock value: result].
	[commaNeeded := false.
	currentCharacter := stream next.
	[
		self skipWhitespace.
		currentCharacter == $} ifTrue: [ 
			currentCharacter := stream next.
			result jsonBeComplete.
			^result ].
		commaNeeded
			ifFalse: [ commaNeeded := true ]
			ifTrue: [ 
				currentCharacter == $, ifFalse: [ self error: 'Missing comma' ].
				currentCharacter := stream next.
				self skipWhitespace ].
		currentCharacter == $" ifFalse: [  self error: 'Key in dictionary must be string' ].
		key := self readString.
		self skipWhitespace.
		currentCharacter == $: ifFalse: [ self error: 'Missing colon' ].
		currentCharacter := stream next.
		previousPublishBlock := publishBlock.
		publishBlock := [:new |
			| published |
			result streamedAt: key ifPresent: [:existing |
				published := existing].
			published ifNil:
				[result at: key put: new.
				published := new].
			publishBlock := nil.
			published].
		value := self readAny.
		valueStream := result streamedAt: key.
		(publishBlock notNil or: [valueStream isStream]) ifTrue: [result at: key put: value].
		valueStream isStream ifTrue: [valueStream triggerEvent: #completed].
		publishBlock := previousPublishBlock ] repeat]
			ifCurtailed: [result jsonIsComplete ifFalse: [result jsonCancel]]