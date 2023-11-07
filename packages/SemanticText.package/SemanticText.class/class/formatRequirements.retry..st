support
formatRequirements: requirements retry: retryBlock

	^ Text streamContents: [:stream |
		requirements withIndexDo: [:requirement :index |
			stream
				withAttribute:
					(PluggableTextAttribute evalBlock:
						[requirement third value.
						retryBlock value])
				do: [stream nextPutAll: requirement second].
			
			index < requirements size ifTrue:
				[stream nextPutAll:
					(index + 1 = requirements size
						ifFalse: [', ']
						ifTrue: [', and '])]]]