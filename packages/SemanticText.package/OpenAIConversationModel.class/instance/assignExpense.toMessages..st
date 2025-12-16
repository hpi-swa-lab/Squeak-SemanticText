private
assignExpense: expense toMessages: messages

	messages size = 1
		ifTrue:
			[messages first addExpense: expense]
		ifFalse:
			[| estimatedTokenCounts |
			estimatedTokenCounts := messages collect: [:message |
				self countTokensInMessage: message].
			messages
				with:
					(expense asApproximated "because token counts are estimated"
						distributeBulkToShares: estimatedTokenCounts)
				do: [:message :unitPrice |
					message addExpense: unitPrice]].