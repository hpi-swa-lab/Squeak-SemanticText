(PackageInfo named: 'SemanticText') postscript: '"openai: add any new models"
OpenAIModel withAllSubclassesDo: #initialize.

"openai: add account option to ignore certificate (599cd9c)"
OpenAIAccount allSubInstancesDo: [:account |
	(account instVarNamed: ''ignoreCertificate'') ifNil:
		[account instVarNamed: ''ignoreCertificate'' put: false]].

"search/openai: add embedding config with embeddingSize (128e88e)"
SemanticCorpus allSubInstancesDo: [:corpus |
	corpus embeddingConfig ifNil:
		[corpus embeddingConfig: corpus defaultEmbeddingConfig]].
OpenAIEmbeddingModel allSubInstancesDo: [:model |
	(model baseConfig isKindOf: SemanticEmbeddingConfig) ifFalse:
		[model baseConfig: (model baseConfig as: SemanticEmbeddingConfig)]].'!
