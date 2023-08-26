accessing
defaultAccount

	^ DefaultAccount ifNil: [DefaultAccount := self new]