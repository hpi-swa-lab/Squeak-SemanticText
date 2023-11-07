private
applyMessageMarkupsFor: aMessage interval: anInterval to: aText

	| markups |
	messageMarkups ifNil: [^ self].
	
	markups := messageMarkups at: aMessage ifAbsent: [^ self].
	markups keysAndValuesDo: [:key :attributes |
		| stream |
		stream := self
			streamMatchingRangesFor: key escapeForRegex asRegex
			in: (aText readStream skip: anInterval first - 1).
		[stream atEnd not and: [stream peek first <= anInterval last]] whileTrue:
			[| match |
			match := stream next.
			match last <= anInterval last ifTrue:
				[aText addAllAttributes: attributes from: match first to: match last]]].