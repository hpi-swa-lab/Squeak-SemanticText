support
named: selector

	| model |
	model := self basicNamed: (self perform: selector).
	self assert: (model isKindOf: self).
	^ model