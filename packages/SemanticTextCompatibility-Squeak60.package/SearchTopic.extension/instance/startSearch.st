*SemanticTextCompatibility-Squeak60-private-pseudo-override
startSearch

	self stopSearch.
	results := OrderedCollection new.
	
	self topicsToSearch ifEmpty: [
		self changed: #contents.
		^ self].
	
	process := [
		self doSearch.
		self triggerUpdateContents
	] forkAt: Processor userBackgroundPriority.