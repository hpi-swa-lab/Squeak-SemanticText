*SemanticTextCompatibility-Squeak60-instance creation-pseudo-override
selector: aSymbol arguments: anArray
	"Convenience for message protocol, i.e., #sendTo:".

	^ self new
		selector: aSymbol;
		arguments: anArray;
		yourself