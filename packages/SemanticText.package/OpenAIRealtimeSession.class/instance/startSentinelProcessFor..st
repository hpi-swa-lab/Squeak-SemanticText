private
startSentinelProcessFor: aStreamingMessage

	aStreamingMessage process:
		([[(Promise race:
			{aStreamingMessage semanticFutureWhen: #completed.
			self semanticFutureWhen: #stopped})
				wait]
			ifCurtailed: ["self cancelResponse"]]
				fork).