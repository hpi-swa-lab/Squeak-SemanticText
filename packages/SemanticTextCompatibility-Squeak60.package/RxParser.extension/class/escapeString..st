*SemanticTextCompatibility-Squeak60-utilities-pseudo-override
escapeString: aString
	"Answer a copy of aString which does not contain any unescaped characters. This is the inverse function of String >> #matchesRegex:.
	NB: Basically, we could simply escape every single character in the string, but this would not produce human-readable outputs."

	| special lastIndex nextIndex |
	special := self specialCharacters.
	nextIndex := aString indexOfAnyOf: special startingAt: (lastIndex := 1) ifAbsent: [^ aString].
	^ String new: aString size * 11 // 10 "+10%" streamContents: [:stream |
		[stream
			next: nextIndex - lastIndex putAll: aString startingAt: lastIndex;
			nextPut: $\;
			nextPut: (aString at: nextIndex)]
				doWhileTrue: [(nextIndex := aString indexOfAnyOf: special startingAt: (lastIndex := nextIndex + 1)) > 0].
		stream next: aString size - lastIndex + 1 putAll: aString startingAt: lastIndex]