copying
postCopy

	super postCopy.
	
	tool := tool copy.
	self flag: #todo. "what about nested dictionaries?"
	arguments := arguments collect: [:argument | argument copy].