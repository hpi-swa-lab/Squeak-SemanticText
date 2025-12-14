private
streamDoing: aBlock

	self becomeForward: (self as: SemanticStreamingConversation) copyHash: true.
	^ self streamDoing: aBlock