converting
asToolCallWithKey: key arguments: arguments

	arguments isDictionary ifFalse:
		[^ self asToolCallWithKey: key arguments:
			((self parameters keys
				withIndexCollect: [:name :index | name -> (arguments at: index)])
				as: OrderedJsonObject)].
	
	^ SemanticToolCall
		key: key
		tool: self
		arguments: arguments