private
textFromToolMessage: aToolMessage

	^ Text streamContents: [:stream |
		stream
			withAttribute: (TextInspectIt on: aToolMessage content) do:
				[stream
					withAttribute: TextEmphasis italic do:
						[stream
							nextPut: $[;
							nextPutAll: aToolMessage key;
							nextPut: $]];
					space;
					nextPutAll: aToolMessage basicContent].
		
		self flag: #bug. "leads to terrible character duplications during typing"
		"self class
			syncContentUpdatesFrom: aToolMessage
			stringBlock: [:message | '[{1}] {2}' format: {message key. message contentString}]
			to: (WeakArray with: self)"]