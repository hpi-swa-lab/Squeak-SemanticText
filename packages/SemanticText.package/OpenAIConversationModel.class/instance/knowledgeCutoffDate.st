accessing
knowledgeCutoffDate

	self flag: #modelConstants.
	
	(self resolvedName beginsWith: self class gpt4oMiniName) ifTrue: [^ DateAndTime year: 2023 month: 10 day: 1].
	(self resolvedName beginsWithAnyOf: {self class gpt4oName. self class chatgpt4oLatestName}) ifTrue: [^ DateAndTime year: 2023 month: 10 day: 1].
	(self resolvedName beginsWith: self class gpt45PreviewName) ifTrue: [^ DateAndTime year: 2023 month: 10 day: 1].
	(self resolvedName beginsWithAnyOf: {self class o1MiniName. self class o1Name}) ifTrue: [^ DateAndTime year: 2023 month: 10 day: 1].
	(self resolvedName beginsWith: {self class o3MiniName}) ifTrue: [^ DateAndTime year: 2023 month: 10 day: 1].
	(self resolvedName beginsWithAnyOf: {self class gpt4TurboName. self class gpt4Name}) ifTrue: [^ DateAndTime year: 2023 month: 12 day: 1].
	(self resolvedName beginsWith: self class gpt35Name) ifTrue: [^ DateAndTime year: 2021 month: 9 day: 1].
	^ nil