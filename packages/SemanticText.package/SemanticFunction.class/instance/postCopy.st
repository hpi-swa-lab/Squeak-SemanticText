copying
postCopy

	super postCopy.
	
	parameters := parameters collect: [:parameter | parameter copy].