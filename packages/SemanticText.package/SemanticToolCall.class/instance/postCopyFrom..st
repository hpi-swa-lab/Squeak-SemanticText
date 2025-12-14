copying
postCopyFrom: original

	super postCopyFrom: original.
	
	tool := tool copy.
	arguments ifNotNil:
		[arguments := arguments veryDeepCopy].