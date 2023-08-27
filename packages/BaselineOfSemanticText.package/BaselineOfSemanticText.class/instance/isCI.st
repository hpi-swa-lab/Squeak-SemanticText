testing
isCI

	^ (self environment classNamed: #SmalltalkCI)
		ifNil: [false]
		ifNotNil: [:sci | (sci getEnv: #CI) = #true]