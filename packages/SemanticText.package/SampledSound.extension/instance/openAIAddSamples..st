*SemanticText-Providers-OpenAI-streaming
openAIAddSamples: newSamples

	samples := samples ifNil: [newSamples] ifNotNil: [samples , newSamples].
	samplesSize := samples size.
	
	samplesSize >= SmallInteger maxVal ifTrue: [  "this is unlikely..."
		self error: 'sample count must be under ',  SmallInteger maxVal printString].
	
	initialCount := (samplesSize * self samplingRate) // originalSamplingRate.
	
	count := count + newSamples size.