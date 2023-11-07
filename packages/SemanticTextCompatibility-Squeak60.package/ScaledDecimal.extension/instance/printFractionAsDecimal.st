*SemanticTextCompatibility-Squeak60-printing-pseudo-override
printFractionAsDecimal

	^ String streamContents: [:stream |
		self printFractionAsDecimalOn: stream]