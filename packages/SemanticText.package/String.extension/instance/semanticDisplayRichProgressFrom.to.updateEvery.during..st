*SemanticText-toolbuilder-kernel
semanticDisplayRichProgressFrom: minVal to: maxVal updateEvery: msecs during: workBlock  

	| lastUpdate startTime dist progress remaining |
	startTime := DateAndTime now.
	lastUpdate := 0.
	dist := maxVal - minVal.
	^ self displayProgressFrom: minVal to: maxVal during: [:bar |
		bar value: minVal.
		workBlock value: [:val |
			(Time millisecondsSince: lastUpdate) > msecs ifTrue:
				[bar value: val.
				dist = 0 ifFalse:
					[progress := val / (maxVal - minVal).
					remaining := startTime semanticRemainingTimeForProgress: progress.
					ProgressNotification signal: '' extra:
						((remaining ifNil: ['{1} ({2}%)'] ifNotNil: ['{1} ({2}%, {3} remaining)'])
							format: {
								self.
								(progress * 100) printShowingDecimalPlaces: 2.
								remaining ifNotNil: [remaining semanticShortPrintString]})].
				lastUpdate := Time millisecondClockValue]]]