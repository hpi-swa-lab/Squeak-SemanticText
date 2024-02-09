copying
postCopy

	super postCopy.
	
	documents do: [:ea |
		ea corpus: self].