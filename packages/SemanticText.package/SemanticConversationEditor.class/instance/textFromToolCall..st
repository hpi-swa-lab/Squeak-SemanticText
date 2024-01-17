private
textFromToolCall: aToolCall

	^ Text streamContents: [:stream |
		stream
			withAttributes:
				(Array
					with: TextEmphasis italic
					with:
						(TextInspectIt on: aToolCall))
			do:
				[stream
					"nextPutAll: 'call tool [';
					nextPutAll: aToolCall key;
					nextPutAll: ']: ';"
					nextPut: $[;
					nextPutAll: aToolCall key;
					nextPutAll: '] ';
					nextPutAll: aToolCall callString.
				self class
					syncContentUpdatesFrom: aToolCall
					stringBlock: [:call | call callString]
					to: (WeakArray with: self)]]