accessing
voiceButtonColor

	self flag: #todo."better support for ui themes"
	
	^ self voiceState
		caseOf:
			{[#listening] -> [self userInterfaceTheme get: #okColor for: #DialogWindow].
			[#transcribing] -> [Color yellow].
			[#speaking] -> [self userInterfaceTheme get: #cancelColor for: #DialogWindow].
			[#listeningAndSpeaking] -> [Color lightBlue]}
		otherwise:
			[self userInterfaceTheme get: #color for: #PluggableButtonMorph]