fileIn/Out
loadMetadataFrom: aDictionary

	(aDictionary removeKey: #embeddingModel) in: [:name |
		self embeddingModel:
			(SemanticText registeredEmbeddingModels detect: [:model | model name = name])].
	
	(aDictionary removeKey: #embeddingSize ifAbsent: ["backward compatibility"]) ifNotNil: [:embeddingSize |
		self embeddingSize: embeddingSize].