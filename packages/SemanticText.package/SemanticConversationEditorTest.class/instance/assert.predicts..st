asserting
assert: expectedText predicts: actualText

	self assert: expectedText asString equals: actualText asString.
	self assert: expectedText runs size equals: actualText runs size.
	1 to: expectedText size do: [:i |
		(expectedText at: i) isSeparator ifFalse:
			[| actualAttributes |
			actualAttributes := actualText attributesAt: i.
			(expectedText attributesAt: i) do: [:expectedAttribute |
				self assert:
					(actualAttributes includes: expectedAttribute)]]].