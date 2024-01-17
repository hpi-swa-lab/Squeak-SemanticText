tests
testFromStringShort

	| function |
	function := self classToBeTested fromString: 'plonk'.
	
	self assert: 'plonk' equals: function name.
	self assert: nil equals: function description.
	self assert: function parameters isEmpty.