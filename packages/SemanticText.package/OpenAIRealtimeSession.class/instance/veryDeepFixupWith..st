copying
veryDeepFixupWith: deepCopier

	super veryDeepFixupWith: deepCopier.
	
	process := nil.
	webSocket := nil.
	
	self veryDeepFixupActionMapWith: deepCopier.