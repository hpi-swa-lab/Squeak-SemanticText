private
privateUnstyle: aText

	| allMarkupAttributes |
	allMarkupAttributes := messageMarkups ifNotNil:
		[messageMarkups values gather: [:markup | markup values flattened]].
	aText removeAttributesThat: [:attribute |
		(attribute isKindOf: TextColor) or:
			[allMarkupAttributes notNil and: [allMarkupAttributes includes: attribute]]].
	
	"complements styleMessageText:from:to:"
	aText removeAttributesThat: [:attribute |
		(attribute isKindOf: TextURL orOf: PluggableTextAttribute) or: [attribute = TextColor gray]].