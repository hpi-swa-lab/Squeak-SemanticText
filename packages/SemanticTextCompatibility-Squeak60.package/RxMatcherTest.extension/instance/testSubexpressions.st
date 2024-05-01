*SemanticTextCompatibility-Squeak60-testing-protocol-override
testSubexpressions

	{
		{'abc'. #(('abc')). {{1 to: 3}}}.
		{'(a)b(c)'. #(('abc') ('a') ('c')). {{1 to: 3}. {1 to: 1}. {3 to: 3}}}. 
		{'(\w+)'. #(('abc') ('abc')). {{1 to: 3}. {1 to: 3}}}.
		{'(\w)+'. #(('abc') ('a' 'b' 'c')). {{1 to: 3}. {1 to: 1. 2 to: 2. 3 to: 3}}}.
		{'abc(\w)?'. #(('abc') ()). {{1 to: 3}. {}}}.
		{'((a)|(b))((a)|(b))c'. #(('abc') ('a') ('a') () ('b') () ('b')). {{1 to: 3}. {1 to: 1}. {1 to: 1}. {}. {2 to: 2}. {}. {2 to: 2}}}
	} do: [:spec |
		| matcher |
		matcher := spec first asRegex.
		self assert: (matcher matches: 'abc').
		self
			assert: spec second
			equals: (matcher allSubexpressions collect: #asArray).
		self
			assert: spec third
			equals:
				((1 to: matcher subexpressionCount) collect:
					[:index | (matcher subexpressionRanges: index) asArray])].