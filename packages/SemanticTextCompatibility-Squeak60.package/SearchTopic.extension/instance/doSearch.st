*SemanticTextCompatibility-Squeak60-searching-pseudo-override
doSearch
	"Extension point. Subclasses may override this, e.g., to implement different search strategies."

	(self topicsToSearch
		sorted: [:t1 :t2 | t1 priorityForSearch <= t2 priorityForSearch])
		do: [:topic |
			| nestedResults  |
			nestedResults := OrderedCollection new.
			self mutex critical: [results add: topic -> nestedResults].
			self find: self term in: {topic} results: nestedResults].
	
	results add: 'Search finished.' translated.