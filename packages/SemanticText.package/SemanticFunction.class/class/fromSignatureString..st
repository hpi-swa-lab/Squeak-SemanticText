instance creation
fromSignatureString: aStringOrStream

	| matcher |
	aStringOrStream isStream ifFalse:
		[| stream function |
		stream := aStringOrStream readStream.
		function := self fromSignatureString: stream.
		self assert: stream atEnd.
		^ function].
	
	matcher := ['^
		(?<name>
			[a-zA-Z0-9_-]{1,64}
		)
		\s*
		( # comment
			\"
			(?<comment>
				[^\"]*
			)?
			\"
		)?
		\s*
		( # parameter list
			\(
			( # parameter
				\s*
				(?<parameterName>
					\p{L} \w*
				)
				\s*
				( # modifier
					(?<parameterModifier>
						[!?]
					)
					\s*
					|
					(?<parameterModifier>)
				)
				( # type
					\:
					\s*
					(
						(?<parameterSchema>
							\{ .* \}
						)
						(?<parameterType>)
						|
						(?<parameterType>
							\p{L} \w*
						)
						(?<parameterSchema>)
					)
					\s*
					|
					(?<parameterSchema>) (?<parameterType>)
				)
				( # comment
					\"
					(?<parameterComment>
						[^\"]*
					)
					\"
					\s*
					|
					(?<parameterComment>)
				)
				(?: , (?! \s* \)$ ) | (?= \s* \)$ ) ) # comma unless after last parameter
				\s*
			)*
			\s*
			\)
		)?' semanticAsExtendedRegex] once.
	(matcher matchesStreamPrefix: aStringOrStream) ifFalse:
		[^ self error: 'invalid function signature'].
	
	^ self
		name: (matcher keyedSubexpression: 'name')
		description: (matcher keyedSubexpression: 'comment')
		build: [:function |
			(matcher keyedSubexpressions: #parameterName) withIndexCollect: [:name :index |
				function
					addParameter: name
					description:
						(((matcher keyedSubexpressions: #parameterComment) at: index)
							ifEmpty: [])
					type:
						(((matcher keyedSubexpressions: #parameterType) at: index)
							ifEmpty:
								[(((matcher keyedSubexpressions: #parameterSchema) at: index) ifEmpty: ['{}'])
									parseAsOrderedJson])
					required: ((matcher keyedSubexpressions: #parameterModifier) at: index) ~= '?']]