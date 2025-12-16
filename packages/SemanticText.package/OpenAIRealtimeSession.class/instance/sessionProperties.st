client events - private
sessionProperties

	self config temperature ifNotNil:
		[RemarkNotification signal: 'skipping temperature for realtime model'].
	self config nucleusSamplingMass ifNotNil:
		[RemarkNotification signal: 'skipping nucleus sampling mass for realtime model'].
	self config shouldStream = false ifTrue:
		[RemarkNotification signal: 'realtime session will stream messages anyway'].
	
	^ JsonObject new
		type: #realtime;
		audio: (JsonObject new
			input: self audioInputProperties;
			output: self audioOutputProperties);
		include: (Array streamContents: [:stream |
			self shouldLogTranscriptionProbabilities ifTrue:
				[stream nextPut: 'item.input_audio_transcription.logprobs']]);
		in: [:json |
			self instructions ifNotNil: [:instructions |
				json instructions: instructions]];
		max_output_tokens: (self config maxTokens ifNil: ['inf']);
		model: self model name;
		output_modalities:
			(self config outputModalities
				ifNil: [#(text)]
				ifNotNil:
					[(self config outputModalities includes: #audio)
						ifTrue: [self config outputModalities copyWithout: #text]
						ifFalse: [self config outputModalities]]);
		in: [:json | self addToolSpecToInput: json];
		yourself