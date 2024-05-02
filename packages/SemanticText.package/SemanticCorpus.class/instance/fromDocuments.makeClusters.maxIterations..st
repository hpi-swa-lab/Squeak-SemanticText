private - clusters
fromDocuments: docs makeClusters: nClusters maxIterations: maxIterations 
	"k-means clustering based on original implementation by Felix Wolff in SqPyte, RSqueak."

	| centers changed clusters nDimensions dictionary iterations |
	docs ifEmpty: [^ Dictionary new].
	docs isSequenceable ifFalse: [^ self fromDocuments: docs asArray makeClusters: nClusters maxIterations: maxIterations].
	
	clusters := Array new: nClusters.
	centers := Array new: nClusters.
	nDimensions := docs anyOne embedding size.
	
	1 to: nClusters do: [:cluster |
		clusters at: cluster put: OrderedCollection new.
		centers at: cluster put: (docs at: cluster) embedding].
	
	'making clusters...' semanticDisplayRichProgressFrom: 0 to: maxIterations during: [:bar |
	iterations := 0.
	changed := true.
	[changed and: [(iterations := iterations + 1) <= maxIterations]] whileTrue:
		[bar value: iterations.
		
		"assign all values to clusters"
		1 to: nClusters do: [:cluster | 
			clusters at: cluster put: OrderedCollection new].
		docs do: [:document |
			| bestCluster minDist |
			minDist := 1000000.
			bestCluster := 0.
			1 to: nClusters do: [:cluster |
				| dist |
				dist := self distanceBetween: (centers at: cluster) and: document embedding.
				dist < minDist ifTrue: [
					minDist := dist.
					bestCluster := cluster]].
			(clusters at: bestCluster) add: document].
		"Re-calculate cluster means"
		changed := false.
		1 to: nClusters do: [:cluster |
			| sum |
			sum := Float32Array new: nDimensions.
			(clusters at: cluster) do: [:document |
				sum += document embedding].
			sum /= (clusters at: cluster) size.
			((self distanceBetween: (centers at: cluster) and: sum) < 0.0001) ifFalse:
				[changed := true.
				centers at: cluster put: sum]]]].
	
	dictionary := Dictionary new.
	clusters with: centers do: [:cluster :center |
		cluster ifNotEmpty:
			[dictionary at: center put: cluster]].
	^ dictionary