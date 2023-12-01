*SemanticTextCompatibility-Squeak60-enumerating-pseudo-override
timesCollect: aBlock 
	"Evaluate the argument, aBlock, the number of times represented by the 
	receiver. Collect all results and answer them."

	^ Array streamContents: [:results |
		self timesRepeat: [results nextPut: aBlock value]]