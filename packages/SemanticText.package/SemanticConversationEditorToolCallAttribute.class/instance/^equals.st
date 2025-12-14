comparing
= other 

	^ other class == self class
		and: [other toolCall = self toolCall]