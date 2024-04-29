copying
postCopy

	| copiedTools |
	super postCopy.
	
	copiedTools := IdentityDictionary new.
	tools := tools collect: [:tool | copiedTools at: tool put: tool copy].
	forcedTools ifNotNil:
		[forcedTools := forcedTools collect: [:tool | copiedTools at: tool ifAbsent: [tool copy]]].