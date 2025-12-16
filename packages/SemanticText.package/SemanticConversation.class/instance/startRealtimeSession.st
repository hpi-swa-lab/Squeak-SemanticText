completing
startRealtimeSession

	| session |
	self assert: self realtimeSession isNil.
	session := self model startRealtimeSessionFor: self.
	self realtimeSession: session.