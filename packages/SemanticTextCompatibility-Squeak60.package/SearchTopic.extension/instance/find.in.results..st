*SemanticTextCompatibility-Squeak60-searching-pseudo-override
find: term in: path results: results

	| resultEntry topic contents index | 
	topic := path last.
	resultEntry := Array new: 6. "{topicPath. titleHitInterval?. contentExcerptInterval?. contentExcerpt?. leadingContext? (not in use). contentHitInterval?}"
	resultEntry at: 1 put: path.
	
	contents := topic title asString.
	(index := contents findString: term startingAt: 1 caseSensitive: false) > 0 ifTrue: [
		resultEntry at: 2 put: (index to: index + term size - 1) ].
	
	contents := topic contents asString withSqueakLineEndings.
	(index := contents findString: term startingAt: 1 caseSensitive: false) > 0 ifTrue: [
		| leadingContext trailingContext i |
		leadingContext := 0.
		trailingContext := 0.
		i := index.
		[i notNil] whileTrue: [
			(leadingContext = 2 or: [i = 1])
				ifTrue: [
					leadingContext := i = 1 ifTrue: [i] ifFalse: [i+1].
					i := nil]
				ifFalse: [
					((contents at: i) = Character cr) ifTrue: [
						leadingContext := leadingContext + 1].
						i := i - 1] ].
		i := index + term size.
		[i notNil] whileTrue: [
			(trailingContext = 2 or: [i >= contents size])
				ifTrue: [
					trailingContext := i = contents size ifTrue: [i] ifFalse: [i-1].
					i := nil]
				ifFalse: [
					((contents at: i) = Character cr) ifTrue: [
						trailingContext := trailingContext + 1].
						i := i + 1] ].
		
		resultEntry
			at: 3 put: (index - leadingContext + 1 to: index - leadingContext + term size);
			at: 4 put: (contents copyFrom: leadingContext to: trailingContext);
			at: 5 put: leadingContext;
			at: 6 put: (index to: index + term size - 1) ].
	
	(resultEntry second notNil "match in title" or: [resultEntry third notNil "match in contents"]) ifTrue: [
		self mutex critical: [ results add: resultEntry ].
		self triggerUpdateContents].
	
	topic isSearchable ifTrue: [
		self flag: #todo. "Selecting nested results (#searchResultSelected) currently does not work because the model usually has a different instance of the topic than retrieved here."
		self flag: #bug. "For cyclic #subtopics, search never stops."
		topic subtopics do: [:t | self find: term in: path, {t} results: results]].