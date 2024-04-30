tests
testFromString

	| function |
	function := self classToBeTested fromString:
		'name "function comment with \"quotes\" and back\\slash"
			(arg1: string "arg1 comment with \"quotes\" and back\\slash",
			arg2!: boolean "arg2 is required",
			arg3?: number "arg3 is optional",
			arg4,
			arg5: {"type": "string", "properties": {"enum_item": {"enum": ["plonk_griffle"]}, "pattern_string": {"type": "string", "pattern": "\\w+_[0-9]+"}}} "arg5 has highly complicated JSON schema")'.
	
	self assert: 'name' equals: function name.
	self assert: 'function comment with "quotes" and back\slash' equals: function description.
	self assert: 5 equals: function parameters size.
	self assert: 'arg1' equals: function parameters first name.
	self assert: 'arg1 comment with "quotes" and back\slash' equals: function parameters values first description.
	self assert: 'string' equals: function parameters values first type.
	self assert: function parameters values first required.
	self assert: 'arg2' equals: function parameters values second name.
	self assert: 'arg2 is required' equals: function parameters values second description.
	self assert: 'boolean' equals: function parameters values second type.
	self assert: function parameters values second required.
	self assert: 'arg3' equals: function parameters values third name.
	self assert: 'arg3 is optional' equals: function parameters values third description.
	self assert: 'number' equals: function parameters values third type.
	self deny: function parameters values third required.
	self assert: 'arg4' equals: function parameters values fourth name.
	self assert: nil equals: function parameters values fourth description.
	self assert: (function parameters values fourth type isDictionary and: [function parameters values fourth type isEmpty]).
	self assert: function parameters values fourth required.
	self assert: 'arg5' equals: function parameters values fifth name.
	self assert: 'arg5 has highly complicated JSON schema' equals: function parameters values fifth description.
	self assert: '{"type": "string", "properties": {"enum_item": {"enum": ["plonk_griffle"]}, "pattern_string": {"type": "string", "pattern": "\\w+_[0-9]+"}}}' parseAsOrderedJson equals: function parameters values fifth type.
	self assert: function parameters values fifth required.