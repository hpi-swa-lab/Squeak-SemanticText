private
styleMessageText: aText from: start to: stop
	"Yes, very opinionated. In the future, an automated TextReadWriter step during message parsing and sending would be preferable. Maybe even handle full Markdown."

	| rangeText |
	rangeText := aText copyFrom: start to: stop.
	
	('(http|https|ftp|code|mid)\:[^\s\xa0''"]{4,}(?<![.,:!?()<>\[\]])' asRegex matchingRangesIn: rangeText)
		collect: [:range | range + start - 1]
		thenDo: [:range |
			| url attribute |
			url := aText copyFrom: range start to: range stop.
			attribute := TextURL url: url asString.
			
			
			self flag: #hacked. "remove this as soon as URL refactoring is in trunk!"
			(url beginsWith: 'mid:') ifTrue:
				[(Smalltalk classNamed: #TalkInbox) ifNotNil: [:talkInbox |
					attribute := PluggableTextAttribute evalBlock:
						[(talkInbox squeakDev messageForId: '<' , (url allButFirst: 4) , '>') browse]]].
			
			aText addAttribute: attribute from: range start to: range stop].
	
	('^>+[  ]?[^\r\n]*$' asRegex matchingRangesIn: rangeText)
		collect: [:range | range + start - 1]
		thenDo: [:range |
			aText addAttribute: TextColor gray from: range start to: range stop].