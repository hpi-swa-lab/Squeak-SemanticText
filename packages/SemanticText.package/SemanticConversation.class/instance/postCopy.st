copying
postCopy

	| copiedMessages |
	super postCopy.
	
	config := config copy.
	
	self flag: #refactor. "we really should have a custom DeepCopier for this."
	copiedMessages := IdentityDictionary new.
	messages := messages collect: [:message | copiedMessages at: message put: message copy].
	copiedMessages keysAndValuesDo: [:oldMessage :newMessage |
		newMessage conversation: self.
		newMessage isToolMessage ifTrue:
			[| index |
			copiedMessages associations
				detect: [:oldAndNew | (index := oldAndNew key toolCalls identityIndexOf: oldMessage toolCall) > 0]
				ifFound: [:oldAndNew | newMessage toolCall: (oldAndNew value toolCalls at: index)]]].
	toolSpecs := toolSpecs associations
		collect: [:keyAndToolSpec |
			(copiedMessages at: keyAndToolSpec key ifAbsent: [keyAndToolSpec key])
				-> keyAndToolSpec value copy]
		as: toolSpecs species.