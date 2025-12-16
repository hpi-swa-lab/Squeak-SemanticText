pragmas
function
	<pragmaParser>

	| parameterNames |
	self flag: #experimental. "There are still some false positive matches for syntax errors."
	
	self scanPast: #pragmaKeyword.
	
	self failUnless: currentToken notNil.
	self scanPast: #string.
	
	self failUnless: currentTokenFirst == $(.
	self scanPast: #leftParenthesis.
	parameterNames := OrderedCollection new.
	[currentTokenFirst ~= $)] 
		whileTrue:
			[| parameterName hasType |
			parameterName := currentToken.
			self failUnless: parameterName notNil.
			self scanPast: ((parameterNames includes: parameterName) ifFalse: [#argument] ifTrue: [#invalid]).
			parameterNames addLast: parameterName.
			hasType := parameterName last = $:.
			
			hasType ifTrue:
				[currentTokenFirst = ${
					ifFalse: [self scanPast: #externalCallType]
					ifTrue:
						[| stream |
						stream := source readStream.
						stream skip: sourcePosition - 2.
						[[Json readFrom: stream]
							ensure:
								[currentTokenSourcePosition := sourcePosition.
								sourcePosition := stream position + 1.
								currentToken := source copyFrom: currentTokenSourcePosition to: sourcePosition - 1]]
									on: JsonSyntaxError do: [self fail].
						self scanPast: #externalCallType]].
			
			(currentTokenFirst = $? or: [currentTokenFirst = $!])
				ifTrue:
					[self scanPast: #blockArgColon]
				ifFalse:
					[self failUnless: (currentTokenFirst = $) or: [currentToken = ','])].
			
			currentToken = ',' ifTrue:
				[self scanPast: #blockArgColon]].
	
	self failUnless: currentTokenFirst == $).
	self scanPast: #rightParenthesis.
	
	currentToken = 'streamingArguments:' ifTrue:
		[self scanPast: #pragmaKeyword.
		self currentTokenType = #name
			ifTrue: [self scanPast: (self resolvePragmaArgument: currentToken)] 
			ifFalse: [self parseLiteral: false]].
	
	self failUnless: currentToken = '>'.
	self scanPast: #primitiveOrExternalCallEnd.