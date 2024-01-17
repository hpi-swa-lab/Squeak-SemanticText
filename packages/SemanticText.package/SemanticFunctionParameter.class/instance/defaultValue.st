accessing
defaultValue

	^ self type
		caseOf:
			{[#string] -> [''].
			[#number] -> [0].
			[#boolean] -> [false].
			[#array] -> [#()].
			[#object] -> [JsonObject new]}
		otherwise: [nil]