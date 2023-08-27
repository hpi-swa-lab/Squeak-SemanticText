embeddings
initializeClusters

	self flag: #wip. "Cluster-based search is not yet ready for prime time. The following steps are required:
		* evaluation: taking random samples of documents and comparing recall of bucket search against full search should be fine? or could it happen that missed clusters are irrelevant for desired results? (?)
		* (hyper)parameter tuning: tune k and num_its. simple grid search for the beginning, but on what dataset? does it make a difference? (?) for this, extract kmeans into a class so we can look at quality on the way.
		* initialization methods
		* implement swapping: only load relevant clusters from disk
		* update clusters: can we always increment this? what about other phenomens like fading clusters, would we notice it when they become an issue? (?)
		* interface:
			* revise vocabulary (clusters, index, ...)
			* maybe extract cluster to an (interchangable) class"
	
	clusters := self makeClusters: 16 maxIterations: 3.