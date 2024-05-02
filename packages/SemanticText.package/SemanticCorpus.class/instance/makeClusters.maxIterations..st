private - clusters
makeClusters: nClusters maxIterations: maxIterations

	^ self
		fromDocuments: self documents asArray
		makeClusters: nClusters
		maxIterations: maxIterations