initialize-release
cleanUp: aggressive

	aggressive ifTrue:
		[DefaultCorpus := nil.
		CachedEmbeddings := nil].