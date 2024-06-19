accessing
voiceButtonColor

	self flag: #todo."better support for ui themes"
	
	^ self voiceState
		caseOf:
			{[#listening] -> [self userInterfaceTheme get: #cancelColor for: #DialogWindow].
			[#transcribing] -> [Color yellow].
			[#speaking] -> [self userInterfaceTheme get: #okColor for: #DialogWindow]}
		otherwise:
			[self userInterfaceTheme get: #color for: #PluggableButtonMorph]