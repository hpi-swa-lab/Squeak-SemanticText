private
expenseForTokenSpecs: specs

	^ specs inject: OpenAIAmount zero
		into: [:sum :assoc |
			| tokens |
			(tokens := assoc key ifNil: [0]) > 0
				ifFalse: [sum]
				ifTrue:
					[sum +
						(OpenAIAmount exactCents: (self perform: assoc value) * tokens)]]