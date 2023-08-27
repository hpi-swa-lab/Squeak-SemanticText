app - feedback
defaultFeedbackText

	^ '<br><br><i>Reported from {1} (VM: {2}), for version of {3} last updated at {4}.</i>' asTextFromHtml format:
		{SystemVersion current.
		([Smalltalk vm openSmalltalkVMBuildNumber] ifError: [nil]) ifNil: [Smalltalk platformSourceVersion].
		self appName.
		self latestTimeStamp}