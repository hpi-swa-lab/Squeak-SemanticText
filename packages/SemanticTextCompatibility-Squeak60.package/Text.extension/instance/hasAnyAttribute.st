*SemanticTextCompatibility-Squeak60-testing-pseudo-override
hasAnyAttribute
	"Also see (commentary in) #isPlainText, which is compatible with the String protocol.
	Examples:
		data isStringOrText and: [data isPlainText].
		data isString or: [data isText and: [data hasAnyAttribute not]]."

	^ self notEmpty and: [self runs anySatisfy: [:attributes | attributes notEmpty]]