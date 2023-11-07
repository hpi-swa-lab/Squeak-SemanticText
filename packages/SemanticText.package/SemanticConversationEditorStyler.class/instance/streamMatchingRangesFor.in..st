private
streamMatchingRangesFor: aRxMatcher in: aReadStream

	  ^ Generator on: [:gen |
		aRxMatcher matchesOnStream: aReadStream do: [:match |
			| streamPosition |
			gen nextPut:
				((streamPosition := aReadStream position) - match size + 1
					to: streamPosition)]]