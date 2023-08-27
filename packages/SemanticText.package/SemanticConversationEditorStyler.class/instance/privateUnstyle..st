private
privateUnstyle: aText

	aText removeAttributesThat: [:attribute | attribute isKindOf: TextColor].