copying
postCopyFrom: original

	super postCopy.
	
	self basicProperties ifNotNil: [:props |
		| copier |
		copier := DeepCopier new: self initialDeepCopierSize.
		copier references at: original put: self.
		properties := props veryDeepCopyUsing: copier].