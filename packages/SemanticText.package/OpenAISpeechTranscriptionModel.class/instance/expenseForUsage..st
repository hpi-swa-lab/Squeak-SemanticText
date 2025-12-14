private
expenseForUsage: usage

	^ usage type caseOf:
		{[#duration] ->
			[(OpenAIAmount exactCents: self centsPerSecond)
				* usage seconds].
		[#tokens] ->
			[| inputDetails |
			inputDetails := usage at: 'input_token_details'.
			self expenseForTokenSpecs:
				{(inputDetails at: 'audio_tokens') -> #centsPerAudioToken.
				(inputDetails at: 'text_tokens') -> #centsPerInputTextToken.
				(usage at: 'output_tokens') -> #centsPerOutputTextToken}]}