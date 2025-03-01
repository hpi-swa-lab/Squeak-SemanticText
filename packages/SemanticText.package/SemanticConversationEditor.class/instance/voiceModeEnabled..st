accessing
voiceModeEnabled: aBoolean

	self voiceModeEnabled = aBoolean ifTrue: [^ self].
	
	aBoolean ifTrue:
		[self assureSpeechAvailableOr: [^ self]].
	
	voiceModeEnabled := aBoolean.
	self changed: #voiceModeEnabled.
	
	self conversation config outputModalities:
		(self voiceModeEnabled
			ifTrue:
				[((Array streamContents: [:stream |
					(self voiceAutomaton shouldSpeak and: [self voiceAutomaton shouldSynthesize not]) ifTrue:
						[stream nextPut: #audio.
						self voiceAutomaton shouldTranscribeOutput ifTrue:
							[stream nextPut: #text]]])
					ifEmpty: [#(text)])]
			ifFalse:
				[#(text)]).
	self changedVoiceName. "assure config contains any voice iff required"
	
	self voiceModeEnabled
		ifTrue: [self voiceAutomaton startListening]
		ifFalse: [self voiceAutomaton stopVoice].