actions
chooseVoice

	| voiceNames voiceName |
	voiceNames := self voiceAutomaton allVoiceNames.
	voiceNames ifEmpty: [^ self inform: 'There are no voices!'].
	voiceName := (Project uiManager
		chooseFromLabeledValues:
			(voiceNames
				collect: [:name | name asString capitalized -> name]
				as: OrderedDictionary)
		title: 'Choose voice')
			ifNil: [^ self].
	self voiceName: voiceName.