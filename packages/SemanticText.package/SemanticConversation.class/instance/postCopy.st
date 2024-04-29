copying
postCopy

	super postCopy.
	
	config := config copy.
	messages := messages copy.
	messages do: [:message | message conversation: self].
	toolSpecs := toolSpecs copy.