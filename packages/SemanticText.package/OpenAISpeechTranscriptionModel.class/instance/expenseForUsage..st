private
expenseForUsage: usage

	self assert: usage type = #duration.
	^ (OpenAIAmount exactCents: self centsPerSecond)
		* usage seconds