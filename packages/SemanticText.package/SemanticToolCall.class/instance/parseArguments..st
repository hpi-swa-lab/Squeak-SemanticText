initialize-release
parseArguments: argumentsString

	self arguments:
		([argumentsString withBlanksTrimmed "gpt-audio does this" parseAsOrderedJson]
			ifError: [argumentsString]).