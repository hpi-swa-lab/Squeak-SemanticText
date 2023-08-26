preferences
defaultAccountSubscriptionState
	<preference: 'OpenAI API Account Subscription State' categoryList: #(SemanticText OpenAI) description: 'Having provided billing information in your account can raise certain rate limits. Must be one of nil (free account), #shortTime (subscription started <48h ago), and #longTime (subscriptiong started >=48h ago).' type: #String>

	^ (DefaultAccount ifNil: [^ nil]) subscriptionState printString