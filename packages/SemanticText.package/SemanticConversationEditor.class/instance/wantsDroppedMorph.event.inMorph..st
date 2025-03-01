updating
wantsDroppedMorph: dropee event: anEvent inMorph: target

	dropee isSystemWindow ifTrue: [^ false].
	
	^ target knownName = #text