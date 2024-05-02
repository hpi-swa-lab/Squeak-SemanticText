pragmas
function
	<pragmaParser>

	self flag: #experimental. "There are still some false positive matches for syntax errors."
	
	self scanPast: #pragmaKeyword.
	
	self failUnless: currentToken notNil.
	self scanPast: #string.
	
	self failUnless: currentTokenFirst == $(.
	self scanPast: #leftParenthesis.
	[currentTokenFirst ~= $)] 
		whileTrue:
			[| hasType |
			self failUnless: currentToken notNil.
			hasType := currentToken last = $:.
			self scanPast: #argument.
			
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
	
	self failUnless: currentToken = '>'.
	self scanPast: #primitiveOrExternalCallEnd.