*SemanticText-toolbuilder-kernel
semanticDisplayRichProgressFrom: minVal to: maxVal during: workBlock 

	^ self semanticDisplayRichProgressFrom: minVal to: maxVal updateEvery: 1000 during: workBlock 