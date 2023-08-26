copying
veryDeepFixupWith: deepCopier

	super veryDeepFixupWith: deepCopier.
	
	self veryDeepFixupActionMapWith: deepCopier.
	
	self cancel. "See comment in #veryDeepCopyWith:."