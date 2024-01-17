tests
testFromString

	| toolCall |
	toolCall := self classToBeTested fromString:
		'plonk
			(arg1="griffle",
			arg2 = true,
			arg4=42,
			arg5={"enum_item": "plonk"})'.
	
	self assert: #plonk equals: toolCall tool.
	self
		assert:
			(OrderedJsonObject new
				arg1: 'griffle';
				arg2: true;
				arg4: 42;
				arg5:
					(OrderedJsonObject new
						enum_item: 'plonk';
						yourself);
				yourself)
					asJsonString parseAsOrderedJson
		equals: toolCall arguments.