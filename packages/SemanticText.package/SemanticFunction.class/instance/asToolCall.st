converting
asToolCall

	^ SemanticToolCall
		key: nil
		tool: self
		arguments:
			(self parameters
				collect: [:parameter | parameter defaultValue]
				as: OrderedJsonObject)