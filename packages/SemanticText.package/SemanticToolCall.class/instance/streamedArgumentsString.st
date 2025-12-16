accessing
streamedArgumentsString

	^ self arguments ifEmpty: [''] ifNotEmpty: [self argumentsJsonString]