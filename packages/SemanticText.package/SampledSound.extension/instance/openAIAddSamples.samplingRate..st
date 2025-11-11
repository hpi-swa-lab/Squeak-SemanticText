*SemanticText-Providers-OpenAI-streaming
openAIAddSamples: newSamples samplingRate: rate

	originalSamplingRate
		ifNil: [originalSamplingRate := rate]
		ifNotNil: [self assert: originalSamplingRate = rate].
	
	samples := samples ifNil: [newSamples] ifNotNil: [samples , newSamples].
	samplesSize := samples size.
	
	samplesSize >= SmallInteger maxVal ifTrue: [  "this is unlikely..."
		self error: 'sample count must be under ',  SmallInteger maxVal printString].
	
	initialCount := (samplesSize * self samplingRate) // originalSamplingRate.
	
	count := count ifNil: [initialCount] ifNotNil: [count + newSamples size].