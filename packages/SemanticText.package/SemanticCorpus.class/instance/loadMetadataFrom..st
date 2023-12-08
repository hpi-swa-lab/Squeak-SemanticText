fileIn/Out
loadMetadataFrom: aDictionary

	(aDictionary removeKey: #embeddingModel) in: [:name |
		self assert: self embeddingModel name = name description: 'please select the right embeddingModel'].