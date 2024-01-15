swapping
swapOutToDisk

	documents ifNil: [^ self error: 'already swapped out'].
	swapFileName ifNil:
		[swapFileName := '{1}_{2}.corpus.swap' format: {self class name . UUID new}].
	[self writeOnFileNamed: swapFileName] valueSupplyingAnswer: #('*already exists*' 'overwrite that file').
	documents := nil.