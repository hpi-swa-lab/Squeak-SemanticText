copying
postCopy

	super postCopy.
	
	self flag: #todo. "what about nested dictionaries (e.g., raw configs)?"
	arguments := arguments collect: [:value | value copy].