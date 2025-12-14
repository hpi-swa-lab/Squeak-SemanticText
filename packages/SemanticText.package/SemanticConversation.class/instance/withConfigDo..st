accessing
withConfigDo: configBlock

	self deprecated: 'Use #updateConfig: for changing the config'.
	configBlock value: self config.