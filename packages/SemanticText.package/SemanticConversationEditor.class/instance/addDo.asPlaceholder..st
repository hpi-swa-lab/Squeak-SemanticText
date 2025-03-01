actions
addDo: textBlock asPlaceholder: isPlaceholder

	^ self addDo: textBlock type: (isPlaceholder ifTrue: [#placeholder] ifFalse: [#message])