*SemanticText-Model-Search
semanticFindRankedObjects: number similarToQuery: aString
	"
	((SystemWindow windowsIn: Project current world satisfying: [:ea | ea model isKindOf: Workspace]) collect: #label) semanticFindRankedObjects: 20 similarToQuery: 'open bugs'
	"

	^ self asSemanticCorpus findRankedObjects: number similarToQuery: aString