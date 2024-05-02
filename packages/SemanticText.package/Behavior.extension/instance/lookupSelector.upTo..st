*SemanticText-Model-Agents-accessing method dictionary-pseudo-override
lookupSelector: selector upTo: aSuperclass
	"Look up the given selector in my methodDictionary.
	Return the corresponding method if found.
	Otherwise chase my superclass chain and try again.
	Do not search beyond aSuperclass.
	Return nil if no method is found."
	| lookupClass |
	lookupClass := self.
	[lookupClass == nil]
		whileFalse: 
			[(lookupClass includesSelector: selector)
				ifTrue: [^ lookupClass compiledMethodAt: selector].
			lookupClass == aSuperclass ifTrue: [^  nil].
			lookupClass := lookupClass superclass].
	^ nil