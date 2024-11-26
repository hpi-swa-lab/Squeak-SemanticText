as yet unclassified
storeForcedToolsCodeOn: aStream

	aStream nextPutAll:
		((self forcedTools isCollection and: [self forcedTools isSymbol not])
			ifTrue:
				 [self forcedTools collect: [:tool |
					(tool isString or: [tool isText])
						ifTrue: [tool asString]
						ifFalse: [tool name]]]
			ifFalse:
				[self forcedTools])
			storeString