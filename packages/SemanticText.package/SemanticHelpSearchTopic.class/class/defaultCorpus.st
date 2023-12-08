caches
defaultCorpus

	^ DefaultCorpus ifNil: [DefaultCorpus :=
		SemanticPluggableCorpus titleBlock: #title contentBlock: #contents]